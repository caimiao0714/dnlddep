# dnlddep

**dnlddep** (dnl: download, dep: dependency) can recursively download all the dependencies of an R package. You may be surprised: it is 2021; who needs to download the source files of the R packages? You can simply install packages by `install.packages('useless_package')`, right? Yes, this is a useless package if you have connection to the Internet, and in that case, every package is just one click a way.

This package is motivated by the scenarios that some servers/computation platforms are highly confidential and do not allow access to the Internet. In this case, you have to download every needed package on your PC and then upload them to the server/platform. This was exactly what I was faced, and there comes the problem. For example, `tidyverse` depends on a few packages such as `dplyr`, `ggplot2`, etc; `dplyr` and `ggplot2` depends on a few other packages; these other packages depend on other other packages, .... This list goes on and on, and you will get absolutely crazy after several cycles of `install -> missing dependencies -> download and upload`.

Let me end the story here. Try the following example code and save your life.

```
#devtools::install_github('caimiao0714/dnlddep')

library(dnlddep)
library(purrr)

package_names = c('tidyverse', 'fastverse', 'data.table')

ls_package_names = map(package_names, pkg_dep_all)

vec_package_names = 
  ls_package_names %>% 
  Reduce() %>% 
  unique()

download_dep(vec_package_names, 'Path/folder_for_downloaded_packages/')
```
