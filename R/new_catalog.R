
new_catalog <- function(collection = NULL,
                        title = "A Title",
                        author = "A. Author",
                        description = "Some explanation",
                        template = "catalog1",
                        language = "en",
                        target_dir = tempdir()) {

  # Get index template
  fp <- file.path("rstudio", "templates","project", "design", template, "index.Rmd")
  tf <- system.file(fp, package = "gbcatalog")
  stopifnot(file.exists(tf))
  tin <- readLines(tf)

  # insert title, author, description and create a chapter per accession if collection is not NULL
  wd <- list(title = title, author = author, description = description)
  txt <- whisker::whisker.render(tin, wd)

  # create target dir as RStudio project dir and copy all files from tempdir

  writeLines(txt, file.path(target_dir, "index.Rmd"))

  # then open target dir in RStudio
  # done from project wizard; configurable in project yaml; can also open several files


}
