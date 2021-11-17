# StatMeasures SHIP analysis

if (!require(StatMeasures)) install.packages("StatMeasures")

# Load packages ----
library(StatMeasures)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Summary ----
StatMeasures::contents(sd1)


# Check categorical variables ----
# Change the class of variables y and z to factors - does not work
# sd1_fac <- factorise(data = sd1, colNames = c('sex', 'smoking', 'myocard'))

sd1$sex <- as.factor(sd1$sex)
sd1$myocard <- as.factor(sd1$myocard)
sd1$smoking <- as.factor(sd1$smoking)

dqcategorical(sd1)

# Check continuous variables ----
dqcontinuous(sd1)

# Check date variables ----
dqdate(sd1)
