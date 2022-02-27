by_pkg <- pkgs_long %>% group_by(Package, Dimension)

inds_by_pkg <- by_pkg %>% summarise(
  count = sum(Count)) %>% summarise(count2 = sum(count))

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

by_dim <- pkgs_long %>% group_by(Feature)

inds_by_feat <- by_dim %>% summarise(
  count = sum(Count)) 
