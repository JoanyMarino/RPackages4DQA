# ExPanDaR SHIP analysis
# https://joachim-gassen.github.io/ExPanDaR/
# https://joachim-gassen.github.io/ExPanDaR/articles/ExPanD_notebook.html

if (!require(ExPanDaR)) install.packages("ExPanDaR")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Load metadata ----
md1 <- readRDS(system.file("extdata", "ship_meta.RDS", package = "dataquieR"))

# Run app with option to export as notebook ----
ExPanD(df = sd1,  
       df_name = "SHIP",
       export_nb_option = TRUE)

# Shiny app ----
ExPanD()

# test single functions
data(russell_3000)
ExPanD(russell_3000, df_def = russell_3000_data_def)
prepare_missing_values_graph(russell_3000, ts_id="period")
prepare_missing_values_graph(sd1, ts_id="exdate", binary=TRUE)

ddf <- data.frame(var_name = c("id", "exdate", "weight", "diab_known", "waist"),
                  var_def = c("Person ID", "Date of examination", "Body weight", "Diabetes?", "Waist measurement in cm"),
                  type = c("cs_id", "ts_id", "numeric", "integer", "numeric"))
ExPanD(df = sd1[, c("id", "exdate", "weight", "diab_known", "waist")],  
       df_name = "SHIP",
       df_def = ddf)
