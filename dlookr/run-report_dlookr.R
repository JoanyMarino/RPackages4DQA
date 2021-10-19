# dlookr SHIP report
# https://github.com/choonghyunryu/dlookr

if (!require(dlookr)) install.packages("dlookr")

# Load packages ----
library(dlookr)

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

summary(sd1)

# Run dynamic web report ----
diagnose_web_report(sd1)

sd1 %>%
  diagnose_web_report(subtitle = "SHIP", output_dir = ".", 
                      output_file = "dlookr_diagn_ship_report.html", theme = "blue")

# Run static report ---- 
sd1 %>%
  diagnose_paged_report(subtitle = "SHIP", output_dir = ".",
                        output_file = "dlookr_diagn_ship_report.pdf", theme = "blue")


# To do **********
# Run exploratory Data Analysis report ----
sd1 %>%
  eda_web_report(target = "death_event", subtitle = "heartfailure", 
                 output_dir = "./", output_file = "EDA.html", theme = "blue")


sd1 %>%
  eda_paged_report(target = "death_event", subtitle = "heartfailure", 
                   output_dir = "./", output_file = "EDA.pdf", theme = "blue")


# Run data Transformation Report ----
sd1 %>%
  transformation_web_report(target = "death_event", subtitle = "heartfailure",
                            output_dir = "./", output_file = "transformation.html", 
                            theme = "blue")

sd1 %>%
  transformation_paged_report(target = "death_event", subtitle = "heartfailure",
                              output_dir = "./", output_file = "transformation.pdf", 
                              theme = "blue")




