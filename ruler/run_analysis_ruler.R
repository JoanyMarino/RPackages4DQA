# ruler SHIP analysis
# https://github.com/sicarul/xray/

if (!require(ruler)) install.packages("ruler")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

sd1 %>% summarise(
  nrow_low = nrow(.) > 10,
  nrow_high = nrow(.) < 30,
  ncol = ncol(.) == 12
)
