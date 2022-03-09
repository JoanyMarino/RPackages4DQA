if (!require(datadigest)) install.packages("datadigest")

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

codebook(data = sd1)

explorer(data = sd1)
         