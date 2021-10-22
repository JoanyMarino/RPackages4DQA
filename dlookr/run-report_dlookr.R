# dlookr SHIP report
# https://github.com/choonghyunryu/dlookr

if (!require(dlookr)) install.packages("dlookr")

# Load packages ----
library(dlookr)
library(dplyr)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Diagnose Data ----
sd1_overview <- overview(sd1)
summary(sd1_overview)
plot(sd1_overview)

# Need to be run again because missing codes are included in the data
diagnose(sd1)
diagnose_numeric(sd1)
diagnose_category(sd1)

# Outliers
diagnose_outlier(sd1)
plot_outlier(sd1)

# Missing values
plot_na_pareto(sd1, col = "blue")
plot_na_hclust(sd1, main = "Distribution of missing values")
plot_na_intersect(sd1, main = "Missing values with intersection of variables")

# Run dynamic web report ----
diagnose_web_report(sd1)

sd1 %>%
  diagnose_web_report(subtitle = "SHIP", output_dir = ".", 
                      output_file = "dlookr_diagn_ship_report.html", theme = "blue")

# Run static report ---- 
sd1 %>%
  diagnose_paged_report(subtitle = "SHIP", output_dir = ".",
                        output_file = "dlookr_diagn_ship_report.pdf", theme = "blue")

# Exploratory Data Analysis ----
describe(sd1)
normality(sd1)
plot_normality(sd1$cholesterol)

correlate(sd1)
plot_correlate(sd1)

# EDA based on target variable
num <- target_by(sd1, cholesterol)
num_num <- relate(num, weight)
num_num

plot(num_num)

# Run Exploratory Data Analysis report ----
sd1 %>%
  eda_web_report(subtitle = "SHIP", 
                 output_dir = ".", 
                 output_file = "dlookr_EDA_ship_report.html", 
                 theme = "blue")


# sd1 %>%
#   eda_paged_report(subtitle = "SHIP", 
#                    output_dir = ".", 
#                    output_file = "dlookr_EDA_ship_report.pdf", 
#                    theme = "blue")


