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
  # Data records
  row_count_match(tbl_compare = as.data.frame(matrix(0, nrow = 2154, ncol = 4))) %>%
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

# Contradictions ----
tbl <-
  dplyr::tibble(
    a = c(1, 2, 1, 7, 8, 6),
    b = c(0, 0, 0, 1, 1, 1),
    c = c(0.5, 0.3, 0.8, 1.4, 1.9, 1.2),
  )

tbl %>% 
  col_vals_expr(expr = expr(a %% 1 == 0)) %>%
  dplyr::pull(a)

expect_col_vals_expr(tbl, expr = ~ a %% 1 == 0)
test_col_vals_expr(tbl, expr = ~ a %% 1 == 0)

tbl %>%
  test_col_vals_expr(expr = ~ case_when(
    b == 0 ~ a %>% between(0, 5) & c < 1,
    b == 1 ~ a > 5 & c >= 1
  ))

tbl %>%
  test_col_vals_expr(expr = ~ case_when(
    b == 1 ~ a > 5 & c >= 1
  ))

# Data set comparisons:

tbl2 <- tbl
tbl2$d <- letters[1:6]
schema_obj <-
  col_schema(
    a = "numeric",
    b = "numeric",
    cc = "numeric",
    d = "character"
  )
create_agent(tbl = tbl2) %>%
  col_schema_match(schema_obj) %>%
  interrogate() %>%
  all_passed()

create_agent(tbl = tbl) %>%
  tbl_match(tbl_compare = tbl2) %>%
  interrogate() %>%
  all_passed()
