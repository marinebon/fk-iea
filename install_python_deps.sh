set -e

echo "install from ./requirements.txt"
pip3 install -r requirements.txt

# install Imports for each content page
echo "installing dependencies for content pages with requrements.txt files..."
find ./content -type f -name 'requirements.txt' -printf '%h\n' |
    while read line; do
        printf "\n=== === ===\n\t$line\n=== === ===\n";
        pip3 install -r $line
    done
