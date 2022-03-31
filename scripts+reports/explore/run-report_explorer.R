# explore SHIP analysis
# https://github.com/rolkra/explore
# https://cran.r-project.org/web/packages/explore/vignettes/explore.html

if (!require(explore)) install.packages("explore")
if (!require(magrittr)) install.packages("magrittr")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Interactive exploration ----
explore(sd1)

# Run report ----
sdq %>% report(output_dir = gewd())

# Manual exploration ----
# explore by variable
sd1 %>% explore(age)
sd1 %>% explore(sbp1)

# explore relationship
sd1 %>% explore(sbp1, target = dbp1)

# explore relationship between all variables and the target
# sd1 %>% explore_all(target = sbp1)

# explore correlation between Sepal.Length and Petal.Length
sd1 %>% explore(sbp1, dbp1)

# describe dataset
describe(sd1)

# describe variables
sd1 %>% describe(age)
sd1 %>% describe(sbp1)

sd1 %>% describe_cat(smoking)

# Example from Vignette ---- 
explore_cor(iris, x = Sepal.Length, y = Sepal.Width)
