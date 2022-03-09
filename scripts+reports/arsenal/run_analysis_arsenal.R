# arsenal SHIP analysis
# https://mayoverse.github.io/arsenal/

if (!require(arsenal)) install.packages("arsenal")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Cumulative counts and percentages ----

# retain NAs when creating the table using the useNA argument
sd1_subset_tab <- table(sd1[, c("school", "family", "smoking")], useNA = "ifany")
sd1_subset_freqlist <- freqlist(sd1_subset_tab)

str(sd1_subset_freqlist)

# view the data frame portion of freqlist output
as.data.frame(sd1_subset_freqlist)

head(summary(sd1_subset_freqlist))
