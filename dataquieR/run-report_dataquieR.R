# dataquieR SHIP report
# https://dfg-qa.ship-med.uni-greifswald.de/index.html

if (!require(dataquieR)) install.packages("dataquieR")

# load packages ----
library(dataquieR)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Load metadata ----
md1 <- readRDS(system.file("extdata", "ship_meta.RDS", package = "dataquieR"))

# Run report ----
ship_report <- dq_report(study_data = sd1,
                          meta_data  = md1,
                          label_col  = LABEL,
                          # specify dimensions because Accuracy is not included by default
                          dimensions = c("Completeness", 
                                         "Consistency", 
                                         "Accuracy"),
                          # contradiction checks (in consistency)
                          check_table = read.csv(system.file("extdata",
                                                             "contradiction_checks.csv", 
                                                             package = "dataquieR"), 
                                                 header = TRUE, sep = "#") #,
                          # show_causes = TRUE,
                          # cause_label_df = read.csv(system.file("extdata", 
                          #                                       "Missing-Codes-2020.csv",
                          #                                       package = "dataquieR"),
                          #                           header = TRUE, sep = ";")
                          )

# check the results
ship_report

save(ship_report, file = "SHIP_report_dataquieR.RData") 
# careful, this contains the study_data