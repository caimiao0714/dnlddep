#' To calculate the Elixhauser Comorbidity Index
#'
#' @author Miao Cai <email: miao.cai@outlook.com>
#' @description This file aims to calculate the Elixhauser Comorbidity Index.
#' @note The Elixhauser Comorbidity Index does not include age as a component of the index.
#' @param x Your data file in which Elixhauser Comorbidity Index is to be calculated
#' @return a vector: a new data.frame named "data". This data frame contains a new variable "Elix_Index": The Elixhauser Comorbidity Index, developed by Anne Elixhauser in 1998
#' @importFrom tools package_dependencies
#' @export pkg_dep_vec
#'
pkg_dep_vec = function(x){
  unname(unlist(tools::package_dependencies(x)))
}

