# dataReporter SHIP report
# https://github.com/ekstroem/dataReporter

if (!require(dataReporter)) install.packages("dataReporter")

# Load packages ----
library(dataReporter)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

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

# Identify missclassified numerical variables
identifyNums(c(as.character(-9:9)))

# Value format
identifyCaseIssues(c("val", "b", "1", "1", "vAl", "VAL", "oh", "OH"))

# Identify missings
v1 <- c(1:15, 99)
v2 <- c(v1, 98)
v3 <- c(-999, v2, 9999)
identifyMissing(v1)
identifyMissing(v2)
identifyMissing(v3)
identifyMissing(factor(v3))

# Not working
# identifyMissing(sd1$obs_bp)

identifyLoners(c(rep(c("a", "b", "c"), 10), "d", "d"))
identifyLoners(sd1$waist)
uniqueValues(sd1$id)
uniqueValues(sd1$hdl)

varX <- c(rep(c(1,2,3), each=10))
class(varX)
variableType(varX)
