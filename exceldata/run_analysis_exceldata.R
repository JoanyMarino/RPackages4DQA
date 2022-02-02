# exceldata SHIP analysis
# https://biostatspmh.github.io/exceldata/index.html

if (!require(exceldata)) install.packages("exceldata")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis from example data ----

exampleDataFile <- system.file("extdata", "exampleData.xlsx", package = "exceldata")

import <- importExcelData(exampleDataFile,dictionarySheet = 'DataDictionary',dataSheet = 'DataEntry')

checkData(import$dictionary, import$data, "ID")

# factorData <- addFactorVariables(import$data,import$dictionary,keepOriginal = TRUE)
# fullData <- createCalculated(factorData,import$dictionary,timeUnit='month')

# Simple univariate plots with outliers
plots <- plotVariables(import$data, import$dictionary,IDvar = 'ID',showOutliers = T)
plots
