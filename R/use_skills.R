#' Create Skills.md file
#' @param type Type of Skills.md file. Options include `"r-general"`.
#' @param dir Directory to put files into. Default `".claude/skills/"`.
#' @return a message if template file was successfully copied over
#' @export

use_skills <- function(type, dir = ".claude/skills") {
  new_dir <- file.path(dir, type)
  new_md <- file.path(new_dir, "SKILL.md")

  if (!dir.exists(new_dir)) {
    dir.create(new_dir, recursive = TRUE)
  }

  file.create(new_md)

  skills_name <- paste0("skills/", type, ".md")

  txt <- readLines(system.file(skills_name,
    package = "templates",
    mustWork = TRUE
  ))
  writeLines(txt, con = new_md)
  message("'SKILL.md' created")
}
