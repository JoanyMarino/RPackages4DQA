if (!require(here)) install.packages("here") # package for relative paths

if (!require(sanityTracker)) install.packages("sanityTracker")

# Study of Health in Pomerania
sd1 <- readRDS(here("data", "ship.RDS"))


# Missingness ----
# (Uncertain missingness status)
checklist <- sc_cols_non_NA(object = sd1,
                            cols = c("id", "sex", "age", "height"),
                            description = "no missing values in selected columns")

# Duplicates ----
checklist <- sc_cols_unique(object = sd1,
                            cols = "id",
                            description = "unique identifiers")

# Code lists ----
# (Inadmissible categorical values) 
checklist <- sc_col_elements(object = sd1,
                             col = "sex",
                             feasible_elements = c(1,2),
                             description = "correct codes")
checklist <- sc_col_elements(object = sd1,
                             col = "obs_soma",
                             feasible_elements = 1:10,
                             description = "correct codes")
checklist <- sc_col_elements(object = sd1,
                             col = "school",
                             feasible_elements = c(0:3),
                             description = "correct codes",
                             example_size = nrow(sd1))

# Numeric ranges ----
# (Inadmissible numerical values)
checklist <- sc_cols_bounded(object = sd1,
                             cols = c("sbp1", "sbp2"),
                             rule =  "[80, 200]",
                             description = "numeric ranges for blood pressure")

#checklist <- sc_col_elements(object = sd1,
#                             col = "exdate",
#                             feasible_elements = c(as.Date("1995-01-01"):as.Date("2050-12-31")),
#                             description = "date ranges")
result <- get_sanity_checks()
clear_sanity_checks()

# Data set combinations ----
# generate two subsets with overlap and errors
sd1_sub1 <- sd1[1:150, c(1,3,5)]
sd1_sub2 <- sd1[c(1:100, 151:200), c(1,3,5)]
ind_change <- sample(1:50, 25) 
sd1_sub1$age[ind_change] <- sd1_sub1$age[ind_change] + sample(c(-10:-1, 1:10), 25, replace = TRUE)
res_leftjoin <- merge(sd1_sub2, sd1_sub1, by = c("id", "age"), all.x = TRUE, all.y = FALSE)
checklist <- sc_left_join(res_leftjoin, left = sd1_sub2, right = sd1_sub1, by = c("id", "age"),
                          description = "check left join")
# function is intended for left join, test it with wrong type of joining:
res_fullouterjoin <- merge(sd1_sub2, sd1_sub1, by = c("id", "age"), all.x = TRUE, all.y = TRUE)
checklist <- sc_left_join(res_fullouterjoin, left = sd1_sub2, right = sd1_sub1, by = c("id", "age"),
                          description = "check full outer join")

get_sanity_checks()
# if needed to remove checks:
#clear_sanity_checks()

ab <- data.table::data.table(a = 1:4, b = letters[1:4])
abc <- data.table::data.table(a = c(1:4, 2), b = letters[1:5], c = rnorm(5))
j <- merge(x = ab, y = abc, by = "a")
dummy_call <- function() {
  sc_left_join(joined = j, left = ab, right = abc, by = "a",
               description = "Left join outcome to main population")
}
dummy_call()
get_sanity_checks()
