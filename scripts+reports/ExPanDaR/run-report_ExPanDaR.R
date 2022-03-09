# ExPanDaR SHIP analysis
# https://joachim-gassen.github.io/ExPanDaR/
# https://joachim-gassen.github.io/ExPanDaR/articles/ExPanD_notebook.html

if (!require(ExPanDaR)) install.packages("ExPanDaR")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Load metadata ----
md1 <- readRDS(system.file("extdata", "ship_meta.RDS", package = "dataquieR"))

# Run report ----
ExPanD(df = sd1,  
       df_name = "SHIP",
       export_nb_option = TRUE)

# Shiny app ----
ExPanD()
