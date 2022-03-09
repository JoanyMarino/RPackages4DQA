# observer SHIP analysis
# https://github.com/sicarul/xray/

if (!require(observer)) install.packages("observer")
if (!require(magrittr)) install.packages("magrittr")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Run analysis ----

df <- sd1 %>% 
  observe_if(sbp1 > 80 & sbp1 < 200,
             sbp2 > 80 & sbp1 < 200,
             exdate > as.Date("1995-01-01") & exdate < as.Date("2050-12-31"),
             sex %in% c(1,2),
             !is.na(weight),
             nrow(sd1) > 5,
             nrow(sd1) < 30,
             ncol(sd1) == 30,
             ncol(sd1) == 29,
             nrow(sd1) == 2154
             # Can we test for conditionals?
)


obs(df)

inspect(df, 2)

View_obs(df, title)
