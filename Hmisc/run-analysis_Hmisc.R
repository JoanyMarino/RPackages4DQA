# Hmisc SHIP analysis
# https://hbiostat.org/R/Hmisc/
# https://www.nicholas-ollberding.com/post/an-introduction-to-the-harrell-verse-predictive-modeling-using-the-hmisc-and-rms-packages/
# https://hbiostat.org/R/Hmisc/examples2.html

if (!require(Hmisc)) install.packages("Hmisc")

# Load packages ----
library(Hmisc)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# summary(sd1)

# Run analysis ----
sd1_describe <- Hmisc::describe(sd1)
sd1_contents <- contents(sd1)

sd1_describe
sd1_contents

plot(sd1_describe)

na_pattern <- Hmisc::naclus(sd1)
Hmisc::naplot(na_pattern, "na per var")
plot(na_pattern)

