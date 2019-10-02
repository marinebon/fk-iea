set -e

Rscript -e 'if (!requireNamespace("devtools")) install.packages("devtools")'

# install global Imports from DESCRIPTION
Rscript -e 'devtools::install(pkg=".", quick=TRUE, quiet=TRUE, upgrade=TRUE)'

# # install Imports for each content page
# echo "\n\ninstalling dependencies for content pages with DESCRIPTION files..."
# find ./modals -type f -name 'DESCRIPTION' -printf '%h\n' |
#     while read line; do
#         printf "\n=== === ===\n\t$line\n=== === ===\n";
#         Rscript -e "devtools::install( \"$line\", quick=TRUE, quiet=TRUE, upgrade=TRUE)";
#     done
