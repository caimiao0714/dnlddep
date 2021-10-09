#' To recursively query all the dependencies, dependencies of the dependencies, and so on of an R package as a vector with unique elements.
#'
#' @author Miao Cai <email: miao.cai@outlook.com>
#' @description This function recursively query all the dependencies, dependencies of the dependencies, and so on of an R package.
#' @note This function queries into all sub-levels of the dependencies, dependencies of the dependencies, and so on of an R package. The accompanying messages shows the progress (the depth of the query) of the query process.
#' @param x A character string of the name of an R package.
#' @return a vector: a unique vector of all the dependencies, dependencies of the dependencies, and so on of
#' @references None.
#' @examples
#' # query the dependencies, and all the dependencies of the dependencies, and so on of the package "cli".
#' pkg_dep_all('cli')
#' # Depth: 1
#' # Depth: 2
#' # [1] "cli"     "glue"    "utils"   "methods"
#' @importFrom purrr map
#' @export pkg_dep_all
#'
pkg_dep_all = function(x)
{
  vec_all = list()
  vec_all[[1]] = x
  i = 1

  while (i == 1 || !is.null(vec_all[[i - 1]]) || length(vec_all[[i - 1]]) > 0) {

    if(i == 1){
      vec_all[[i]] = pkg_dep1(x)
    }else{
      tmp_pkg = unlist(purrr::map(vec_all[[i - 1]], pkg_dep1))
      if(is.null(tmp_pkg)){
        break
      }else{
        vec_all[[i]] = tmp_pkg
      }

    }
    cat(paste0('Depth: ', i, '\n'))
    i = i + 1
  }

  return(unique(c(x, unlist(vec_all))))
}
