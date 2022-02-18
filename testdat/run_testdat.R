if (!require(here)) install.packages("here") # package for relative paths

if (!require(testdat)) install.packages("testdat")
#if (!require(labelled)) install.packages("labelled") # possibility to assign labels to variables and check them

# Study of Health in Pomerania
sd1 <- readRDS(here("data", "ship.RDS"))

set_testdata(sd1)

test_that("id is unique", {
  expect_unique(id)
})

# Missingness (Proportion of missing values)
test_that("no missing values", {
  expect_prop_nmiss(id, 1)
  expect_prop_nmiss(sex, 1)
  expect_prop_nmiss(age, 1)
  expect_prop_nmiss(height, 1)
  expect_prop_nmiss(family, 1)
})

test_that("no missing values including specified missing codes", {
  expect_prop_nmiss(height, 1, miss=c(99900, 99901, NA, ""))
  expect_prop_nmiss(family, 1, miss=c(99900, 99914, NA, ""))
})

test_that("limited number of missing values", {
  expect_prop_nmiss(family, 0.95, miss=c(99900, 99914))
})

# Numeric ranges ----
# (Inadmissible numerical values)
test_that("numeric ranges", {
  expect_range(sbp1, min=80, max=200)
  expect_range(sbp2, min=80, max=200)
})

# Ranges for times and periods ----
# (Inadmissible time-date values)
test_that("date ranges", {
  expect_range(exdate, min=as.Date("1995-01-01"), max=as.Date("2050-12-31"))
})

# Code lists ----
# (Inadmissible categorical values) 
test_that("categorical values", {
  expect_values(sex, 1:2)
  expect_values(obs_soma, 1:10, miss=99900)
  expect_values(school, 0:3, miss=c(99900, 99901, 99914))
})

# Conditional restrictions ----
test_that("conditional restrictions", {
  expect_cond(diab_known == 1, diab_age >= 1)
})
# code below might be not set up correctly
test_that("jumps", {
  expect_base(contraception, sex == 2, miss=c(99900, 99901))
  expect_base(diab_age, diab_known == 0, miss=c(99900, 99901))
})
