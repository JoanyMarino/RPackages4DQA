check_package_key_word <- function(packages = c(), terms = c()) {
  lapply(
    setNames(nm = packages),
    function(package) {
      lapply(
        setNames(nm = terms),
        function(term) { # https://github.com/cran/dataquieR/search?q=mean
          q <- sprintf(
            "https://github.com/cran/%s/search?q=%s",
            package,
            utils::URLencode(term)
          )
          return(htmltools::pre(htmltools::a(href=q, target = "_blank", paste0(package, ":", term, "\n", collapse = ""))))
          # q <- sprintf(
          #   # "https://github.com/cran/%s/search?q=%s",
          #   "https://api.github.com/search/code?q=repo:cran/%s+%s",
          #   package,
          #   utils::URLencode(term)
          # )
          # cat(sprintf("requesting %s...", dQuote(q)))
          # r <- jsonlite::fromJSON(q)
          # if (r$total_count > 0) {
          #   if (r$incomplete_results) cat("There are more results")
          #   lapply(r$items$git_url, function(git_url) {
          #     x <- jsonlite::fromJSON(git_url)
          #     rawToChar(jsonlite::base64_dec(x$content))
          #   })
          # }
        }
      )
    }
  )
}

# keywords for integrity and completeness ####
kw <- "dim, number, ncol, nrow, duplicate, unique, name, identical, mismatch, merge, join, type, numeric, date, format, nchar, tolower, toupper, grep, missing, empty, complete, is.na, non-?response, refusal, drop-out, missing value code, jump"
pk <- "assertable assertive assertr clickR DataExplorer dataquieR dataReporter DescTools dlookr DQAstats ExPanDaR explore funModeling inspectdf IPDFileCheck mStats pointblank sanityTracker skimr SmartEDA StatMeasures summarytools testdat validate visdat xray"
#####

htmltools::save_html(check_package_key_word(strsplit(pk, "\\s+", perl = TRUE)[[1]],
                                            strsplit(kw, "\\s*,\\s*", perl = TRUE)[[1]]), 
                     file = "output_EK.html")
#rstudioapi::viewer("output_EK.html")
