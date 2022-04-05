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
validation_rules <- validator(.file="./scripts+reports/validate/validation_rules_ship.R")

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

df <- data.frame(id = 11001:11003, year = c("2018","2019","2020"), value = 1:3)
rule <- validator(field_length(year, 4), field_length(id, 4))
out <- confront(df, rule)
as.data.frame(out)

x <- seq(1,20,by=0.1)
plot(x,hb(x), 'l')

# Set membership operators ----
# we cannot be sure about the first element:
c(NA, "a") %vin% c("a","b")
# we cannot be sure about the 2nd and 3rd element (but note that they
# cannot both be TRUE):
c("a","b","c") %vin% c("a",NA)
# we can be sure about all elements:
c("a","b") %in% character(0)

# Number format ----
df <- data.frame(number = c("12.34","0.23E55","0.98765E12"))
rules <- validator(number_format(number, format="dd.dd"), 
                   number_format(number, "0.ddEdd"), 
                   number_format(number, "0.*Edd"))
out <- confront(df, rules)
values(out)

rule <- validator(field_format(number, "??.??"),
                  field_format(number, "0.*E??"),
                  field_format(number, "0.?"))
out  <- confront(df, rule)
summary(out)


# Dates ----
d <- data.frame(
  number = c(3,-2,6)
  , time   = as.Date(c("2018-02-01", "2018-03-01", "2018-04-01"))
  , period = c("2020Q1", "2021Q2", "2020Q3") 
)

rules <- validator(
  in_range(number, min=-2, max=7, strict=TRUE)
  , in_range(time,   min="2017-01-01", max="2018-12-31")
  , in_range(period, min="2020Q1", max="2020Q4")
)

result <- confront(d, rules)
values(result)


# Plot ----
rules <- validator( r1 = staff.costs < total.costs
                    , r2 = turnover + other.rev == total.rev
                    , r3 = other.rev > 0
                    , r4 = total.rev > 0
                    , r5 = nace %in% c("A", "B")
)
plot(rules, cex=0.8, show_legend=TRUE)

data(retailers)
cf <- confront(retailers, rules)
plot(cf, main="Retailers check")
