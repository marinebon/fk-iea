set -e

Rscript -e 'if (!requireNamespace("devtools")) install.packages("devtools")'

# install global Imports from DESCRIPTION
Rscript -e 'devtools::install()'

# install Imports for each content page
echo "installing dependencies for content pages. DESCRIPTION files found in:"
find ./content -type f -name 'DESCRIPTION' -print0 | xargs -0 echo "$(sed -r 's|/[^/]+$||' )"

find ./content -type f -name 'DESCRIPTION' -print0 | \
    xargs -0 Rscript -e "devtools::install( \"$(sed -r 's|/[^/]+$||')\")"

# blogdown setup [[ref](https://bookdown.org/yihui/blogdown/installation.html)]
# Rscript -e 'devtools::install_github("rstudio/blogdown")'
Rscript -e 'blogdown::install_hugo()'
