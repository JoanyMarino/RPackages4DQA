# xray SHIP analysis
# https://github.com/sicarul/xray/

if (!require(xray)) install.packages("xray")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Anomaly detection
anomalies(sd1)

# Distributions
distributions(sd1)
