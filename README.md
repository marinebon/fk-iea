# fk-iea
Infographic created via collaboration between the Florida Keys National Marine Sanctuary (FKNMS), the Florida Keys Integrated Ecosystem Assessment (IEA), and the Marine Biodiversity Observation Network (MBON).

![overview](extra_files/fk_zoomed.svg)

## Basic Development Workflow
Don't be afraid to edit!!! 
Git saves *everything* and the github+travis+blogdown stack is very hard to break.

Edits can be made directly on the github website so no setup is required.

The basic development workflow is:

1. edit `.Rmd` (or `.md`) files in `./content/modals/`.
2. wait for your changes to be built and deployed to the website
    * NOTE: See the status of recent builds (:heavy_check_mark:, :x:, :full_moon:) on the [commit history page](https://github.com/marinebon/fk-iea/commits/master)

This easily-accessible workflow has some drawbacks:
* :sleepy: waiting for the site to build can be boring 
* :poop: typos and other tiny errors won't be caught until the site builds
* :octocat: only one file can be edited per commit and the github editor isn't perfect.

For these and other reasons, you may want to consider the "advanced dev workflow" in `./documentation/advanced_dev.md`.

Alternatively: for an even more [WYSiWYG](https://en.wikipedia.org/wiki/WYSIWYG)-style content editor (e.g. google docs) edits can be made using the [prose.io](http://prose.io/) web application.

Additional documentation can be found in the `./documentation/` directory.

If you are still afraid to edit or have other questions/comments please start a discussion by opening an "issue" in [the fk-iea github issue tracker](https://github.com/marinebon/fk-iea/issues).

### Develop

Because of CORS, need local web server to debug:

```r
setwd(here::here("docs"))
servr::httw()
```

## additional links
* Based on the example at https://github.com/ioos-eco/cinms.
* List of [hugo-powered IOOS websites on github](https://github.com/ioos?utf8=%E2%9C%93&q=&type=&language=html)
* List of [hugo-powered GSA websites on github](https://github.com/gsa?utf8=%E2%9C%93&q=&type=&language=html)
