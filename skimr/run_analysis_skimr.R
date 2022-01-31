# skimr SHIP analysis
# https://cran.r-project.org/web/packages/skimr/vignettes/skimr.html

if (!require(skimr)) install.packages("skimr")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

skim(sd1)
