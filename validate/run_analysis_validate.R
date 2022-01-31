# validate SHIP report
# https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html

# complemented by errorlocate package
# https://github.com/data-cleaning/errorlocate

if (!require(validate)) install.packages("validate")
if (!require(tidyr)) install.packages("tidyr")
if (!require(drat)) install.packages("drat")

# For report (not running)
# drat::addRepo("markvanderloo")
# install.packages("validatereport", type="source")

# library(validatereport)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Read rules ----
validation_rules <- validator(.file="./validate/validation_rules_ship.R")

# Run validation ----
validation_result <- confront(sd1, validation_rules, lin.ineq.eps=0,
                              ref = list(forbidden_keys = data.frame("diab_known" = 1,
                                                                     "diab_age" = c(99900, 99901))),
                              key="id"
                              )
# lin.ineq.eps=0 prevents building in a margin for machine rounding errors
# ref creates a data frame to contrast for forbidden values 

summary(validation_result)
plot(validation_result)

# Validation results
# Variable name
# How many data items were checked against each rule.
# How many items passed, failed or resulted in NA.
# Whether the check resulted in an error (could not be performed) or gave an warning.
# The expression that was actually evaluated to perform the check.

# Transform to long data format
sd1_long <- gather(sd1, measurement, value, sbp1:dbp2, factor_key=TRUE)
# The arguments to gather():
# - data: Data object
# - key: Name of new key column (made from names of data columns)
# - value: Name of new value column
# - ...: Names of source columns that contain values
# - factor_key: Treat the new key column as a factor (instead of character vector)
sd1_long

# Read rules ----
validation_rules_long <- validator(.file="./validate/validation_rules_ship_long_format.R")

# Run validation ----
validation_result_long <- confront(sd1_long, validation_rules_long, lin.ineq.eps=0)
# lin.ineq.eps=0 prevents building in a margin for machine rounding errors

summary(validation_result_long)


# Report ----
# # Does not run
# validation_result_json <- ess_validation_report(validation_result, validation_rules)
# cat(json)
# 
# # Export to file
# export_ess_validation_report(validation_result, validation_rules, file="report_ship_validate.json")

