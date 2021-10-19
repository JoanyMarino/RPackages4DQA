# dataReporter SHIP report
# https://github.com/ekstroem/dataReporter

if (!require(summarytools)) install.packages("summarytools")

# Load packages ----
library(summarytools)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Run report ----
view(dfSummary(sd1))

# Save report ----
view(dfSummary(sd1), file = "summarytools_ship_report.html")
view(dfSummary(sd1), file = "summarytools_ship_report.md")
