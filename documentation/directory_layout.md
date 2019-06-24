
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
The infographic image is a `.svg` image and can be edited with [Inkscape](https://inkscape.org/).
The only special thing about this `.svg` file is the element id property of clickable items.

### Connecting content to infographic
`./content/svg-links.csv` connects image elements from `/content/svg/` to modal content in `./content/modals/` using the `modal_id` column.
Values in the `modal_id` column **must** match the element id property in the `.svg` exactly.

### Main Menu Links
Main menu is configured in `/content/menu/`.

### Other Global Config
`config.toml` contains global config info for hugo, bookdown, and the theme.
