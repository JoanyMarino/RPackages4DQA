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

# Execute the DQA and generate a PDF report:
results <- DQAstats::dqa(
  source_system_name = "DQAstats/demo_data/dqa_example_data_01",
  utils_path = utils_path,
  mdr_filename = "DQAstats/demo_data/utilities/mdr_example_data.csv",
  output_dir = getwd()
)



# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run report ----

# Execute the DQA and generate a PDF report:
results <- DQAstats::dqa(
  source_system_name = "exampleCSV_source",
  target_system_name = "exampleCSV_target",
  utils_path = utils_path,
  mdr_filename = "mdr_example_data.csv",
  output_dir = getwd()
)


