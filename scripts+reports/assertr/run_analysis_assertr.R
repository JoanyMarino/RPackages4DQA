# assertr SHIP analysis
# https://docs.ropensci.org/assertr/articles/assertr.html

if (!require(assertr)) install.packages("assertr")
if (!require(dplyr)) install.packages("dplyr")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Custom checks

check_assertions <- . %>%
  chain_start(store_success = TRUE) %>%
  # Unexpected data elements
  verify(nrow(.) == 2154) %>%
  # Duplicates
  assert_rows(duplicates_across_cols, in_set(FALSE), id) %>%
  # Data type mismatch
  verify(has_class("id", class = "integer")) %>%
  verify(has_class("sex", class = "integer")) %>%
  verify(has_class("sbp1", class = "integer")) %>%
  verify(has_class("sbp2", class = "integer")) %>%
  verify(has_class("weight", class = "numeric")) %>%
  # verify(has_class("waist", class = "numeric"), error_fun = defect_df_return) %>%
  # Value format 
  verify(has_all_names("sbp1", "sbp2", "weight")) %>%
  # Missingness
  assert_rows(num_row_NAs, within_bounds(0,1), everything()) %>%
  # Numerical values
  # Inadmissible (hard limits)
  assert(within_bounds(80, 200), c("sbp1", "sbp2")) %>%
  # Uncertain (soft limits)
  assert(within_bounds(90, 180, include.lower = FALSE, include.upper = FALSE), c("sbp1", "sbp2")) %>%
  # Categorical values (and standardized vocabulary)
  assert(in_set(seq(0, 4)), "school") %>%
  # Outliers
  insist(within_n_sds(4), "sbp1") %>%
  # verify(has_all_names("mpgg"))  , error_fun = warn_report
  # assert(within_bounds(as.Date("1997-10-16", "%Y-%m-%d"), as.Date("1998-10-16", "%Y-%m-%d")), "exdate") %>%
  # assert(in_set(c(as.Date("1997-10-16", "%Y-%m-%d"), as.Date("1998-10-16", "%Y-%m-%d"))), "exdate") %>%
  # dates do not work
  chain_end(success_fun=success_df_return) 

# Run analysis ----

sd1 %>%
  check_assertions #%>%
  # group_by(cyl) %>%
  # summarise(avg.mpg=mean(mpg))