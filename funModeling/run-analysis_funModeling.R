# funModeling SHIP analysis
# http://pablo14.github.io/funModeling/articles/funModeling_quickstart.html

if (!require(funModeling)) install.packages("funModeling")

# Load packages ----
library(funModeling)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Data integrity ----
status(sd1)

sd1_integrity = data_integrity(sd1)

summary(sd1_integrity)
print(sd1_integrity)

# Analyzing categorical variables ----

# Frequency distribution
freq(sd1)
freq(sd1$school)

# Analyzing numerical variables ----

# Plots numeric variables
plot_num(sd1)

# Retrieves statistics for numerical variables
profiling_num(sd1)

# Correlation ----

# Calculate R statistic
# Retrieves R metric (or Pearson coefficient) for all numeric variables, skipping the categoric ones.
correlation_table(sd1, "cholesterol")

# Correlation based on information theory
var_rank_info(sd1, "cholesterol")

# Distribution plot between input and target variable - not run
# dataset must not contain missing codes
# cross_plot(data=sd1_na_drop, input=c("weight", "cholesterol"), target="myocard")

# Boxplot and density histogram between input and target variables
plotar(data=sd1, input = c("age", "cholesterol"), target="myocard", plot_type="boxplot")

# Density histograms
plotar(data=sd1, input = "cholesterol", target="myocard", plot_type="histdens")

# Outliers threshold ----
tukey_outlier(sd1$sbp1)
hampel_outlier(sd1$sbp1)

