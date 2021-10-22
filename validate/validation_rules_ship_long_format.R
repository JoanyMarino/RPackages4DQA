# Rules for the SHIP data validation
# for long format data
# https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html

# Uniqueness ----
# check whether combinations of variables (usually key variables) uniquely identify a record. 
# It accepts any positive number of variable names and returns FALSE for each record that is duplicated with respect to the designated variables.

is_unique(id, exdate, measurement)
# Test whether id, date, and measure uniquely identify a value in the data set

# Availability of records ----
# (Unexpected data records)
contains_at_least( 
  keys = data.frame(measurement = c("sbp1", "sbp2", "dbp1", "dbp2")), 
  by = list(id, sex) 
)

# Gaps in (time) series ----
in_linear_sequence(exdate, 
                   by = list(id))


