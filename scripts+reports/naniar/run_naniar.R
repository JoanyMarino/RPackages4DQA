if (!require(here)) install.packages("here") # package for relative paths

if (!require(naniar)) install.packages("naniar")

# Study of Health in Pomerania
sd1 <- readRDS(here("data", "ship.RDS"))


# Missingness ----
# (only NAs)
miss_var_summary(sd1) # per variable
gg_miss_var(sd1)
pct_miss_case(sd1) # percentage of observations with missing values

# Complete observations ----
# (only NAs)
pct_complete_case(sd1) # percentage of complete observations
n_case_complete(sd1) # number of complete observations
pct_complete_var(sd1) # percentage of complete variables
n_var_complete(sd1) # number of complete variables

# automated annotation of missing codes for naniar
sd1_meta <- read.csv(here("data", "ship_meta.csv"))
vars_to_recode <- sd1_meta$VAR_NAMES[which(!is.na(sd1_meta$MISSING_LIST))]
sd1_shadow <- bind_shadow(sd1)


# Missing codes can be considered via a "shadow matrix".
# I thought that this shadow matrix would be required for naniar (from the "Getting started" vignette),
# but actually it wasn't. 
# However, I would like to keep the code below in case we want to do anything more fancy with naniar.

# https://community.rstudio.com/t/case-when-pattern-dynamically-generated/96790
if (!require(glue)) install.packages("glue")

for (vv in vars_to_recode) {
  vv_codes <- unlist(strsplit(sd1_meta$MISSING_LIST[which(sd1_meta$VAR_NAMES == vv)],
                             split = " | "))
  vv_codes <- trimws(vv_codes[which(vv_codes != "|")])
  vv_na_ids <- paste0("error", substr(vv_codes, start=4, stop=5))
  for (i in seq_along(vv_codes)) {
    vc <- vv_codes[i]
    ve <- vv_na_ids[i]
    sd1_shadow <- recode_shadow(sd1_shadow, {{vv}} := .where(!!! rlang::parse_exprs(glue('{vv} == "{vc}" ~ "{ve}"'))))  
  }
}

summary(sd1_shadow)