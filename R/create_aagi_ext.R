#' Create new AAGI Quarto project from template
#'
#' Install bundled Quarto extensions into current working directory and create
#' new qmd using skeleton documents. This function extends a function written by
#' Thomas Mock: https://github.com/jthomasmock/octavo/blob/master/R/use_quarto_ext.R
#' and by Spencer Schien: https://spencerschien.info/post/r_for_nonprofits/quarto_template/.
#' This is equivalent to the quarto command `quarto use` with a `--template` flag.
#'
#' @param file_name Name of new qmd file and sub-directory to be created
#' @param ext_name String indicating which extension to install
#' @param university String indicating which university partner to use
#' @param path Path to save new qmd file
#'
#' @return a message if extension was successfully copied over
#' @export
create_aagi_ext <- function(file_name = NULL,
                            ext_name = "aagi-report",
                            university = "UA",
                            path = ".") {

  if (is.null(file_name)) {
    stop("You must provide a valid file_name")
  }

  ext_dir <- fs::path(path, "_extensions")
  if(!file.exists(ext_dir)) dir.create(ext_dir, recursive = TRUE, showWarnings = FALSE)

  ext_yml <- readLines(system.file(paste0("extdata/_extensions/", ext_name, "/_extension.yml"),
    package = "AAGIQuartoExtra"
  ))

  ext_ver <- trimws(gsub(
    x = ext_yml[grepl(x = ext_yml, pattern = "version:")],
    pattern = "version: ([^#]*)#?.*",
    replacement = "\\1"
  ))

  ext_nm <- trimws(gsub(
    x = ext_yml[grepl(x = ext_yml, pattern = "^title:")],  # Match only lines starting with "title:"
    pattern = "title: ([^#]*)#?.*",
    replacement = "\\1"
  ))

  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name), package = "AAGIQuartoExtra"),
    to = ext_dir,
    overwrite = TRUE,
    recursive = TRUE,
    copy.mode = TRUE
  )

  n_files <- length(dir(paste0(ext_dir, "/", ext_name)))

  if (n_files >= 2) {
    message(paste0(ext_nm, " (v", ext_ver,") ", "was installed to _extensions folder in project path"))
  } else {
    message("Extension appears not to have been created")
  }

  template_lines <- readLines(paste0(ext_dir, "/", ext_name, "/template.qmd"))

  if (university == "UA") {
    template_lines <- gsub(
      "report-series: \".*\"",
      'report-series: "Analytics for the Australian Grains Industry - University of Adelaide (AAGI-UA)"',
      template_lines
    )
    template_lines <- gsub(
      'email: \".*\"',
      'email: "your.email@adelaide.edu.au"',
      template_lines
    )
  } else if (university == "CU") {
    template_lines <- gsub(
      "report-series: \".*\"",
      'report-series: "Analytics for the Australian Grains Industry - Curtin University (AAGI-CU)"',
      template_lines
    )
    template_lines <- gsub(
      'email: \".*\"',
      'email: "your.email@curtin.edu.au"',
      template_lines
    )
  } else if (university == "UQ") {
    template_lines <- gsub(
      "report-series: \".*\"",
      'report-series: "Analytics for the Australian Grains Industry - University of Queensland (AAGI-UQ)"',
      template_lines
    )
    template_lines <- gsub(
      'email: \".*\"',
      'email: "your.email@uq.edu.au"',
      template_lines
    )
  }

  writeLines(text = template_lines, con = paste0(path, "/", file_name, ".qmd"))
}
