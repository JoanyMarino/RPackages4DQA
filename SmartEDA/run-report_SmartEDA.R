# SmartEDA SHIP report
# https://github.com/daya6489/SmartEDA
# https://cran.r-project.org/web/packages/SmartEDA/vignettes/CustomTable.html

if (!require(SmartEDA)) install.packages("SmartEDA")

# Load packages ----
library(SmartEDA)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run dynamic web report ----
ExpReport(sd1, op_file = "SmartEDA_ship_report.html")

# Functions not included in the report ----

# overview of the data 
ExpData(data=sd1,type=1)

# structure of the data	
ExpData(sd1, type = 2)

# Summary of numerical variables
# Summary statistics by – overall
ExpNumStat(sd1, gp=NULL, Qnt=seq(0,1,0.1), MesofShape=2, Outlier=TRUE, round=2)
# Summary statistics by – overall with correlation	
ExpNumStat(sd1, gp=NULL, Qnt=seq(0,1,0.1), MesofShape=1, Outlier=TRUE, round=2)
# Summary statistics by – category
ExpNumStat(sd1,by="GA",gp="Urban",Qnt=seq(0,1,0.1),MesofShape=2,Outlier=TRUE,round=2)

# Summary of categorical variables
# Frequency or custom tables for categorical variables
ExpCTable(sd1,Target=NULL,margin=1,clim=10,nlim=5,round=2,bin=NULL,per=T)

# Univariate Outlier analysis 
# Identifying outliers method - Boxplot
ExpOutliers(sd1, varlist = c("age","sbp1","dbp1"), method = "boxplot",  capping = c(0.1, 0.9))

# Identifying outliers method - 3 Standard Deviation
ExpOutliers(sd1, varlist = c("age","sbp1","dbp1"), method = "3xStDev",  capping = c(0.1, 0.9))

# Identifying outliers method - 2 Standard Deviation
ExpOutliers(sd1, varlist = c("age","sbp1","dbp1"), method = "2xStDev",  capping = c(0.1, 0.9))
