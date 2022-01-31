# brinton SHIP analysis
# https://sciencegraph.github.io/brinton/articles/brinton.html

if (!require(brinton)) install.packages("brinton")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run reports ----
wideplot(sd1)

# Single variables
longplot(sd1, 'sbp1')
longplot(sd1, 'weight')
longplot(sd1, 'school')

# 2 variables
# only works without NAs
sd1_wo_nas <- sd1[complete.cases(sd1), ]
longplot(sd1_wo_nas, c('ldl', 'hdl'))

# Single plot
plotup(sd1_wo_nas, c('ldl', 'hdl'), "color heatmap", output = "html")
