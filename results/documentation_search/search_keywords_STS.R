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

# edit accordingly ####
kw <- "sd, var, qqplot, density, shapiro, wilk, kolmogorov, chisquare, chisq"
pk <- "assertable assertive assertr clickR DataExplorer DataExplorer dataquieR dataReporter DescTools dlookr DQAstats DQAstats ExPanDaR explore funModeling inspectdf IPDFileCheck MOQA mStats observer pointblank sanityTracker skimr SmartEDA StatMeasures summarytools testdat validate visdat xray"
#####

htmltools::save_html(check_package_key_word(strsplit(pk, "\\s+", perl = TRUE)[[1]],
                                            strsplit(kw, "\\s*,\\s*", perl = TRUE)[[1]]), file = "/tmp/output.html")
rstudioapi::viewer("/tmp/output.html")