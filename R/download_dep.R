#' To calculate the Elixhauser Comorbidity Index
#'
#' @author Miao Cai <email: miao.cai@outlook.com>
#' @description This file aims to calculate the Elixhauser Comorbidity Index.
#' @note The Elixhauser Comorbidity Index does not include age as a component of the index.
#' @param x Your data file in which Elixhauser Comorbidity Index is to be calculated
#' @return a vector: a new data.frame named "data". This data frame contains a new variable "Elix_Index": The Elixhauser Comorbidity Index, developed by Anne Elixhauser in 1998
#' @importFrom tools package_dependencies
#' @export download_dep
#'
download_dep = function(x, destination_dir = './', server_link = "http://cran.rstudio.com/"){
  lapply(x,
         download.packages,
         repos = "http://cran.rstudio.com/",
         destdir = destination_dir)
}
