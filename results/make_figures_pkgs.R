# Arrange data and plot number of indicators and domains by packages

library(readxl)
library(tidyverse)
library(ggpubr)

# Arrange data ----

# REPLACE PATH TO SPREADSHEET
# TO DO: Move file to git repo
pkgs <- read_excel("~/Documents/2021-10_DataQualityToolsReviewPaper/DQ_packages_dimensions_v2.xlsx")

pkgs <- subset(pkgs, select=-c(analyzer, discoveR))

# str_count(test, '(^|,)[0-9]+d(,|$)')
# str_count(test, '(^|,)[0-9]+[A-Z]?(,|$)')

pkgs_long <- pkgs %>%  
  mutate(across(xplorerr, as.character)) %>% 
  pivot_longer(
    cols = assertable:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = TRUE) %>% 
  mutate(Dimension = factor(Dimension),
         Domain = factor(Domain),
         Package = factor(Package)) %>%
  # remove spaces
  mutate(Feature = gsub("\\s+", "", Feature, perl = TRUE)) %>%
  # Count features by package
  mutate(Descriptors = str_count(Feature, '(^|,)[0-9]+d(,|$)'),
         Indicators = str_count(Feature, '(^|,)[0-9]+[A-Z]?(,|$)')) %>%
  # mutate(Descriptors = replace_na(Descriptors, 0),
  #        Indicators = replace_na(Indicators, 0)) %>%
  # Reorder dimension levels for plot 
  mutate(Dimension = fct_relevel(Dimension, 
                              "Integrity", 
                              "Completeness", 
                              "Consistency", 
                              "Accuracy")) %>%
  # Reorder domain levels for plot 
  mutate(Domain = fct_relevel(Domain, 
                              "Structural data set error", 
                              "Data set combination error", 
                              "Value format error", 
                              "Crude missingness",
                              "Qualified missingness",
                              "Range and value violations",
                              "Contradictions",
                              "Unexpected distribution",
                              "Unexpected association"
                              # No package assesses this
                              # "Disagreement of rep. meas."
                              )) 

# Color palette
pal2 <- c("#0072B2", "#009E73", "#E69F00", "#D55E00")

# Figure 4: Indicators by package ----
dq_indicators <- pkgs_long %>% select(!c(Feature, Descriptors))

pkgs_indicators <- dq_indicators %>% count(Dimension, Package)

fig4 <- ggplot(pkgs_indicators, 
               aes(x = Package, y = n, label = n, 
                   fill = forcats::fct_rev(Dimension))) +
  geom_bar(stat = "identity", 
           color = "white",
           width=1) +
  geom_text(size = 4, position = position_stack(vjust = 0.5), 
            colour = "white") +
  scale_fill_manual(values = rev(pal2), 
                    guide = guide_legend(reverse = TRUE),
                    name = "Dimension") +  
  coord_flip() +
  scale_x_discrete(limits = rev(levels(pkgs_indicators$Package))) +
  scale_y_continuous(n.breaks = 6, limits = c(0, 10),
                     expand = expansion(add = c(0, .1))) +
  labs(y = "No. of Domains with Data Quality Indicators")  +
  theme_classic() +
  theme(aspect.ratio = 1.1, 
        axis.line.y = element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x=element_text(size=rel(1.6)),
        axis.text.y=element_text(size=rel(1.8)),
        axis.title.x=element_text(size=rel(1.7)), 
        axis.title.y= element_blank(),
        legend.position="top", 
        legend.justification='right',
        legend.title = element_text(size=rel(1.5)),
        legend.text = element_text(size=rel(1.4))
  ) 
fig4


# Figure 4: Descriptors by package ----
pkgs_domains <- pkgs_long %>% count(Dimension, Package)




fig4 <- ggplot(pkgs_domains, 
               aes(x = Package, y = n, label = n, 
                   fill = forcats::fct_rev(Dimension))) +
  geom_bar(stat = "identity", 
           color = "white",
           width=1) +
  geom_text(size = 4, position = position_stack(vjust = 0.5), 
            colour = "white") +
  scale_fill_manual(values = rev(pal2), 
                    guide = guide_legend(reverse = TRUE),
                    name = "Dimension") +  
  coord_flip() +
  scale_x_discrete(limits = rev(levels(pkgs_domains$Package))) +
  scale_y_continuous(n.breaks = 6, limits = c(0, 10),
                     expand = expansion(add = c(0, .1))) +
  labs(y = "No. of Domains with Data Quality Indicators")  +
  theme_classic() +
  theme(aspect.ratio = 1.1, 
        axis.line.y = element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x=element_text(size=rel(1.6)),
        axis.text.y=element_text(size=rel(1.8)),
        axis.title.x=element_text(size=rel(1.7)), 
        axis.title.y= element_blank(),
        legend.position="top", 
        legend.justification='right',
        legend.title = element_text(size=rel(1.5)),
        legend.text = element_text(size=rel(1.4))
  ) 
fig4


# Export ----
# ggsave("figs/fig4_v5.pdf", fig4, width = 14, height = 8.5, units = "in", dpi = 400)
# ggsave("figs/fig5_v4.pdf", fig5, width = 14, height = 8.5, units = "in", dpi = 400)

# Rename levels for plotting
# levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Accuracy"] <- "Acc"
# levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Completeness"] <- "Com"
# levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Consistency"] <- "Con"
# levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Integrity"] <- "Int"

# Rename levels for plotting
# levels(pkgs_domains$Dimension)[levels(pkgs_domains$Dimension) == "Acc"] <- "Accuracy"
# levels(pkgs_domains$Dimension)[levels(pkgs_domains$Dimension) == "Com"] <- "Completeness"
# levels(pkgs_domains$Dimension)[levels(pkgs_domains$Dimension) == "Con"] <- "Consistency"
# levels(pkgs_domains$Dimension)[levels(pkgs_domains$Dimension) == "Int"] <- "Integrity"

# levels(pkgs_long$Package)[levels(pkgs_long$Package) == "dataReporter1"] <- "Int"
# levels(pkgs_long$Package)[levels(pkgs_long$Package) == "MOQA2"] <- "Int"
# levels(pkgs_long$Package)[levels(pkgs_long$Package) == "validate3"] <- expression(validate^3)


# Color palette
# pal1 <- c("#083666", "#005191", "#9EB7E5", "#00B691", "#0C6F5A", "#F2CF63", "#E59100", "#F0433A", "#C9283E", "#820333", "#2E112D")

# Figure 5: Indicators by package ----
# 
# fig5 <- ggplot(pkgs_long, aes(x = Dimension, y = Count))+
#   geom_bar(
#     aes(fill = Domain), stat = "identity", color = "white",
#     # Keep all bars of equal width
#     position = position_dodge2(preserve = "single")
#     # position = "dodge2" #position_dodge(0.9)
#   ) +
#   facet_wrap(~ Package) +
#   scale_fill_manual(values = pal1) +  
#   labs(y = "No. of indicators")  +
#   theme_bw(base_size = 14.5) + 
#   theme(strip.background = element_rect(fill="white"),
#         axis.text.x = element_text(angle = 45, hjust=1),
#         panel.grid.minor = element_blank())  
# fig4


