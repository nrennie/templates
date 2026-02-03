#' Create folder and files for website blog post
#' @param date_chr Date in yyyy-mm-dd format.
#' @param slug Character string with url slug e.g. `"talks-title"`
#' @return a message if template file was successfully copied over
#' @export

use_talks_template <- function(date_chr = "2025-12-31", slug) {
  # check date in correct format
  if (is.na(as.Date(date_chr, format = "%Y-%m-%d"))) {
    stop("'date_chr' in incorrect format. Should be yyyy-mm-dd.")
  }
  # make folder
  new_folder <- file.path("talks", paste0(date_chr, "-", slug))
  if (!file.exists(new_folder)) {
    dir.create(new_folder, recursive = TRUE)
    message("Created new folder")
  }
  # make new file
  new_file <- file.path("talks", paste0(date_chr, "-", slug), "index.qmd")
  if (!file.exists(new_file)) {
    file.create(new_file)
    message("Created 'index.qmd' file")
    # copy lines to index.qmd file
    r_txt <- readLines(system.file("talks/index.qmd",
      package = "templates",
      mustWork = TRUE
    ))
    r_txt <- gsub(
      pattern = "date_chr",
      replacement = paste0("\"", date_chr, "\""),
      x = r_txt
    )
    r_txt <- gsub(
      pattern = "slug",
      replacement = paste0("\"", slug, "\""),
      x = r_txt
    )
    # write to new file
    writeLines(r_txt, con = new_file)
    message("'index.qmd' contents copied")
  }

  message("Template successfully copied!")
}
