# fk-iea
Infographic created via collaboration between the Florida Keys National Marine Sanctuary (FKNMS), the Florida Keys Integrated Ecosystem Assessment (IEA), and the Marine Biodiversity Observation Network (MBON).

![overview](extra_files/fk_zoomed.svg)

## Basic Development Workflow
Edits can be made directly on the github website so no setup is required.

The basic development workflow is:

1. edit files
2. wait for your changes to be built and deployed to the website
    * NOTE: See the status of recent builds (:heavy_check_mark:, :x:, :full_moon:) on the [commit history page](https://github.com/marinebon/fk-iea/commits/master)

This easily-accessible workflow has some drawbacks though:
* waiting for the site to build can be tedious
* typos and other tiny errors won't be caught until the site builds
* only one file can be edited per commit, and the github editor isn't perfect.

For these and other reasons, you may want to consider the "advanced dev workflow" in `./documentation/advanced_dev.md`.

## Directory Layout
Wondering which files to edit?
This section explains which files are most important and how to make specific changes.

### Basic Content
Firstly: `.md` and `.Rmd` files are the basic building block of the site.
These files are in the `./content` directory and editing them is a great way to get started.
These files use markdown syntax with embedded, executed R and python chunks.

The `./content/posts/` directory contains examples to help newcomers.
The `./content/modals/` directory contains the files connected to the infographics.

### Editing the infographic image
The infographic image is a `.svg` image and can be edited with Inkscape.
The only special thing about this `.svg` file is the element id property of clickable items.

### Connecting content to infographic
`./modal_plots.csv` connects image elements from `/docs/svg/` to modal content in `./docs/modals/` using the `modal_id` column.
Values in the `modal_id` column must match to the element id property in the `.svg`.

### Main Menu Links
Main menu is configured in `/content/menu/`.

### Other Global Config
`config.toml` contains global config info for hugo, bookdown, and the theme.


## additional links
* Based on the example at https://github.com/ioos-eco/cinms.
* List of [hugo-powered IOOS websites on github](https://github.com/ioos?utf8=%E2%9C%93&q=&type=&language=html)
* List of [hugo-powered GSA websites on github](https://github.com/gsa?utf8=%E2%9C%93&q=&type=&language=html)
