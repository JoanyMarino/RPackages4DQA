# assertable SHIP analysis
# https://cran.rstudio.com/web/packages/assertable/index.html

if (!require(assertable)) install.packages("assertable")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Checking Dimensions
assert_nrows(sd1,(300*29))

# Check columns
assert_colnames(sd1,c("id","exdate","age","sex","cholesterol","weight"))

assert_coltypes(CO2, list(Plant = integer(), conc = double()))

# Check that values are in set

# Check NAs
