# SmartEDA SHIP report
# https://github.com/choonghyunryu/dlookr

if (!require(SmartEDA)) install.packages("SmartEDA")

# Load packages ----
library(SmartEDA)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# summary(sd1)

# Run dynamic web report ----
ExpReport(sd1, op_file = "SmartEDA_ship_report.html")

ExpData(sd1, type = 2)
