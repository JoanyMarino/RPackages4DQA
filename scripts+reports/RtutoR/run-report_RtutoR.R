# RTutoR SHIP report
# https://www.r-bloggers.com/2018/01/automating-basic-eda/
# https://www.youtube.com/watch?v=UMRBuXbRyag

if (!require(RtutoR)) install.packages("RtutoR")

# Load data ----

# Study of Health in Pomerania
sd1 <- readRDS(system.file("extdata", "ship.RDS", package = "dataquieR"))

# summary(sd1)

# Run dynamic web report ----
# launch the app
gen_exploratory_report_app(sd1)
# the app crashes:
# Warning: Error in : 'ph_with_text' is defunct.
# Use 'ph_with' instead.
# See help("Defunct")
# [No stack trace available]

# Example from r-bloggers article ----
res = generate_exploratory_analysis_ppt(df = iris,target_var = "Species",
                                        output_file_name = "iris_report.pptx")
# Error: 'ph_with_text' is defunct.
# Use 'ph_with' instead.



