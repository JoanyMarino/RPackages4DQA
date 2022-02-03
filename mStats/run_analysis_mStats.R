# mStats SHIP analysis
# https://myominnoo.github.io/mStats/

if (!require(mStats)) install.packages("mStats")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Describe dataset after data import
codebook(sd1)
summ(sd1)

# Summary statistics
x <- tab(sd1)
summary(x)

# Duplicates
duplicates(sd1)

# Distributions
histogram(sd1, age)
scatterPlotMatrix(sd1[18:29])
