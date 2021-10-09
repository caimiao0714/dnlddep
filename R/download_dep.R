#' To download all the required packages to a specified local directory
#'
#' @author Miao Cai <email: miao.cai@outlook.com>
#' @description This function aims to download all the required packages to a specified local directory.
#' @note
#' @param x A vector of the package names to be downloaded.
#' @param destination_dir Destination directory for the packages to be downloaded. The default is the current working directory.
#' @param server_link The link of the server to download the packages from. The default is the official CRAN website (http://cran.rstudio.com/).
#' @return .tar.gz: All the R packages to be downloaded with the format of .tar.gz
#' @importFrom tools package_dependencies
#' @examples
#' # download the dependencies, and all the dependencies of the dependencies, and so on of the package "cli".
#' package_vec = pkg_dep_all('cli')
#' # Depth: 1
#' # Depth: 2
#'
#' package_vec
#' # [1] "cli"     "glue"    "utils"   "methods"
#' download_dep(package_vec)
#' @export download_dep
#'
download_dep = function(
  x,
  destination_dir = './',
  server_link = "http://cran.rstudio.com/"
)
{
  lapply(x,
         download.packages,
         repos = "http://cran.rstudio.com/",
         destdir = destination_dir)
}
