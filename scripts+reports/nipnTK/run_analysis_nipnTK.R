# nipnTK SHIP analysis
# https://github.com/sicarul/xray/

if (!require(nipnTK)) install.packages("nipnTK")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# 1. Range checks and value checks to identify univariate outliers.
sd1[outliersUV(sd1$sbp1), ]

# 2. Scatterplots and statistical methods to identify bivariate outliers.
sd1[outliersMD(sd1$height,sd1$weight), ]

# 3. Use of flags to identify outliers in anthropometric indices.
# Not applicable?

# Examining the distribution and the statistics of the distribution of measurements and anthropometric indices.
histNormal(sd1$height)
 
# Assessing the extent of digit preference in recorded measurements.
fullTable(sd1$weight) # like table function but includes cell with 0 counts

# Assessing the extent of age heaping in recorded ages.
ageHeaping(sd1$age)

# Examining the sex ratio.
sexRatioTest(sd1$sex, codes = c(1, 2))

# Examining age distributions and age by sex distributions.
pyramid.plot(sd1$age, sd1$sex)
