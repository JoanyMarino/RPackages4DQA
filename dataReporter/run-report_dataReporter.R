# dataReporter SHIP report
# https://github.com/ekstroem/dataReporter

if (!require(dataReporter)) install.packages("dataReporter")

# Load packages ----
library(dataReporter)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Run report ----
makeDataReport(sd1)

# Run codebook ----
# https://sandsynligvis.dk/2018/03/03/generating-codebooks-in-r/
makeCodebook(sd1)

# Shiny app ----
# (for dataMaid only) 
# https://github.com/ekstroem/dataMaid

# Load packages ----
library(shiny)

# Run app locally 
runUrl("https://github.com/ekstroem/dataMaid/raw/master/app/app.zip")

# Using dataReporter interactively ----
summarize(sd1)
check(sd1$sbp1)
check(sd1$obs_bp)

# Not working
identifyMissing(sd1$obs_bp)
