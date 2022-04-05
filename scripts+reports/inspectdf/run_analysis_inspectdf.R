# inspectdf SHIP analysis
# https://alastairrushworth.github.io/inspectdf/

if (!require(inspectdf)) install.packages("inspectdf")
if (!require(magrittr)) install.packages("magrittr")

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Column types ----
sd1_types <- inspect_types(sd1)
sd1_types
sd1_types$col_name$character

sd1_types %>% show_plot()

sd1b <- sd1
sd1b$waist <- as.numeric(sd1b$waist)
inspect_types(sd1, sd1b) %>% show_plot()

# Missings ----
inspect_na(sd1)

inspect_na(sd1) %>% show_plot()

# Numerical features ----
# Summary
sd1_num <- inspect_num(sd1)

sd1_num$hist$sbp1

sd1_num %>% show_plot()

# Correlation
# Pearson’s correlation coefficient, confidence intervals and p-values for pairs of numeric columns
inspect_cor(sd1)
inspect_cor(sd1) %>% show_plot()

# Categorical features -----
# Summary
sd1_cat <- inspect_cat(sd1, include_int = TRUE)
inspect_cat(sd1, include_int = TRUE) %>% show_plot()

# only selects character strings
# so the following does not work
# Feature imbalance
inspect_imb(sd1)
# Percentage and count per variabler per level
inspect_imb(sd1) %>% show_plot()

# Memory usage ----
inspect_mem(sd1)
inspect_mem(sd1) %>% show_plot()


# Data set comparisons ----
a <- sd1[,1:5]
b <- sd1[,5:10]

test <- inspect_types(a,b)
test$issues
test %>% show_plot()

inspect_types(sd1[1:100, 1:10], sd1[90:290, 1:4]) %>% show_plot()
inspect_cat(sd1[1:100, ], sd1[90:290, ], include_int = TRUE)
inspect_num(sd1[1:100, 1:8], sd1[90:290, 1:8]) %>% show_plot()
inspect_num(sd1[, 1:8], sd1[, 1:8])
