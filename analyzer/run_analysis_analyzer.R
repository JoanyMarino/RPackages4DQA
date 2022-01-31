# analyzer SHIP analysis
# https://cran.r-project.org/web/packages/analyzer/vignettes/analyzer.html

if (!require(analyzer)) install.packages("analyzer")
if (!require(ggplot2)) install.packages("ggplot2")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run reports ----
# not working
GenerateReport(dtpath = "C:/Users/marinoj/Desktop/dqtoolsreview/data/ship_study.csv",
               catVars = c("sex", "obs_bp", "obs_soma", "obs_int", "school", 
                           "family", "smoking", "myocard", "stroke", "diab_known",
                           "contraception", "income"),
               yvar = NULL, 
               model = "binClass",
               output_format = c("html_document","pdf_document"),
               title = "SHIP Report", 
               output_dir = tempdir(),
               interactive.plots = FALSE)

# For a continuous vector
explainer(sd1$cholesterol)

# For a categorical vector
explainer(as.factor(sd1$school))

# For a complete data.frame
explainer(sd1)
# breaks because does not recognize dates

# Plot single variable
p <- plottr(sd1$sbp1)
plot(p$x)

# Missing values
q <- plotNA(sd1)
plot(q)
