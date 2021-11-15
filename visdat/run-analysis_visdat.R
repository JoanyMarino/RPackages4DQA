# visdat SHIP analysis
# https://github.com/ropensci/visdat

if (!require(visdat)) install.packages("visdat")

# Load packages ----
library(visdat)
library(tidyverse)

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
         sort_miss = TRUE)

# Correlation ----
# Only takes numeric values as input
sd1 %>%
  select_if(is.numeric) %>%
  vis_cor()

