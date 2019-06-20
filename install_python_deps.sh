set -e

# install global Imports from requirements.txt
pip install -q -r requirements.txt

# install Imports for each content page
echo "\n\ninstalling dependencies for content pages with requrements.txt files..."
find ./content -type f -name 'requirements.txt' -printf '%h\n' |
    while read line; do
        printf "\n=== === ===\n\t$line\n=== === ===\n";
        pip install -q -r $line
    done
