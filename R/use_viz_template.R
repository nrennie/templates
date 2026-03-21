#' Create folder and files for data viz
#' @param dir Directory to put script
#' @param filename File path where script should go inlcuding name.
#' @param lang Language, either `"R"`, `"Python"`, or `"D3"`.
#' @return a message if template file was successfully copied over
#' @export

use_viz_template <- function(dir = ".",
                             filename = "script",
                             lang = "R") {
  # make folder
  new_folder <- file.path(dir)
  if (!file.exists(new_folder)) {
    dir.create(new_folder, recursive = TRUE)
    message("Created new folder")
  }
  # make new file
  if (lang == "R") {
    new_file <- file.path(dir, paste0(filename, ".R"))
    if (!file.exists(new_file)) {
      file.create(new_file)
      message("Created '.R' file")
      # copy lines to .R file
      r_txt <- readLines(system.file("viz/viz-template.R",
        package = "templates",
        mustWork = TRUE
      ))
      # write to new file
      writeLines(r_txt, con = new_file)
      message("'.R' contents copied")
    }
  } else if (lang == "Python") {
    new_file <- file.path(dir, paste0(filename, ".py"))
    if (!file.exists(new_file)) {
      file.create(new_file)
      message("Created '.py' file")
      # copy lines to .py file
      py_txt <- readLines(system.file("viz/viz-template.py",
        package = "templates",
        mustWork = TRUE
      ))
      # write to new file
      writeLines(py_txt, con = new_file)
      message("'.py' contents copied")
    }
  } else if (lang == "D3") {
    new_file <- file.path(dir, paste0(filename, ".js"))
    if (!file.exists(new_file)) {
      file.create(new_file)
      message("Created '.js' file")
      js_txt <- readLines(system.file("viz/viz-template.js",
        package = "templates",
        mustWork = TRUE
      ))
      writeLines(js_txt, con = new_file)
      message("'.js' contents copied")
    }

    new_r_file <- file.path(dir, paste0(filename, ".R"))
    if (!file.exists(new_r_file)) {
      file.create(new_r_file)
      message("Created '.R' file")
      r_txt <- readLines(system.file("viz/viz-js-template.R",
        package = "templates",
        mustWork = TRUE
      ))
      writeLines(r_txt, con = new_r_file)
      message("'.R' contents copied")
    }

    new_html_file <- file.path(dir, "index.html")
    if (!file.exists(new_html_file)) {
      file.create(new_html_file)
      message("Created 'index.html' file")
      html_txt <- readLines(system.file("viz/viz-template.html",
        package = "templates",
        mustWork = TRUE
      ))
      writeLines(html_txt, con = new_html_file)
      message("'index.html' contents copied")
    }
  }

  message("Template successfully copied!")
}
