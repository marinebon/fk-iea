set -e

echo "install from ./requirements.txt"
python3 -m pip install --user -r requirements.txt

# install Imports for each content page
# echo "installing dependencies for content pages with requrements.txt files..."
# find ./modals -type f -name 'requirements.txt' -printf '%h\n' |
#     while read line; do
#         printf "\n=== === ===\n\t$line\n=== === ===\n";
#         python3 -m pip install --user -r $line
#     done
