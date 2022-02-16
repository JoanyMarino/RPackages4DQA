library(readxl)
library(tidyverse)
library(ggpubr)

pkgs <- read_excel("~/Documents/2021-10_DataQualityToolsReviewPaper/DQ_packages_domains.xlsx")

pkgs_long <- pkgs %>%  
  mutate(across(xplorerr, as.character)) %>% 
  pivot_longer(
    cols = analyzer:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = TRUE) %>% 
  mutate(Dimension = factor(Dimension),
         Domain = factor(Domain),
         Package = factor(Package)) %>%  
  # Count features by package
  mutate(Count = str_count(Feature, '[0-9.]+')) %>%
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
                              "Unexpected association",
                              "Disagreement of rep. meas.", 
                              "Unique values"))

# Rename levels for plotting
levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Accuracy"] <- "Acc"
levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Completeness"] <- "Com"
levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Consistency"] <- "Con"
levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Integrity"] <- "Int"
levels(pkgs_long$Dimension)[levels(pkgs_long$Dimension) == "Other"] <- "Oth"


# Bar plot
fig4 <- ggplot(pkgs_long, aes(x = Dimension, y = Count))+
  geom_bar(
    aes(fill = Domain), stat = "identity", color = "white",
    position = "dodge2" #position_dodge(0.9)
  ) +
  facet_wrap(~ Package) + 
  labs(y = "No. of indicators")  +
  theme_bw(base_size = 14.5) + 
  theme(strip.background = element_rect(fill="white"))  

ggsave("figs/fig4.pdf", fig4, width = 14, height = 8.5, units = "in", dpi = 400)


# Another option
# ggplot(pkgs_long, aes(x = Dimension, y = Count))+
#   geom_bar(
#     aes(fill = Domain), stat = "identity", color = "white",
#     position = "dodge2"
#     # Keep all bars of equal width
#     # position = position_dodge2(preserve = "single")
#   ) +
#   facet_wrap(~ Package) + 
#   labs(y = "No. of indicators")  +
#   theme_bw() + 
#   theme(strip.background = element_rect(fill="white"))
