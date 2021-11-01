# DataExplorer SHIP report
# https://boxuancui.github.io/DataExplorer/

if (!require(DataExplorer)) install.packages("DataExplorer")

# Load packages ----
library(DataExplorer)
library(tidyverse) 

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Run report ----
create_report(sd1,
              output_format = html_document(toc = TRUE, toc_depth = 6, theme = "yeti"),
              output_file = "DataExplorer_ship_report.html",
              report_title = "SHIP Data Profiling Report"
)
