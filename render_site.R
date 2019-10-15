library(rmarkdown)
library(here)
library(glue)
library(readr)
library(fs)
library(purrr)
here <- here::here

options(warn = 0) # default
#options(warn = 2) # warnings to errors

# parameters
csv         <- here("svg/svg_links.csv")
redo_modals <- F

# read in links for svg
d <- read_csv(csv)

site_theme <- site_config()$output$html_document$theme
site_root  <- site_config()$output_dir

render_modal <- function(rmd){
  
  render(rmd, html_document(
    theme = site_theme, 
    self_contained=F, lib_dir = here("modals/modal_libs"), 
    mathjax = NULL))
  
  htm <- fs::path_ext_set(rmd, "html")
  docs_htm <- glue("{site_root}/{htm}")
  docs_rmd <- glue("{site_root}/{rmd}")
  file.copy(rmd, docs_rmd, overwrite = T)
  file.copy(htm, docs_htm, overwrite = T)
}

# render_modal("modals/algal-groups.Rmd")
# render_modal("modals/barnacles.Rmd")
# render_modal("modals/mussels.Rmd")

# create/render modals by iterating over svg links in csv ----
d_m <- d %>% filter(is.na(not_modal) | !not_modal)
for (i in 1:nrow(d_m)){ # i=1
  # paths
  htm <- d_m$link[i]
  rmd <- path_ext_set(htm, "Rmd")
  
  # create Rmd, if doesn't exist
  if (!file.exists(rmd)) file.create(rmd)
  
  # render Rmd to html, if Rmd newer or redoing
  if (file.exists(htm)){
    rmd_newer <- file_info(rmd)$modification_time > file_info(htm)$modification_time
  } else {
    rmd_newer <- T
  }
  if (rmd_newer | redo_modals){
    message(glue("render_modal: {basename(rmd)}"))
    render_modal(rmd)
  }
}

# render website, ie Rmds in root ----
#walk(list.files(".", "*\\.md$"), render_modal)
# walk(
#   list.files(".", "*\\.html$"), 
#   function(x) file.copy(x, path_expand(file.path(site_root, x))))
render_site()

# shortcuts w/out full render:
# file.copy("libs", "docs", recursive=T)
# file.copy("svg", "docs", recursive=T)
#file.copy(csv, "docs/svg/svg_links.csv", overwrite=T)
#file.copy("libs", "docs/", recursive=T)

