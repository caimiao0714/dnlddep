#' To calculate the Elixhauser Comorbidity Index
#'
#' @author Miao Cai <email: miao.cai@outlook.com>
#' @description This file aims to calculate the Elixhauser Comorbidity Index.
#' @note The Elixhauser Comorbidity Index does not include age as a component of the index.
#' @param data Your data file in which Elixhauser Comorbidity Index is to be calculated
#' @param comorbidity A vector of all comorbidity variables
#' @return data: a new data.frame named "data". This data frame contains a new variable "Elix_Index": The Elixhauser Comorbidity Index, developed by Anne Elixhauser in 1998
#' @references Elixhauser, A., Steiner, C., Harris, D. R., & Coffey, R. M. (1998). Comorbidity measures for use with administrative data. Medical care, 36(1), 8-27.
#' @references van Walraven, C., Austin, P. C., Jennings, A., Quan, H., & Forster, A. J. (2009). A modification of the Elixhauser comorbidity measures into a point system for hospital death using administrative data. Medical care, 626-633.
#' @references Quan, H., Sundararajan, V., Halfon, P., Fong, A., Burnand, B., Luthi, J. C., ... & Ghali, W. A. (2005). Coding algorithms for defining comorbidities in ICD-9-CM and ICD-10 administrative data. Medical care, 1130-1139.
#' @importFrom purrr map
#' @export pkg_dep
#'
pkg_dep = function(x){
  vec_all = list()
  vec_all[[1]] = x
  i = 1

  while (i == 1 || !is.null(vec_all[[i - 1]]) || length(vec_all[[i - 1]]) > 0) {

    if(i == 1){
      vec_all[[i]] = pkg_dep_vec(x)
    }else{
      tmp_pkg = unlist(purrr::map(vec_all[[i - 1]], pkg_dep_vec))
      if(is.null(tmp_pkg)){
        break
      }else{
        vec_all[[i]] = tmp_pkg
      }

    }
    print(i)
    i = i + 1
  }

  return(unique(c(x, unlist(vec_all))))
}
