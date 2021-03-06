# DescTools SHIP analysis
# https://cran.r-project.org/package=DescTools

if (!require(DescTools)) install.packages("DescTools")
if (!require(RDCOMClient)) install.packages("RDCOMClient", repos = 'http://www.omegahat.net/R')

wrd <- GetNewWrd() # ERROR
ToWrd("SHIP data quality report from DescTools\n",
      wrd=wrd) # ERROR

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Overview
Abstract(sd1)
Desc(sd1)

# Categorical variables
Desc(as.factor(sd1$sex))
Desc(as.factor(sd1$smoking))

# Missings
PlotMiss(sd1, main="Missing data", clust = TRUE) 

# Correlation
m <- cor(sd1[,which(sapply(sd1, is.numeric))], use="pairwise.complete.obs")

PlotCorr(m, border="grey",
         args.colorlegend=list(labels=Format(seq(1,-1,-.25), 2), frame="grey"))
  
PlotWeb(m, col=c(hred, hblue))

# Duplicates
x <- c(1:10, 4:6)
AllDuplicated(x)
# compare to:
duplicated(x)
x[!AllDuplicated(x)]
