# iNZightTools SHIP analysis
# https://cran.r-project.org/package=iNZightTools

if (!require(iNZightTools)) install.packages("iNZightTools")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Count missings
countMissing(sd1)

# Check types
is_num(sd1$id)
is_dt(sd1$exdate)

# Anti value matching
Inf %notin% sd1
