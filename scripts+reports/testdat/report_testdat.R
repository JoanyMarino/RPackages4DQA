# not a report as we expect it, just a summary of the number of failed tests etc.
if (!require(here)) install.packages("here") # package for relative paths

if (!require(testdat)) install.packages("testdat")
if (!require(openxlsx)) install.packages("openxlsx")

xx <- test_file(here("testdat", "run_testdat.R"))
output_results_excel(xx, here("testdat", "testdat_report_SHIP.xlsx"))
