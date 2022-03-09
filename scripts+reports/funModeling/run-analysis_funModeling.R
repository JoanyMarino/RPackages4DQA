# funModeling SHIP analysis
# http://pablo14.github.io/funModeling/articles/funModeling_quickstart.html

if (!require(funModeling)) install.packages("funModeling")

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

# Compare datasets
data(heart_disease)
a=heart_disease
b=heart_disease
a=subset(a, age >45)
b=subset(b, age <50)
b$gender='male'
b$chest_pain=ifelse(b$chest_pain ==3, 4, b$chest_pain)
res=compare_df(a, b, c('age', 'gender'))
# Print the keys that didn't match
res
# Accessing the keys not present in the first data frame
res[[1]]$rows_not_in_X
# Accessing the keys not present in the second data frame
res[[1]]$rows_not_in_Y
# Accessing the keys which coincide completely
res[[1]]$coincident
# Accessing the rows whose values did not coincide
res[[1]]$different_values

v1=c("height","weight","age")
v2=c("height","weight","location","q_visits")
res=v_compare(vector_x=v1, vector_y=v2)
# Print the keys that didn't match
res
# Accessing the keys not present i