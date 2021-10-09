#' To query all the dependencies of an R package as a vector.
#'
#' @author Miao Cai <email: miao.cai@outlook.com>
#' @description This function query all the dependencies of an R package.
#' @note It only delve into one sub-level of the dependencies of an R package.
#' @param x A character string of the name of an R package.
#' @return a vector: a unique vector of the dependencies of an R package.
#' @importFrom tools package_dependencies
#' @examples
#' # query the dependencies of the package "cli"
#' pkg_dep1('cli')
#' # [1] "glue"  "utils"
#' @export pkg_dep1
#'
pkg_dep1 = function(x)
{
  unname(unlist(tools::package_dependencies(x)))
}

