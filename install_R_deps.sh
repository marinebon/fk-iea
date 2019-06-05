set -e

Rscript -e 'if (!requireNamespace("devtools")) install.packages("devtools")'

# install Imports from DESCRIPTION
Rscript -e 'devtools::install()'

# blogdown setup [[ref](https://bookdown.org/yihui/blogdown/installation.html)]
# Rscript -e 'devtools::install_github("rstudio/blogdown")'
Rscript -e 'blogdown::install_hugo()'
