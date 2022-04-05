# first try: Visualize.CRAN.Downloads - too many packages here for a good visualisation
#library(Visualize.CRAN.Downloads)
#processPckg(c("assertable", "assertive", "assertr", "clickR", "DataExplorer", "dataquieR", "dataReporter", "DescTools", "dlookr", "DQAstats", "ExPanDaR", "explore", "funModeling", "inspectdf", "IPDFileCheck", "MOQA", "mStats", "pointblank", "sanityTracker", "skimr", "SmartEDA", "StatMeasures", "summarytools", "testdat", "validate", "visdat", "xray"), 
#            opts = c(#"nointeractive", 
#              "noMovAvg", #"noConfBand", 
#                     "compare", "noSummary"), device = "screen")

# get number of downloads per package
library(cranlogs)
dwn <- cran_downloads(packages = c("assertable", "assertive", "assertr", "clickR", "DataExplorer", "dataquieR", "dataReporter", "DescTools", "dlookr", "DQAstats", "ExPanDaR", "explore", "funModeling", "inspectdf", "IPDFileCheck", "MOQA", "mStats", "pointblank", "sanityTracker", "skimr", "SmartEDA", "StatMeasures", "summarytools", "testdat", "validate", "visdat", "xray"), 
                      from = "2018-04-01", to = "2022-03-31")

# get date of first publication per package
pkg_publ <- sapply(unique(dwn$package), function(pp) {
  pkg_hist <- pkgsearch::cran_package_history(pp)
  min(pkg_hist$`Date/Publication`)
})

# group packages as in our review
pkg_groups <- data.frame(package = c("assertable", "assertive", "assertr", "clickR", "DataExplorer", "dataquieR", "dataReporter", "DescTools", "dlookr", "DQAstats", "ExPanDaR", "explore", "funModeling", "inspectdf", "IPDFileCheck", "MOQA", "mStats", "pointblank", "sanityTracker", "skimr", "SmartEDA", "StatMeasures", "summarytools", "testdat", "validate", "visdat", "xray"),
                         group_package = c("explorative", "rule-based", "dq focus")[c(2,2,2,1,1,3,2,1,1,3,1,1,1,2,2,3,1,3,2,1,1,1,1,2,2,1,1)],
                         first_publ = pkg_publ)

library(dplyr)
library(lubridate)
Sys.setlocale(category = "LC_TIME", locale = "English")
library(ggplot2)

# cumulative numbers
#dwn_cumsum <- dwn %>%
#  group_by(package) %>%
#  mutate(cumsum = cumsum(count))

# set download numbers from 0 to NA before first release
dwn_cut <- left_join(dwn, pkg_groups) %>%
  mutate(count = ifelse(date < first_publ, NA, count)) %>%
  select(-first_publ)

# summarise download numbers per month
dwn_mon <- dwn_cut %>% 
  mutate(group_month = floor_date(date, "months")) %>%
  group_by(package, group_month) %>% 
  summarise(count_mon = sum(count)) %>%
  ungroup() %>%
  mutate(date_label = paste(month(group_month, label = TRUE), year(group_month))) %>%
  left_join(., pkg_groups[,1:2])

# get order of packages by total number of downloads in this time period
dwn_sum <- dwn_mon %>% 
  group_by(package) %>% 
  summarise(total = sum(count_mon, na.rm = TRUE)) %>%
  arrange(desc(total))
dwn_sum$package_label <- apply(dwn_sum, 1, function(rr) { 
  paste0(rr[1], " (", as.numeric(rr[2]), ")") })
dwn_sum <- left_join(dwn_sum, pkg_groups[,1:2])

# plots
pal2 <- c("#005191", "#56B4E9", # blues
          "#FCBD0D", # yellow
          "#007556", "#00CC96", # greens
          "#8F2A27", "#DB917D") # reds 
mypal <- rep(pal2, 4)[1:27]
mylintyp <- rep(1:4, each = 7)[1:27]
#mypal2 <- viridis::viridis(n=27)
mypal3 <- RColorBrewer::brewer.pal(11, "Spectral")
mypal3 <- rep(mypal3, 3)[1:27]
mylintyp3 <- rep(1:3, each=11)[1:27]

ggplot(dwn_mon, aes(x = group_month, y = count_mon, group = package)) +
  geom_line(size = 1, aes(col = package)) +
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_continuous(expand = expansion(mult = 0.01)) + 
  labs(y = "number of downloads per month", x = "") +
  guides(colour = guide_legend(override.aes = list(size = 0.6))) #+
  #scale_color_manual(values = mypal2, labels = dwn_sum$package_label)

# apply order of packages by total number of downloads
dwn_mon$package <- factor(dwn_mon$package, levels = dwn_sum$package)

p0 <- ggplot(dwn_mon, aes(x = group_month, y = count_mon, group = package)) +
  geom_line(size = 1, aes(col = package, linetype = package)) +
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_continuous(expand = expansion(mult = 0.01)) + 
  labs(y = "number of downloads per month", x = "") +
  scale_color_manual(values = mypal, labels = dwn_sum$package_label) +
  scale_linetype_manual(values = mylintyp, labels = dwn_sum$package_label) +
  guides(colour = guide_legend(override.aes = list(size = 0.6)))
p0

# log scale?
p0 + scale_y_log10()
p0 + scale_y_log10() + scale_linetype_manual(values = rev(mylintyp), labels = dwn_sum$package_label)
# other colors?
ggplot(dwn_mon, aes(x = group_month, y = count_mon, group = package)) +
  geom_line(size = 1, aes(col = package, linetype = package)) +
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_log10(expand = expansion(mult = 0.01)) + 
  labs(y = "number of downloads per month", x = "") +
  guides(colour = guide_legend(override.aes = list(size = 0.6))) +
  scale_color_manual(values = mypal3, labels = dwn_sum$package_label) +
  scale_linetype_manual(values = mylintyp3, labels = dwn_sum$package_label)

# group packages?
ggplot(dwn_mon, aes(x = group_month, y = count_mon, group = package, col = package, linetype = package)) +
  geom_line(size = 1) +
  facet_wrap(~ group_package, ncol = 1, scales = "free_y") + 
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_continuous(expand = expansion(mult = 0.03)) + 
  labs(y = "number of downloads per month", x = "") +
  scale_color_manual(values = mypal) +
  scale_linetype_manual(values = mylintyp)

# separate legend for each panel
p1 <- dwn_mon %>%
  filter(group_package == "dq focus") %>%
  ggplot(aes(x = group_month, y = count_mon, group = package, col = package, linetype = package)) +
  geom_line(size = 1) +
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_continuous(expand = expansion(mult = 0.03)) + 
  labs(y = "number of downloads per month", x = "") +
  scale_color_manual(values = mypal, 
                     labels = dwn_sum$package_label[which(dwn_sum$group_package == "dq focus")]) +
  scale_linetype_manual(values = mylintyp, 
                        labels = dwn_sum$package_label[which(dwn_sum$group_package == "dq focus")]) +
  guides(colour = guide_legend(override.aes = list(size = 0.6)))
p2 <- dwn_mon %>%
  filter(group_package == "explorative") %>%
  ggplot(aes(x = group_month, y = count_mon, group = package, col = package, linetype = package)) +
  geom_line(size = 1) +
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_continuous(expand = expansion(mult = 0.03)) + 
  labs(y = "number of downloads per month", x = "") +
  scale_color_manual(values = mypal, 
                     labels = dwn_sum$package_label[which(dwn_sum$group_package == "explorative")]) +
  scale_linetype_manual(values = mylintyp, 
                        labels = dwn_sum$package_label[which(dwn_sum$group_package == "explorative")]) +
  guides(colour = guide_legend(override.aes = list(size = 0.6)))
p3 <- dwn_mon %>%
  filter(group_package == "rule-based") %>%
  ggplot(aes(x = group_month, y = count_mon, group = package, col = package, linetype = package)) +
  geom_line(size = 1) +
  theme_light() +
  scale_x_date(expand = c(0,0)) +
  scale_y_continuous(expand = expansion(mult = 0.03)) + 
  labs(y = "number of downloads per month", x = "") +
  scale_color_manual(values = mypal,
                     labels = dwn_sum$package_label[which(dwn_sum$group_package == "rule-based")]) +
  scale_linetype_manual(values = mylintyp, 
                        labels = dwn_sum$package_label[which(dwn_sum$group_package == "rule-based")]) +
  guides(colour = guide_legend(override.aes = list(size = 0.6)))

library(patchwork)
p4 <- p1 / p2 / p3 + 
  plot_annotation(tag_levels = "A", tag_prefix = "(", tag_suffix = ")")
p4

# export
ggsave(p0, filename = "figs/fig5_v1.pdf", width = 12, height = 7, units = "in", dpi = 400)
ggsave(p0 + scale_y_log10(), filename = "figs/fig5_v2.pdf", width = 12, height = 7, units = "in", dpi = 400)
ggsave(p4, filename = "figs/fig5_v3.pdf", width = 12, height = 12, units = "in", dpi = 400)
