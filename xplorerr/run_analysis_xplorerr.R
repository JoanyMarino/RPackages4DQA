# xplorerr SHIP analysis
# https://xplorerr.rsquaredacademy.com/

if (!require(xplorerr)) install.packages("xplorerr")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Descriptive stats
app_descriptive()

# Visualize Probability Distributions
# Only theoretical distribution
# app_vistributions()

# Inferential Statistics
# app_inference()

# Linear Regression
# app_linear_regression()

# Logistic Regression
# app_logistic_regression()

# RFM Analysis
# Recency, frequency and monetary value analysis
# app_rfm_analysis()

# Data Visualization
# Not working - app crashes
# Warning: Error in hchist: could not find function "hchist"
# 57: highist [helper/highhist.R#7]
#              Error in hchist(da, name = xlab) : could not find function "hchist"
app_visualizer()


