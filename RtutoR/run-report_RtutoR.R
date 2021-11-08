# RTutoR SHIP report
# https://www.r-bloggers.com/2018/01/automating-basic-eda/
# https://www.youtube.com/watch?v=UMRBuXbRyag

if (!require(RtutoR)) install.packages("RtutoR")

# Load packages ----
library(RtutoR)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# summary(sd1)

# Run dynamic web report ----
# launch the app
gen_exploratory_report_app(sd1)
