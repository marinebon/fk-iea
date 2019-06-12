# fk-iea
Infographic created via collaboration between the Florida Keys National Marine Sanctuary (FKNMS), the Florida Keys Integrated Ecosystem Assessment (IEA), and the Marine Biodiversity Observation Network (MBON).

An overview map of the FL Keys (mockup below) is used as a landing page:
![overview](content/svg/fl-keys.svg)

Clicking on the elements in that graphic leads to a zoomed-in sub-infographic with relevant elements highlighted from the following mockup:
![overview](extra_files/fk_zoomed.svg)

Each region "box" in this graphic will be a clickable element which leads to an infographic representing that region.

## Basic Development Workflow
Edits can be made directly on the github website so no setup is required.

The basic development workflow is:

1. edit files
2. wait for your changes to be built and deployed to the website

This easily-accessible workflow has some drawbacks though:
* waiting for the site to build can be tedious
* typos and other tiny errors won't be caught until the site builds
* only one file can be edited per commit, and the github editor isn't perfect.

For these and other reasons, you may want to consider the "advanced dev workflow" below.

## Directory Layout
Wondering which files to edit?
This section explains which files are most important and how to make specific changes.

### Basic Content
Firstly: `.md` and `.Rmd` files are the basic building block of the site.
These files are in the `./content` directory and editing them is a great way to get started.
These files use markdown syntax with embedded, executed R and python chunks.

### Editing the infographic image
The infographic image is a `.svg` image and can be edited with Inkscape.
The only special thing about this `.svg` file is the element id property of clickable items.

### Connecting content to infographic
`./modal_plots.csv` connects image elements from `/docs/svg/` to modal content in `./docs/modals/` using the `modal_id` column.
Values in the `modal_id` column must match to the element id property in the `.svg`.

### Main Menu Links
Main menu is configured in `/content/menu/`

### Other Global Config
`config.toml` contains global config info for hugo, bookdown, and the theme.

## Advanced Dev
This site is built with bookdown and deployed as a static file website.

### Get the Code
You should clone this repo using the `--recursive` param [[ref](https://www.vogella.com/tutorials/GitSubmodules/article.html#cloning-a-repository-that-contains-submodules)].
This also clones the git submodules (needed for hugo theme at a minimum).

```bash
git clone --recursive https://github.com/marinebon/fk-iea
```

### Install R Dependencies
Firstly, the latest [R](http://cran.revolutionanalytics.com/) and [python](https://docs.python-guide.org/starting/installation/) should be installed.
These instructions assume you are using a unix-based operating system (linux/OSX).

```bash
./install_R_deps.sh

# verify blogdown installation:
Rscript -e 'blogdown::hugo_version()'
```

### Workflow
1. edit files
2. test build of the site using [blogdown's RStudio addins](https://bookdown.org/yihui/blogdown/rstudio-ide.html) or by running `blogdown::serve_site()`

## Deployment configuration
Travis CI is used to deploy the website to github pages via the gh-pages branch.
The github personal access token(s) used by travis can be accessed (only by authorized accounts) [here](https://drive.google.com/drive/folders/168X9drMc_eFdZ6eCesgwR56Ek3m_OrZg?usp=sharing).

### Manual Deployment
Follow these instructions to manually deploy locally-built html to the gh-pages branch.
This is needed if Travis breaks (eg if the build is taking too long).

```bash
rm -rf public
Rscript -e 'blogdown::build_site()'
cd public
git init
git remote add origin https://github.com/marinebon/fk-iea
git add *
git commit -m 'manual site build'
git branch gh-pages
git checkout gh-pages
git push -f origin gh-pages
```

## additional links
* Based on the example at https://github.com/ioos-eco/cinms.
* List of [hugo-powered IOOS websites on github](https://github.com/ioos?utf8=%E2%9C%93&q=&type=&language=html)
* List of [hugo-powered GSA websites on github](https://github.com/gsa?utf8=%E2%9C%93&q=&type=&language=html)
