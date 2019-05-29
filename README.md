# fk-iea
Infographic created via collaboration between the Florida Keys National Marine Sanctuary (FKNMS), the Florida Keys Integrated Ecosystem Assessment (IEA), and the Marine Biodiversity Observation Network (MBON).

An overview map of the FL Keys (mockup below) is used as a landing page.
![overview](assets/img/readme_overview-mockup.png)

Each region "box" in this graphic will be a clickable element which leads to an infographic representing that region.

## Technical
Based on the example at https://github.com/ioos-eco/cinms.

Basic development workflow is:

1. edit `.Rmd` files in `./docs/modals/`
2. run `make_site.R`

`./modal_plots.csv` connects image elements from `/docs/svg/` to modal content in `./docs/modals/` using the `modal_id` column.
Values in the `modal_id` column must match to the element id property in the `.svg`.
