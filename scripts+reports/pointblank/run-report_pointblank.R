# pointblank SHIP report
# https://joachim-gassen.github.io/ExPanDaR/
# https://joachim-gassen.github.io/ExPanDaR/articles/ExPanD_notebook.html

if (!require(pointblank)) install.packages("pointblank")
if (!require(ggforce)) install.packages("ggforce")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run reports ----

# Table Scan Workflow (VALID-V) ----
scan_data(sd1)

# Data Quality Reporting Workflow (VALID-I) ----
al <- action_levels(notify_at = 0.1, warn_at = 0.2, stop_at = 0.5)

agent <- 
  create_agent(
    tbl = sd1,
    tbl_name = "SHIP data",
    label = "SHIP Data Quality Report (VALID-I)",
    actions = al
  ) %>%
  # Data elements
  col_exists(vars(id, sex, sbp1, sbp2)) %>%
  # Duplicates
  rows_distinct(vars(id, sex, sbp1, sbp2)) %>%
  # Type
  col_is_integer(vars(id, sex, sbp1, sbp2)) %>%
  col_is_numeric(vars(weight, waist)) %>%
  col_is_date(vars(exdate)) %>%
  # Missingness
  col_vals_not_null(vars(sbp1, sbp2)) %>%
  # Time-date values (inadmissible and uncertain)
  # Categorical values
  col_vals_in_set(vars(school), set = seq(0, 4)) %>%
  # Numerical values (inadmissible and uncertain)
  col_vals_between(vars(sbp1), left = 90, right = 80) %>%
  col_vals_between(vars(exdate), left = "1997-10-16", right = "2001-05-19") %>%
  interrogate()

agent
# get_agent_report(agent)

