# errorlocate SHIP analysis
# https://github.com/data-cleaning/errorlocate

# depends on validate package
# (check validate analysis)
# https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html

if (!require(errorlocate)) install.packages("errorlocate")

# Load packages ----
library(errorlocate)
library(validate)
library(dplyr)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Specify categorical variables
sd1 <- sd1 %>% mutate(across(c(sex, obs_soma, school), factor))

# Read rules ----
validation_rules <- validator(.file="./validate/validation_rules_ship.R")

# Run errorlocate ----

# Locate errors
sd1_error_fields <- locate_errors(sd1, validation_rules)
print(sd1_error_fields)
summary(sd1_error_fields)

# Replace faulty data with NAs
sd1_no_error <- replace_errors(sd1, validation_rules)
print(sd1_no_error)

# Retrieve the replaced errors 
sd1_errors <- errors_removed(sd1_no_error)
print(sd1_errors)
summary(sd1_errors)

sd1_errors$errors
sd1_errors$weight
