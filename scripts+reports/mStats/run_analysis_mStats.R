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
dups <- duplicates(sd1)
dups2 <- duplicates(rbind(sd1[1:3, ], sd1[2:5, ], sd1))
table(dups2$dup_num)

# Distributions
histogram(sd1, age)
scatterPlotMatrix(sd1[18:29])
