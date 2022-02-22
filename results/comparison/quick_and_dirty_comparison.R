library(readxl)
library(dplyr)

dq_table_joany <- read_excel("D://DataQuality/Joany_DQ_paper_table_v04.xlsx")
mytab <- read_excel("D://DataQuality/DQ revision overview v02 EK.xlsx")
# format my table to enable a comparison
mytab2 <- mytab[c(17,18,20:26,28,32,33, which(!is.na(mytab[, 1]))[-1], 83), -c(2,4,5,12)]
colnames(mytab2) <- c("ID", "Criteria", mytab[1, c(6:11,13:ncol(mytab))])
dq_table_elisa <- mytab2
colnames(dq_table_elisa)[4] <- "dataReporter"
colnames(dq_table_elisa)[8] <- "validate"
for (cc in 3:ncol(dq_table_elisa)) {
  # broad criteria
  for (rr in 1:12) {
    if (grepl("^no|^n.a.|^yes, basic", dq_table_elisa[rr,cc])) {
      dq_table_elisa[rr,cc] <- NA
    } else {
      dq_table_elisa[rr,cc] <- "yes"
    }
    cc2 <- grep(colnames(dq_table_elisa)[cc], colnames(dq_table_joany))
    if (!identical(pull(dq_table_joany[rr, cc2]), pull(dq_table_elisa[rr,cc]))) {
      cat(colnames(dq_table_elisa)[cc], ": ", pull(dq_table_elisa[rr,2]), "\n")
    }
  }
  # indicators
  cc_indicators <- dq_table_elisa$ID[which(!is.na(dq_table_elisa[13:46, cc])) + 12]
  cc2_indicators <- unlist(strsplit(pull(dq_table_joany[13:22, cc2]), split = "[^[:digit:]+]"))
  cc2_indicators <- cc2_indicators[which(nchar(cc2_indicators) == 4)]
  diffs_indicators <- setdiff(union(cc_indicators, cc2_indicators), intersect(cc_indicators, cc2_indicators))
  for (ii in seq_along(diffs_indicators)) {
    cat(colnames(dq_table_elisa)[cc], ": ", pull(dq_table_elisa[which(dq_table_elisa$ID == diffs_indicators[ii]),2]), "\n")
  }
  # other (unique values)
  if (!identical(is.na(dq_table_joany[23, cc2]), is.na(dq_table_elisa[47, cc]))) {
    cat(colnames(dq_table_elisa)[cc], ":  Unique values\n")
  }
}

# number of domains per package:
apply(dq_table_joany[13:22,-1], 2, function(cc) {length(which(cc != ""))})
