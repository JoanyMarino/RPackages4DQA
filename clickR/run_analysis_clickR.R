# clickR SHIP analysis
# https://cran.r-project.org/package=clickR

if (!require(clickR)) install.packages("clickR")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Check quality
lapply(sd1, check_quality)

# Associations
# not working
cluster_var(sd1)

# Summary of the data
descriptive(sd1)
peek(sd1)

