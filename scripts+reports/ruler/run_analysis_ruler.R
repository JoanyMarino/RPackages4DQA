# ruler SHIP analysis
# https://github.com/sicarul/xray/

if (!require(ruler)) install.packages("ruler")
if (!require(magrittr)) install.packages("magrittr")
if (!require(dplyr)) install.packages("dplyr")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

# Create rule pack
my_data_packs <- data_packs(
  my_data_pack_1 = . %>% summarise(
    # Dimensions
    nrow_low = nrow(.) > 10,
    nrow_high = nrow(.) < 30,
    ncol = ncol(.) == 20
  )
)

# Expose data to rules
sd1 %>%
  expose(my_data_packs, .remove_obeyers = FALSE) %>%
  get_exposure()

sd1_exposed <- sd1 %>%
  expose(my_data_packs, .remove_obeyers = FALSE) 

sd1_exposed %>% get_report()


