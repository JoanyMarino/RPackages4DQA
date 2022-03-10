# DQAstats SHIP analysis
# https://gitlab.miracum.org/miracum/dqa/dqastats

if (!require(DQAstats)) install.packages("DQAstats")

# Run example report ----

# Set environment vars to demo files paths:
Sys.setenv("EXAMPLECSV_SOURCE_PATH" = system.file("demo_data",
                                                  package = "DQAstats"))
Sys.setenv("EXAMPLECSV_TARGET_PATH" = system.file("demo_data",
                                                  package = "DQAstats"))
# Set path to utilities folder where to find the mdr and template files:
utils_path <- system.file("demo_data/utilities",
                          package = "DQAstats")

base_dir <- "scripts+reports/DQAstats"
# Execute the DQA and generate a PDF report:
results <- DQAstats::dqa(
  source_system_name = "exampleCSV_source",
  target_system_name = "exampleCSV_target",
  utils_path = utils_path,
  mdr_filename = "mdr_example_data.csv",
  output_dir = here::here(base_dir, "demo_output")
)



# SHIP dataset

# Study of Health in Pomerania
# load the ship dataset
library(magrittr)
base_dir <- "scripts+reports/DQAstats"
ship_data <- readRDS(
  system.file("extdata/ship.RDS", package = "dataquieR")
) %>%
  data.table::data.table()

# export the dataset to a CSV-file (one of the formats supported by DQAstats)
ship_data_export_fn <- "ship_data.csv"
data.table::fwrite(
  x = ship_data,
  file = file.path(tempdir(), ship_data_export_fn)
)

#`DQAstats` requires a so-called `utilities`-folder that contains at least two
# sub-directories, named `MDR` and `RMD`.
# When having created this folder structure, the MDR prepared for `DQAstats`
# can be saved as 'CSV'-file to the `MDR`-sub-directory. This file is then used
# as input for the function `DQAstats::dqa()`.

utils_path <- file.path(tempdir(), "utilities")
dir.create(file.path(utils_path, "MDR"), recursive = TRUE)

# prepare mdr according to https://github.com/kapsner/DQAstats2ship-dataset/blob/main/index.Rmd
file.copy(
  from = here::here(base_dir, "mdr.csv"),
  to = file.path(utils_path, "MDR"),
  recursive = TRUE,
  overwrite = TRUE
)

# The `RMD` sub-directory of the `utilities`-folder contains the template files
# for the Rmarkdown report. For demonstration purposes, the templates provided
# with `DQAstats` can be used directly. 
file.copy(
  from = system.file("demo_data/utilities/RMD", package = "DQAstats"),
  to = utils_path,
  overwrite = TRUE,
  recursive = TRUE
)

# init some arguments
# ship data set
source_system_name <- "ship"
target_system_name <- source_system_name

mdr_filename <- "mdr.csv"
output_dir <- here::here(base_dir, "ship_output")
logfile_dir = tempdir()

# does only work, if "ship_data.csv" is lying next to this RMD-file
Sys.setenv("SHIP_PATH" = tempdir())

# provide all arguments to main function
# Execute the DQA and generate a PDF report:
all_results <- DQAstats::dqa(
  source_system_name = source_system_name,
  target_system_name = target_system_name,
  utils_path = utils_path,
  mdr_filename = mdr_filename,
  output_dir = output_dir,
  logfile_dir = logfile_dir,
  parallel = TRUE
)


