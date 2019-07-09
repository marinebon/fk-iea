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
