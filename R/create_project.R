
create_project <- function(path, ...) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # generate header for file
  header <- c(

    "# The following inputs were received:",
    ""
  )

  # collect inputs and paste together as 'Parameter: Value'
  dots <- list(...)

  new_catalog(collection = dots$collection,
              title = dots$title,
              author = dots$author,
              description = dots$description,
              target_dir = path)


}
