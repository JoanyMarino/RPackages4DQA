# DataExplorer SHIP report
# https://boxuancui.github.io/DataExplorer/

if (!require(DataExplorer)) install.packages("DataExplorer")
if (!require(tidyverse)) install.packages("tidyverse")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run report ----
create_report(sd1,
              output_format = html_document(toc = TRUE, toc_depth = 6, theme = "yeti"),
              output_file = "DataExplorer_ship_report.html",
              report_title = "SHIP Data Profiling Report"
)

# test single functions
introduce(sd1)#
plot_intro(sd1)
plot_str(sd1)
plot_missing(sd1)
profile_missing(sd1)
