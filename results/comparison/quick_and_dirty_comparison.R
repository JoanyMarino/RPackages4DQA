library(tidyverse)
library(readxl)
library(dplyr)

dq_table_joany <- read_excel("D://DataQuality/Joany_DQ_paper_table_v04.xlsx")
mytab <- read_excel("D://DataQuality/DQ revision overview v02 EK.xlsx")
# format my table to enable a comparison
mytab2 <- mytab[c(17,18,20:26,28,32,33, which(!is.na(mytab[, 1]))[-1], 83), -c(2,4,5,12)]
colnames(mytab2) <- c("ID", "Criteria", mytab[1, c(6:11,13:ncol(mytab))])
colnames(mytab2)[4] <- "dataReporter"
colnames(mytab2)[8] <- "validate"
dq_table_elisa <- dq_table_joany
dq_table_elisa[1:nrow(dq_table_elisa), 2:ncol(dq_table_elisa)] <- NA
for (cc in 3:ncol(mytab2)) {
  cc2 <- grep(colnames(mytab2)[cc], colnames(dq_table_joany))
  # broad criteria
  for (rr in 1:12) {
    if (grepl("^no|^n.a.|^yes, basic", mytab2[rr,cc])) {
      dq_table_elisa[rr,cc2] <- NA
    } else {
      dq_table_elisa[rr,cc2] <- "yes"
    }
    if (!identical(pull(dq_table_joany[rr, cc2]), pull(dq_table_elisa[rr, cc2]))) {
      cat(colnames(mytab2)[cc], ": ", pull(dq_table_elisa[rr, 1]), "\n")
    }
  }
  # indicators
  cc_indicators <- mytab2$ID[which(!is.na(mytab2[13:46, cc])) + 12]
  cc2_indicators <- unlist(strsplit(pull(dq_table_joany[13:22, cc2]), split = "[^[:digit:]+]"))
  cc2_indicators <- cc2_indicators[which(nchar(cc2_indicators) == 4)]
  diffs_indicators <- setdiff(union(cc_indicators, cc2_indicators), intersect(cc_indicators, cc2_indicators))
  for (ii in seq_along(diffs_indicators)) {
    cat(colnames(mytab2)[cc], ": ", pull(mytab2[which(mytab2$ID == diffs_indicators[ii]),2]), "\n")
  }
  cc_indicators <- as.numeric(cc_indicators)
  outcol <- c(paste(cc_indicators[which(cc_indicators < 1004)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 1003 & cc_indicators < 1006)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 1005 & cc_indicators < 2000)], collapse=", "),
              paste(cc_indicators[which(cc_indicators == 2001)], collapse=", "), 
              paste(cc_indicators[which(cc_indicators > 2001 & cc_indicators < 3000)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 3000 & cc_indicators < 3008)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 3007 & cc_indicators < 4000)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 4000 & cc_indicators < 4007)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 4006 & cc_indicators < 4010)], collapse=", "),
              paste(cc_indicators[which(cc_indicators > 4010)], collapse=", "))
  outcol[which(nchar(outcol) < 4)] <- NA
  dq_table_elisa[13:22, cc2] <- outcol
  # other (unique values)
  if (!identical(is.na(pull(dq_table_joany[23, cc2])), is.na(pull(mytab2[47, cc])))) {
    cat(colnames(mytab2)[cc], ":  Unique values\n")
  }
  dq_table_elisa[23, cc2] <- as.character(ifelse(is.na(pull(mytab2[47, cc])), NA, 1))
}

####### code copy

# Remove last rows
dq_table <- dq_table_elisa[-c(24, 25),]

# Split tables
dq_broad_wide <- dq_table[c(1:12),]
dq_domains_wide <- dq_table[c(13:23),]

# Figure 2: Broad criteria ----

# Convert to long format
dq_long <- dq_broad_wide %>%  
  pivot_longer(
    # CHANGE cols TO MATCH ORDER IN SPREADSHEET
    cols = analyzer:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = FALSE) %>% 
  mutate(Criteria = factor(Criteria),
         Package = factor(Package), 
         Feature = case_when(Feature == "yes" ~ "Incorporated", 
                             # else, no
                             TRUE ~ "Not incorporated")) 
# Count
dq_broad <- dq_long %>% 
  group_by(Criteria, Feature) %>% 
  tally() 

# Order factors for plotting
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

dq_broad$Feature <- factor(dq_broad$Feature, 
                           levels = c("Incorporated", "Not incorporated"))

#fig2 <- 
ggplot(dq_broad, 
               aes(fill = forcats::fct_rev(Feature), y = n, x = Criteria, label = n)) +
  geom_bar(position = "fill", 
           stat = "identity", 
           color = "white") +
  geom_text(position = position_fill(vjust = 0.5),
            colour = "white", 
            size = rel(5.5)) +
  scale_fill_manual(values = c("Incorporated" = "#E59100", 
                               "Not incorporated" = "#005191")) +
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


# Figure 3: Data Quality criteria ----

# Convert to long format
dq_domains_long <- dq_domains_wide %>%  
  pivot_longer(
    # CHANGE cols TO MATCH ORDER IN SPREADSHEET
    cols = analyzer:xray,
    names_to = c("Package"),
    values_to = "Feature",
    values_drop_na = FALSE) %>% 
  mutate(Criteria = factor(Criteria),
         Package = factor(Package), 
         Feature = case_when(!is.na(Feature) ~ "Incorporated", 
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
                                             "Accuracy: Disagreement of rep. meas.",
                                             "Other: Unique values")))

dq_domains$Feature <- factor(dq_domains$Feature, 
                             levels = c("Incorporated", "Not incorporated"))

#fig3 <- 
ggplot(dq_domains, 
               aes(fill = forcats::fct_rev(Feature), y = n, x = Criteria, label = n)) +
  geom_bar(position = "fill", 
           stat = "identity", 
           color = "white") +
  geom_text(position = position_fill(vjust = 0.5),
            colour = "white", 
            size = rel(5.5)) +
  scale_fill_manual(values = c("Incorporated" = "#E59100", 
                               "Not incorporated" = "#005191")) +
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

library(ggpubr)

dq_domains_long2 <- dq_domains_long 

dq_domains2 <- dq_domains_long2 %>%
  mutate("Dimension" = substr(Criteria, start = 1, stop = 3)) %>%
  group_by(Dimension, Package, Feature) %>% 
  tally() %>%
  filter(Feature == "Incorporated")

dq_domains2$Dimension <- factor(dq_domains2$Dimension, levels = c("Int", "Com", "Con", "Acc", "Oth"))

pal2 <- c("#005191", "#00B691", "#E59100", "#C9283E", "#2E112D")

ggplot(dq_domains2, 
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
  scale_x_discrete(limits = rev(levels(dq_domains2$Package))) +
  scale_y_continuous(n.breaks = 6, limits = c(0, 10),
                     expand = expansion(add = c(0, .1))) +
  labs(y = "No. of Domains")  +
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
