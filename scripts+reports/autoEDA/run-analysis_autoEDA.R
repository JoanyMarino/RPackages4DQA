# autoEDA SHIP analysis
# https://rdrr.io/github/XanderHorn/autoEDA/f/README.md

if (!require(devtools)) install.packages("devtools")
devtools::install_github("XanderHorn/autoEDA")

library(autoEDA)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Univariate 
sd1_eda <-  autoEDA(x = sd1)
sd1_eda

# Tukey outlier detection 
sd1_outlier_tukey <-  dataOverview(x = sd1,
                          outlierMethod = "tukey",
                          minLevelPercentage = 0.025)
sd1_outlier_tukey

# Percentile outlier detection 
sd1_outlier_percentile <-  dataOverview(x = sd1,
                          outlierMethod = "percentile",
                          lowPercentile = 0.025,
                          upPercentile = 0.975,
                          minLevelPercentage = 0.025)
sd1_outlier_percentile
