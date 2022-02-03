if (!require(here)) install.packages("here") # package for relative paths

if (!require(madrat)) install.packages("madrat")

cfg <- getConfig()

# Note: This package is designed for magpie objects from the magclass package 
# which is intended for spatial-temporal data.
# The functions below throw an error.

readSHIP <- function() {
  x <- readRDS(here("data", "ship.RDS"))
  return(x)
}

mydata <- readSource("SHIP")

convertSHIP <- function(x) {
  x$waist <- as.numeric(x$waist)
  x$contraception <- as.integer(x$contraception)
}