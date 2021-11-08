# assertive SHIP analysis
# https://bitbucket.org/richierocks/assertive/src/master/

if (!require(assertive)) install.packages("assertive")

# Load packages ----
library(assertive)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# summary(sd1)

# Run analysis ----

# Checks for all argument types ----

# (Data type mismatch) ----
is_integer(sd1$id)
is_date(sd1$exdate)
is_whole_number(sd1$age)
is_integer(sd1$sex)
is_numeric(sd1$sbp1)
is_numeric(sd1$sbp2)
is_numeric(sd1$weight)
is_numeric(sd1$waist)

# (Unexpected data records) ----
n_elements(sd1$id)
n_elements(sd1$age)

# (Duplicates) ----
has_duplicates(sd1)

# (Uncertain missingness status) ----
assert_all_are_not_na(sd1$id)
assert_all_are_not_na(sd1$sex)
assert_all_are_not_na(sd1$sbp1)
assert_all_are_not_na(sd1$sbp2)
assert_all_are_not_na(sd1$weight)
assert_all_are_not_na(sd1$waist)

# Data record mismatch ----
are_same_length(sd1$id, sd1$obs_bp)

# Logical contradiction ----
is_in_past(sd1$exdate)