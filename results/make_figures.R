# Arrange data and plot results

library(tidyverse)
library(dplyr)
library(readxl)

# Arrange data ----

# Load results
# TO DO: Move file to git repo
dq_table <- read_excel("~/Documents/2021-10_DataQualityToolsReviewPaper/DQ_paper_table_v03.xlsx")

# Remove last rows
dq_table <- dq_table[-c(25, 26),]

# Split tables
dq_broad_wide <- dq_table[c(1:12),]
dq_domains_wide <- dq_table[c(14:24),]

# Figure 2: Broad criteria ----

# Convert to long format
dq_broad <- dq_broad_wide %>% gather(Package, Feature, dataquieR:testdat)

# Set factor and order them
dq_broad <- dq_broad %>%
  mutate(Feature = case_when(Feature == "yes" ~ "Incorporated", 
                          # else, no
                          TRUE ~ "Not incorporated"))

dq_broad$Feature <- factor(dq_broad$Feature, 
                            levels = rev(c("Incorporated", "Not incorporated")))

dq_broad$Criteria <- factor(dq_broad$Criteria, 
                            levels = rev(c("Reference to data quality", 
                                           "Data quality concept", 
                                           "Control via GUI",
                                           "Control via programming",
                                           "Requires programming",
                                           "Input of metadata through functions",
                                           "Input of metadata through separate file",
                                           "Management of metadata",
                                           "Report generation from single function",
                                           "Grading of data quality issues",
                                           "Data summary/overview",
                                           "Descriptive statistics")))

dq_broad <- dq_broad %>% arrange(Criteria, Feature)

fig2 <- ggplot(dq_broad,
        aes(fill = factor(Feature), 
            x = factor(Criteria))) + 
        geom_bar(stat = "count", 
                 position = "fill", 
                 color = "white") + 
        geom_text(aes(label = ..count..), 
                  position = position_fill(vjust = 0.5),
                  stat = "count", 
                  colour = "white", 
                  size = rel(5.5)) +
        coord_flip() +
        scale_fill_manual(values = c("Incorporated" = "#E59100", 
                                     "Not incorporated" = "#005191")) +
        labs(x="", y = "Number of packages") + 
        theme_classic() +
        theme(line = element_blank(), 
              axis.text.x=element_blank(),
              axis.text.y=element_text(size=rel(1.8)),
              axis.title.x=element_text(size=rel(1.5)), 
              legend.title = element_blank(),
              legend.position="top", 
              legend.justification='right',
              legend.text = element_text(size=rel(1.3)))

ggsave("figs/fig2.pdf", fig2, width = 12, height = 6, units = "in", dpi = 400)


# Figure 3: Data Quality criteria ----

# Convert to long format
dq_domains <- dq_domains_wide %>% gather(Package, Feature, dataquieR:testdat,
                                         na.rm = FALSE)

# Set factor and order them
dq_domains <- dq_domains %>%
  mutate(Feature = case_when(is.na(Feature) ~ "Incorporated", 
                             # else, no
                             TRUE ~ "Not incorporated"))

dq_domains$Feature <- factor(dq_domains$Feature, 
                           levels = rev(c("Incorporated", "Not incorporated")))

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
                                           "Accuracy: Disagreement of repeated measurements",
                                           "Other: Uniques or distinct")))

dq_domains <- dq_domains %>% arrange(Criteria, Feature)

fig3 <- ggplot(dq_domains,
               aes(fill = factor(Feature), 
                   x = factor(Criteria))) + 
  geom_bar(stat = "count", 
           position = "fill", 
           color = "white") + 
  geom_text(aes(label = ..count..), 
            position = position_fill(vjust = 0.5),
            stat = "count", 
            colour = "white", 
            size = rel(5.5)) +
  coord_flip() +
  scale_fill_manual(values = c("Incorporated" = "#E59100", 
                               "Not incorporated" = "#005191")) +
  labs(x="", y = "Number of packages") + 
  theme_classic() +
  theme(line = element_blank(), 
        axis.text.x=element_blank(),
        axis.text.y=element_text(size=rel(1.8)),
        axis.title.x=element_text(size=rel(1.5)), 
        legend.title = element_blank(),
        legend.position="top", 
        legend.justification='right',
        legend.text = element_text(size=rel(1.3)))

ggsave("figs/fig3.pdf", fig3, width = 12, height = 6, units = "in", dpi = 400)
