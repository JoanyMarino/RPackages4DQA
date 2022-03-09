# Rules for the SHIP data validation
# https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html

# Variable type ----
# (Data type mismatch) 
is.integer(id)
is.integer(sex)
is.numeric(sbp1)
is.numeric(sbp2)
is.numeric(weight)
is.numeric(waist)

# Missingness ----
# (Uncertain missingness status)
!is.na(id)
!is.na(sex)
!is.na(sbp1)
!is.na(sbp2)
!is.na(weight)
!is.na(waist)

# Numeric ranges ----
# (Inadmissible numerical values)
in_range(sbp1, min=80, max=200, strict=FALSE)
in_range(sbp2, min=80, max=200, strict=FALSE)
# strict=TRUE does not include range boundaries

# Ranges for times and periods ----
# (Inadmissible time-date values)
in_range(exdate,   min=as.Date("1995-01-01"), max=as.Date("2050-12-31"))
# in_range(period, min="2020Q1", max="2020Q4")

# Code lists ----
# (Inadmissible categorical values) 
# Could also be characters
sex %in% c(1,2)
obs_soma %in% seq(1, 10)
school %in% seq(0, 3)

# (Multivariate) Completeness of records ----
is_complete(id)
#  test for missing data in the id variable
all_complete(id)
# test whether all values are present in the id column
is_complete(id, sbp1)
# check whether subrecords with id and sbp1 are complete, 
is_complete(id, sbp1, sbp2)
# check whether subrecords with id, sbp1 and sbp2 are complete

# Conditional restrictions ----
if (diab_known == 1) diab_age >= 1

# Forbidden value combinations ----
# Similar to Conditional restrictions
does_not_contain(glob(forbidden_keys))
