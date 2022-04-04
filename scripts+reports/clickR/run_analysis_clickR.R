# clickR SHIP analysis
# https://cran.r-project.org/package=clickR

if (!require(clickR)) install.packages("clickR")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Check quality
lapply(sd1, check_quality)

# Associations
# not working
cluster_var(sd1)

# Summary of the data
descriptive(sd1)
peek(sd1)

mydata <- data.frame(factor1=factor(c("Control", "Treatment", "Tretament", "Tratment", "treatment","teatment", "contrl", "cntrol", "CONTol", "not available", "na")))
fix_levels(mydata, "factor1", k=4, plot=TRUE)   #Chose k to select matching levels
fix_levels(mydata, "factor1", levels=c("Control", "Treatment"), k=4)

# Data types
#may.numeric(sd1) # function not found
ff <- fix_numerics(sd1[, c("waist", "ldl", "hdl")])
track_changes(ff)
gg <- fix_numerics(sd1[, c("ldl", "hdl")])
track_changes(gg)
hh <- fix_dates(sd1[, c("id", "exdate")])
track_changes(hh)

# Missing values
mine.plot(sd1[, c("id", "exdate", "age", "height", "ldl", "hdl")])
