# IPDFileCheck SHIP analysis
# https://cran.r-project.org/web/packages/IPDFileCheck/vignettes/User_Guide.html

if (!require(IPDFileCheck)) install.packages("IPDFileCheck")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# Secondary data frame for testing
test_df <- data.frame(
  "Age" = c(21, 15),
  "Name" = c("John", "Dora"))

# Run analysis ----
# returns 0 when TRUE

# check if a column exists
check_column_exists("sex", sd1)
check_column_exists("qwer", sd1)

# Check column names
test_columnnames(c("age","sex", "id", "sbp1", "sbp2"), sd1)
test_columnnames(c("id", "exdate", "age","sex", "sbp1", "sbp2"), sd1)
# All the columns must be entered, otherwise the output is an error (-1), see example below
test_columnnames(c("age", "name"), test_df)
test_columnnames(c("name", "age"), test_df)

# Check the format of ’age’ in dat
# by default, age should be numeric and with in limits of 0 and 150
test_age(sd1,"age", NA)
test_age(sd1, "age", 9999)

# check the format of column ‘gender’ in data 
# User provides the name of the gender column, how it is coded, and the optional code of non response. 
test_gender(sd1, c(1,2),"sex", 9999)

# Check the limits of numeric column 
test_data_numeric("age", sd1, NA, 0, 100)
test_data_numeric("sbp1", sd1, 9999, 80, 200)
test_data_numeric("sbp1", sd1, 9999, 80, 300)
# does not handle dates in the same way
test_data_numeric("exdate", sd1, NA, "1997-10-16", "2001-05-19")
descriptive_stats_col_excl_nrcode(sd1, "exdate")
descriptive_stats_col_excl_nrcode(sd1, "sbp1")

# Check that column is numeric
test_data_numeric_norange("age",sd1,NA)
test_data_numeric_norange("waist",sd1,NA)

# Check that column is string
test_data_string(sd1, "waist", NA)
test_data_string(test_df, "Name", NA)

# Check the contents of a string column
# test_data_string_restriction(rctdata,"arm",NA, c("Intervention","Control"))
test_data_string_restriction(sd1,"sex", NA, c(1, 2))

# Are column entries in a given list?
test_column_contents(sd1,"sex",c(1,2),NA)
test_column_contents(sd1,"sex",c(1,2))
test_column_contents(sd1,"sex",c(1,5))

# Descriptive stats
descriptive_stats_col_excl_nrcode(sd1, "age")
descriptive_stats_col_excl_nrcode(sd1, "school", nrcode = c(NA, 99900, 99914)) # error, accepts only a single missing value code

represent_categorical_textdata(sd1, "sex",NA)

get_summary_gtsummary(sd1, selectvar = colnames(sd1)[-c(1,2)]) # does not work for date variables

# get unique values of a single column
get_contents_cols(sd1, "age")
