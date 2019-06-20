set -e

echo "install from ./requirements.txt"
python3 -m pip install -r requirements.txt

# install Imports for each content page
echo "installing dependencies for content pages with requrements.txt files..."
find ./content -type f -name 'requirements.txt' -printf '%h\n' |
    while read line; do
        printf "\n=== === ===\n\t$line\n=== === ===\n";
        python3 -m pip install -r $line
    done
