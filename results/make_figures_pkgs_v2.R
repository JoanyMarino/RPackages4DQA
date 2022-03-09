# Arrange data and plot number of indicators and domains by packages

library(readxl)
library(tidyverse)
library(ggpubr)
library(patchwork)

# Arrange data ----

dq_table <- read_excel("./data/DQ_paper_table_v06_indicators.xlsx")

# Remove last rows
dq_table <- subset(dq_table, select=-c(discoveR, mdapack))
dq_table <- dq_table[-seq(1, 14),]
dq_table <- dq_table[-seq(11, nrow(dq_table)),]

pkgs <-  dq_table %>% 
  separate(Criteria, c("Dimension", "Domain"), extra = "merge", fill = "right") %>% 
  # subset(select = -Domain) %>%  
  pivot_longer(
    cols = assertable:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = TRUE) %>%
  mutate(Dimension = factor(Dimension),
         Domain = factor(Domain),
         Package = factor(Package)) %>%
  group_by(Dimension, Domain, Package) %>%
  summarize(Feature = toString(Feature)) %>%
  ungroup %>%
  # remove spaces
  mutate(Feature = gsub("\\s+", "", Feature, perl = TRUE)) %>% 
  separate_rows(Feature) %>% 
  arrange(Package, Dimension, Feature) %>%
  mutate(Package = recode(Package, 
                          dataReporter1 = "dataReporter^1", 
                          MOQA2 = "MOQA^2", 
                          validate3 = "validate^3"))

pkgs_long <-  pkgs %>% 
  mutate(Attribute = case_when(
    str_detect(Feature, pattern = '(^|,)[0-9]+d(,|$)') == TRUE ~ "Descriptor", 
    TRUE ~ "Indicator"
  )) %>%
  subset(select = -Feature) %>%
  unique() %>%
  group_by(Dimension, Domain, Package) %>%
  summarize(Attributes = toString(Attribute)) %>%
  ungroup %>%
  mutate(Attributes = case_when(
    str_detect(Attributes, pattern = ',') == TRUE ~ "Indicator", 
    TRUE ~ Attributes
  ) )

pkgs_long$Combined <- paste(pkgs_long$Dimension, pkgs_long$Attributes)
pkgs_long$Combined <- as.factor(pkgs_long$Combined)
pkgs_long <- pkgs_long %>%
  mutate(Combined = fct_relevel(Combined, 
                                "Accuracy Descriptor",
                                "Accuracy Indicator",
                                "Consistency Descriptor",
                                "Consistency Indicator",
                                # "Completeness Descriptor",
                                "Completeness Indicator",
                                "Integrity Descriptor",
                                "Integrity Indicator"
  )) 

pal2 <- c("#005191", "#56B4E9", # blues
          "#FCBD0D", # yellow
          "#007556", "#00CC96", # greens
          "#8F2A27", "#DB917D") # reds 

# Figure 4: Indicators by package ----
fig4 <- ggplot(pkgs_long, 
               aes(x = Package,
                   group = Combined,
                   fill = Combined 
                   # y = "identity",
                   # label = "identity"
               )) +
  geom_bar(stat = "count", 
           color = "white",
           width=1) +
  # geom_text(size = 4, position = position_stack(vjust = 0.5), 
  #           colour = "white") +
  stat_count(geom = "text", colour = "white", size = 3.5,
             aes(label = ..count..),position=position_stack(vjust=0.5)) +
  scale_fill_manual(values = rev(pal2), 
                    guide = guide_legend(reverse = TRUE),
                    name = "Feature by Dimension") +  
  coord_flip() +
  scale_x_discrete(limits = rev(levels(pkgs_long$Package)), 
                   labels = rev(parse(text = levels(pkgs_long$Package)))) +
  scale_y_continuous(n.breaks = 8, limits = c(0, 10),
                     expand = expansion(add = c(0, .1))) +
  labs(y = "No. of Domains") +
  theme_classic() +
  theme(aspect.ratio = 1.1, 
        axis.line.y = element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x=element_text(size=rel(1.6)),
        axis.text.y=element_text(size=rel(1.8)),
        axis.title.x=element_text(size=rel(1.7)), 
        axis.title.y= element_blank(),
        legend.position="top", 
        # legend.justification='right',
        legend.title = element_text(size=rel(1.5)),
        legend.text = element_text(size=rel(1.4))
  ) 

fig4

# Export ----
ggsave("figs/fig4_v10.pdf", fig4, width = 14, height = 8.5, units = "in", dpi = 400)
