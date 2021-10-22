# MOQA SHIP report
# https://CRAN.R-project.org/package=MOQA 
# https://www.thieme-connect.de/products/ejournals/abstract/10.3414/ME16-01-0123

if (!require(MOQA)) install.packages("MOQA")

# Load packages ----
library(MOQA)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

sd1_subset <- subset(sd1, select=-exdate)
# exclude exdate to prevent termination due to invalid argument

# subset metric variables
sd1_metric <- sd1_subset[, c("id","age", "sbp1", "sbp2", 
                             "dbp1", "dbp2", "height", "weight",
                             "waist", "diab_age", "hdl", "ldl",
                             "cholesterol")]

# subset categorical variables
sd1_categorical <- sd1_subset[, c("obs_bp","dev_bp", "obs_soma", "dev_length",
                                  "dev_weight", "obs_int", "school", "family", 
                                  "smoking", "stroke", "myocard", "diab_known",
                                  "contraception", "income")]

# specify output folder
outputFolder = "C:/Users/marinoj/Desktop/DQToolsReview/MOQA/"

# set threshold to detect missings, default is 99900 
mosaic.setGlobalMissingTreshold(99900)

# Run report ----
# For metric variables
mosaic.createSimplePdfMetricDataframe(sd1_metric, outputFolder)

# For categorical variables
mosaic.createSimplePdfCategoricalDataframe(sd1_categorical, outputFolder)
