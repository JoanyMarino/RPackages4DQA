# VIM SHIP analysis
# https://cran.r-project.org/web/packages/VIM/vignettes/VIM.html
# https://cran.r-project.org/web/packages/VIM/vignettes/VisualImp.html

if (!require(VIM)) install.packages("VIM")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Load metadata ----
md1 <- readRDS(system.file("extdata", "ship_meta.RDS", package = "dataquieR"))

# Visualize missing values ----
# Plot
aggr(sd1, numbers = TRUE, prop = FALSE)

# BLUE observed values are highlighted in blue
# RED missing values are highlighted in red

# Summary table
summary(aggr(sd1, plot = FALSE))

# Margin plot
mp1 <- sd1[, c("hdl", "ldl")]
marginplot(mp1)

mp2 <- sd1[, c("waist", "cholesterol")]
marginplot(mp2)

# The red boxplot on the left shows the distribution of all values of Cholesterol where Waist contains a missing value. 
# The blue boxplot on the left shows the distribution of the values of Cholesterol where Waist is observed

# Barplot
sd1_cholesterol <- sd1[, "cholesterol"]
barMiss(sd1_cholesterol, only.miss = FALSE)

sd1_hdl <- sd1[, "hdl"]
barMiss(sd1_hdl, only.miss = FALSE)

sd1_ldl <- sd1[, "ldl"]
barMiss(sd1_ldl, only.miss = FALSE)

# Scatterplot
sd1_subset <- sd1[, c("hdl","ldl")]
scattMiss(sd1_subset, side = 1)
# Information about missing values in one variable is included as vertical or horizontal lines, as determined by the side argument. 
# The lines are thereby drawn at the observed x- or y-value.

# Histogram
histMiss(sd1_cholesterol, only.miss = FALSE)

# Matrix plot
sd1_subset2 <- sd1[, c("cholesterol", "hdl", "ldl")]
matrixplot(sd1_subset2)

# Margin matrix
# scatterplot matrix with information about missing/imputed values in the plot margins of each panel.
marginmatrix(sd1_subset2)

