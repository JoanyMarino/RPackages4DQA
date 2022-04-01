#' ---
#' title: "Report for CRAN search"
#' output: html_document
#' ---

#+ warning = FALSE, message = FALSE
library(dplyr)
library(pkgsearch)

#' wrapper function to extract all packages
pkg_search_save_all <- function(...) {
  res <- advanced_search(paste0("(Title: (", ..., ")) OR (Description: (", ..., "))"))
  rr <- more()
  while(nrow(rr) > 0) {
    res <- bind_rows(res, rr)
    rr <- more()
  }
  return(res)
} 

#' define search queries and store them in a vector   
#' NOTE: words are stemmed for searching (see pkgsearch manual) - however, summary and summarise / exploration and exploratory yield different results (tested in advance)
#+ tidy = TRUE, tidy.opts = list(width.cutoff = 80)
search_queries <- c("(data OR dataset) AND quality", 
                     "quality AND indicator", 
                     "(data OR dataset OR quality) AND (assessment OR control OR check OR monitor OR manage OR report OR summary OR summarise OR curation OR screening OR visualise)", 
                     "(data OR dataset) AND (clean OR validate OR preprocess OR process OR consistent OR inconsistent)", 
                     "exploration OR exploratory", 
                     "metadata")

#' search for each of the search queries using pkgsearch (via wrapper function)
res_cran <- lapply(search_queries, pkg_search_save_all)

#' combine results
res_cran <- res_cran %>% 
  bind_rows(.) %>% 
  add_count(package)
nrow(res_cran)

#' remove duplicates
res <- res_cran %>%
  distinct(package, .keep_all = TRUE) %>%
  arrange(desc(n))
nrow(res)

#' export list of packages
#+ tidy = TRUE, tidy.opts = list(width.cutoff = 80)
write.table(res$package, file=paste0("CRAN_search_", Sys.Date(), "_all_packages.txt"), quote = FALSE, row.names = FALSE, col.names = FALSE)

#' remove newline characters from description text
res$description <- trimws(gsub("\n", " ", res$description))

#' define exclusion terms (case insensitive and case sensitive)
#+ tidy = TRUE, tidy.opts = list(width.cutoff = 80)
terms_to_exclude <- c("\\bair quality\\b", "meteorolog", "climat", "\\bweather\\b", "\\btemperatures?\\b", "\\bocean", "\\bsea\\b", "\\bmarine ", "\\bearth\\b", "\\bpollut", "toxic", "\\bwater quality\\b", "\\bdrought", "\\brainfall\\b",  "\\bevaporation\\b", "\\bhydrolog", "\\bhazard", "\\bforest", "\\bdeforest", "\\bvegetation", "\\bspatial", "\\bgeospatial", "\\braster data", "\\bbiodiversity\\b", "\\bspecies\\b", "\\bplant", "\\banimal", "\\bfish", "\\btax", "\\bphenotype", "\\bbreeding\\b", "\\bphenolog", "morphometr", "\\bmovement", "\\becolog", "\\bnetwork", "microbi", "\\bbacteria", "omics", "\\bgenetic", "\\bphylogenetic", "\\bgenom", "\\bepigenom", "\\bmetagenom", "\\bgenes?\\b", "\\bmutation", "\\bmutant", "\\bgenotyp", "\\bhaplotype", "\\balleles?", "\\bprotein", "\\blipid", "\\bpeptide", "\\bkinase\\b", "\\bspectromet", "\\bspectroscop", "\\bspectrum", "\\bspectra", "\\bsequencing\\b", "\\bsequence alignment", "\\bmicroarray", "\\bassay", "\\bimmunoassay", "\\bIllumina\\b", "\\bAffymetrix\\b", "\\bAgilent\\b", "\\Wseq\\b", "\\bsingle\\Wcell\\b", "\\bcytometr", "\\bpolymerase", "\\bmolecul", "\\bconcentration", "\\bfluorescen", "\\bchromatogr", "\\bpharmaco", "kinetic", "\\bdrug\\b", "\\bsafety\\b", "\\bisotop", "\\bchemometr", "\\badsorption\\b", "\\bdeaths?\\b", "\\bpsycholog", "psychometr", "\\bsocial\\b", "\\bbehavio", "\\bchild","\\bgames?\\b", "\\blanguage", "\\bliterary\\b", "\\btextual corp", "\\btext corp", "\\btext analysis", "\\btopic model", "\\bsentiment analysis\\b", "\\bneuron", "\\bneurolog", "\\bbrain\\b", "\\bphysiolog", "\\bagricult", "\\blivestock\\b", "\\blactation\\b", "\\bfertilizer\\b", "\\barchaeolog", "\\bgeograph", "\\blatitud", "\\bgeoreferenced\\b", "\\btopograph", "\\bgeolog", "\\bsoils?\\b", "\\bsediment", "\\bstratigra", "\\bgeochronolog",  "\\beruption", "\\bseismic", "\\bmeteor\\b", "\\bpolitic", "\\belection", "\\bvoting\\b", "\\bcensus", "\\bcity\\b", "\\bmusic", "\\bSpotify\\b", "acoustic", "\\beconom", "\\bm\\wcroeconom", "\\bfinanc", "\\bvehicle", "\\binsurance", "\\bcredit risk\\b", "\\bactuar", "\\btrading\\b", "\\bstock", "\\bcoupons?\\b", "\\bsales\\b", "\\bcrypto", "\\bhousehold", "\\binvestment", "\\bBloomberg\\b", "\\bbusiness", "\\bcustomer\\b", "\\bpolicy\\b", "\\bpolicymakers?\\b", "\\bcrime report", "\\bquality of life\\b","\\bhigher education\\b", "\\bliteracy\\b", "\\beyes?\\b", "\\bpupill", "\\bophthalm", "\\bmouse", "\\bcovid", "\\bcoronavirus", "\\bcancer", "\\btumor", "\\boncolog", "\\bglucose\\b", "\\boutbreak", "\\binfectio", "\\bvaccin", "\\bantibod", "\\bblood\\b", "\\bimage", "\\bimaging\\b", "\\bsatellite\\b", "\\bsynesthesia\\b", "\\bsensory\\b", "\\bfood\\b", "\\bnutrient", "\\bcompetition", "\\btournament", "\\bleague", "\\bsoccer\\b", "\\baccelerometer\\b", "\\bactigraph", "\\bcalibration", "\\bagent\\Wbased\\b", "\\bsensitivity analysis\\b", "\\bprobabilistic\\b", "\\brandom variable", "\\bstochastic process", "\\bpoint process\\b", "\\bpoint processes\\b", "\\bGaussian process", "\\bPoisson process", "\\bdiffusion process", "\\bWiener\\b", "\\bBrownian\\b", "\\bstatistical process\\b", "\\bgrowth process\\b", "\\bgrowth processes\\b", "\\bMarkov process", "\\bMarkov model", "\\bMarkov chain", "\\bkalman\\b", "\\bstructural equation model", "\\beigenvalue", "\\beigenvector", "\\btopolog", "parametric", "\\bmeta-analysis\\b", "\\bfalse discovery rate\\b", "\\bshrinkage\\b", "\\bregularization\\b", "\\bpenalized\\b", "\\bdimensionality reduction\\b", "\\bdimension reduction\\b", "\\boptimi.ation problem", "\\bExpectation Maximization\\b", "\\bheuristic", "\\bself\\Worgani\\wing\\b", "\\bgradient descent\\b", "\\brandom\\W?forest\\b", "\\bswarm intelligence\\b", "\\bbagging\\b", "\\bestimat", "\\bequivalence\\b", "\\bforecast", "\\bsimulat", "\\bcopula", "\\bBayes", "\\bDirichlet\\b", "\\bmixture model", "\\bmixed models?\\b", "\\bmixed\\Weffects?\\b", "\\bnull hypothes", "\\bresampl", "\\bbootstrap", "\\bpermut", "\\bcross\\Wvalidation\\b", "\\bfuzzy\\b", "\\blatent\\Wvariable", "\\blatent class\\b", "directed acyclic graph", "\\bWeka\\b", "\\brandom number", "\\bstatistical disclosure\\b", "\\bdisclosure control\\b", "\\bremote", "\\bcamera", "\\be\\W?mail\\b", "\\bdownload", "\\bWeb of Science\\b", "\\bweb scraping\\b", "\\bscrape[sdr]?\\b")
length(terms_to_exclude)
terms_to_exclude_case_sens <- c("\\b[[:lower:]]*RNA[[:lower:]]*\\b", "\\bDNA\\b", "\\bMS\\b", "\\bNGS\\b", "\\bi?EEG\\b", "\\bEEM\\b", "\\bEMG\\b", "\\bf?MRI\\b", "\\bAPIs?\\b", "\\bSEO\\b", "\\bAWS\\b", "\\bGPS\\b", "\\bZIP\\b", "\\bTV\\b", "\\bMCMC\\b", "\\bCox\\b", "\\bQSARs?\\b", "\\bJAGS\\b", "\\bq?PCR\\b", "\\bSNPs?\\b", "\\bGWAS\\b", "\\bNMR\\b", "\\bFDR\\b", "\\bSQL[[:lower:]]*\\b", "\\bMySQL\\b", "\\bPostgreSQL\\b", "\\bNetCDF\\b", "\\bnetCDF\\b", "\\bPRISMA\\b", "\\bUS\\b", "\\bUK\\b", "\\bIP\\b", "\\bPISA\\b")
length(terms_to_exclude_case_sens)

#' apply exclusion terms
to_exclude <- c(sapply(terms_to_exclude_case_sens, grep, x = res$description), 
                sapply(terms_to_exclude, grep, x = res$description, ignore.case = TRUE))
res_out <- res[-unique(unlist(to_exclude)), ]
# check some random samples and add further terms to exclude, if needed
#res_out$description[sample(1:nrow(res_out), size = 10, replace = FALSE)]
nrow(res_out)

#' export result
write.csv2(res_out[, -14], file=paste0("CRAN_search_", Sys.Date(), ".csv"), 
           row.names = FALSE)

sessionInfo()
