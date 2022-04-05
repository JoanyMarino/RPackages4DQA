# visdat SHIP analysis
# https://github.com/ropensci/visdat

if (!require(visdat)) install.packages("visdat")
if (!require(tidyverse)) install.packages("tidyverse")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Summary ----
vis_dat(sd1)
vis_guess(sd1)

# Missings ----
vis_miss(sd1)
vis_miss(sd1, 
         cluster = TRUE)
vis_miss(sd1,
         sort_miss = TRUE, 
         cluster = TRUE, 
         show_perc = TRUE, 
         show_perc_col = TRUE)

# Correlation ----
# Only takes numeric values as input
sd1 %>%
  select_if(is.numeric) %>%
  vis_cor()


# Check for correct dimensions ----
vis_compare(sd1, data.frame(matrix(0, nrow = 2000, ncol = 29)))
vis_compare(sd1, data.frame(matrix(0, nrow = 2154, ncol = 30)))
vis_compare(sd1, data.frame(matrix(0, nrow = 2154, ncol = 29)))

# make a new dataset of iris that contains some NA values
aq_diff <- airquality
aq_diff[1:10, 1:2] <- sample(c(1:100), size = 20, replace = TRUE)
vis_compare(airquality, aq_diff)

dat_test <- tibble::tribble(
  ~x, ~y,
  -1, "A",
  0, "B",
  1, "C",
  NA, NA
)
vis_expect(dat_test, ~.x == -1)
## Not run:
vis_expect(airquality, ~.x == 5.1)
# explore some common NA strings
common_nas <- c(
  "NA",
  "N A",
  "N/A",
  "na",
  "n a",
  "n/a"
)
dat_ms <- tibble::tribble(~x, ~y, ~z,
                          1, "A", -100,
                          3, "N/A", -99,
                          NA, NA, -98,
                          "N A", "E", -101,
                          "na", "F", -1)
vis_expect(dat_ms, ~.x %in% common_na)

all_numeric(sd1)
            