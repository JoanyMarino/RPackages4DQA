# mdapack SHIP analysis
# https://cran.r-project.org/package=mdapack

if (!require(mdapack)) install.packages("mdapack")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Integrity
checkValidity(sd1)
checkValidity(sd1, numeric=TRUE, cat = TRUE)
checkVariableNames(sd1, c("age","sex", "id", "sbp1", "sbp2"))

# Completeness
missingAnalysis(sd1, miss_pattern = TRUE)
missingAnalysis(sd1, plot = TRUE)
missingAnalysis(sd1, miss_cor_pattern = TRUE)

# Accuracy
outlier_detection(sd1)
univariateAnalysis(sd1, hist = TRUE)
univariateAnalysis(sd1$age, hist = TRUE)
plotHeatmapGroup(sd1[,11:14])
