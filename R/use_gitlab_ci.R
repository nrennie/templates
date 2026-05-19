#' Create GitLab CI/CD file
#' @param type Type of CI/CD pipeline. Options include `"pages"`, `"quarto"`,
#' `"quarto-r"`, or `"pkgdown"`.
#' @param overwrite Boolean to overwrite existing file if it exists.
#' Default `FALSE`.
#' @return a message if template file was successfully copied over
#' @export

use_gitlab_ci <- function(type, overwrite = FALSE) {
  # Check if file exists
  if (file.exists(".gitlab-ci.yml")) {
    if (!overwrite) {
      stop(
        "'.gitlab-ci.yml' already exists. Set `overwrite = TRUE` to create anyway."
      )
    } else {
      file.remove(".gitlab-ci.yml")
    }
  } else {
    file.create(".gitlab-ci.yml")

    template_name <- paste0("gitlab/gitlab-ci-", type, ".yml")

    txt <- readLines(system.file(template_name,
      package = "templates",
      mustWork = TRUE
    ))
    writeLines(txt, con = ".gitlab-ci.yml")
    message("'.gitlab-ci.yml' created")
  }
}
