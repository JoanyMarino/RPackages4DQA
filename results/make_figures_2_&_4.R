# Arrange data and plot number of packages by categories

library(tidyverse)
library(dplyr)
library(readxl)

source("./000_CONVERT/convert.R")
input <- "./data/DQ revision overview third consensus_2022-04-05_19-10.xlsx"
output <- "./data/DQ_paper_table_v08.xlsx"
convert_tables(input, output)


# Arrange data ----

dq_table <- read_excel("./data/DQ_paper_table_v07.xlsx")

# Remove last rows
# dq_table <- dq_table[-seq(25, nrow(dq_table)),]
# dq_table <- subset(dq_table, select=-c(discoveR, mdapack))

# Split tables
dq_broad_wide <- dq_table[c(1:15),]
dq_broad_wide <- dq_broad_wide[-2,]
dq_domains_wide <- dq_table[c(26:37),]
dq_domains_wide <- dq_domains_wide[-c(4,7),]

# Figure 4: Broad criteria ----

# Convert to long format
dq_long <- dq_broad_wide %>%  
  pivot_longer(
    cols = assertable:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = FALSE) %>% 
  mutate(Criteria = factor(Criteria),
         Package = factor(Package), 
         Feature = case_when(!is.na(Feature) ~ "Incorporated", 
                             # else, no
                             TRUE ~ "Not incorporated")) 

# Count
dq_broad <- dq_long %>% 
  group_by(Criteria, Feature) %>% 
  tally() 

# Order factors for plotting
dq_broad$Criteria <- factor(dq_broad$Criteria, 
                            levels = rev(c("Explicit reference to data quality", 
                                           "Based on a data quality framework", 
                                           "Control via GUI",
                                           "Reproducibility via programming",
                                           "Single function call for output",
                                           "Report generation (not only console)",
                                           "Input of metadata through functions",
                                           "Input of metadata through separate file",
                                           "Grading of data quality issues",
                                           "Data set summary/overview",
                                           "Descriptive summary statistics",
                                           "Descriptive statistics graphs - univariate",
                                           "Descriptive statistics graphs - multivariate",
                                           "Handles string properties")))

dq_broad$Feature <- factor(dq_broad$Feature, 
                           levels = c("Incorporated", "Not incorporated"))

fig4 <- ggplot(dq_broad, 
               aes(fill = forcats::fct_rev(Feature), y = n, x = Criteria, label = n)) +
  geom_bar(position = "fill", 
           stat = "identity", 
           color = "white") +
  geom_text(position = position_fill(vjust = 0.5),
            colour = "white", 
            size = rel(5.5)) +
  scale_fill_manual(values = c("Incorporated" = "#005191", 
                               "Not incorporated" = "#E59100")) +
  coord_flip() + 
  labs(y = "No. of Domains")  +
  theme_classic() +
  theme(line = element_blank(), 
        axis.text.x=element_blank(),
        axis.text.y=element_text(size=rel(1.8)),
        axis.title.x=element_text(size=rel(1.5)), 
        axis.title.y=element_blank(), 
        legend.title = element_blank(),
        legend.position="top", 
        legend.justification='right',
        legend.text = element_text(size=rel(1.3))
  )

# Figure 2: Data Quality criteria ----

# Convert to long format
dq_domains_long <- dq_domains_wide %>%  
  pivot_longer(
    cols = assertable:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = FALSE) %>% 
  mutate(Criteria = factor(Criteria),
         Package = factor(Package), 
         Feature = case_when(!str_detect(Feature, "D") ~ "Indicator", 
                             str_detect(Feature, "D") ~ "Descriptor", 
                             # else, no
                             TRUE ~ "Not incorporated")) 

dq_domains <- dq_domains_long %>% 
  group_by(Criteria, Feature) %>% 
  tally() 

dq_domains$Criteria <- factor(dq_domains$Criteria, 
                              levels = rev(c("Integrity: Structural data set error", 
                                             "Integrity: Data set combination error", 
                                             "Integrity: Value format error",
                                             "Completeness: Crude missingness",
                                             "Completeness: Qualified missingness",
                                             "Consistency: Range and value violations",
                                             "Consistency: Contradictions",
                                             "Accuracy: Unexpected distribution",
                                             "Accuracy: Unexpected association",
                                             "Accuracy: Disagreement of rep. meas.")))

dq_domains$Feature <- factor(dq_domains$Feature, 
                             levels = c("Indicator", "Descriptor", "Not incorporated"))

fig2 <- ggplot(dq_domains, 
               aes(fill = forcats::fct_rev(Feature), y = n, x = Criteria, label = n)) +
  geom_bar(position = "fill", 
           stat = "identity", 
           color = "white") +
  geom_text(position = position_fill(vjust = 0.5),
            colour = "white", 
            size = rel(5.5)) +
  scale_fill_manual(values = c("Indicator" = "#005191", 
                               "Descriptor" = "#56B4E9", 
                               "Not incorporated" = "#E59100")) +
  coord_flip() + 
  # scale_x_discrete(limits = rev(levels(dq_broad$Criteria))) +
  labs(y = "No. of Domains")  +
  theme_classic() +
  theme(line = element_blank(), 
        axis.text.x=element_blank(),
        axis.text.y=element_text(size=rel(1.8)),
        axis.title.x=element_text(size=rel(1.5)), 
        axis.title.y=element_blank(), 
        legend.title = element_blank(),
        legend.position="top", 
        legend.justification='right',
        legend.text = element_text(size=rel(1.3))
  )

# Export ----

ggsave("figs/fig4_v13.pdf", fig4, width = 12, height = 6, units = "in", dpi = 400)
ggsave("figs/fig2_v13.pdf", fig2, width = 12, height = 6, units = "in", dpi = 400)
