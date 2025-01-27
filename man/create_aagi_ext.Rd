% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_aagi_ext.R
\name{create_aagi_ext}
\alias{create_aagi_ext}
\title{Create new Quarto document from template}
\usage{
create_aagi_ext(
  file_name = NULL,
  ext_name = "aagi-report",
  university = "UA",
  path = path
)
}
\arguments{
\item{file_name}{Name of new qmd file and sub-directory to be created}

\item{ext_name}{String indicating which extension to install}

\item{university}{String indicating which university partner to use}

\item{path}{Path to save new qmd file}
}
\value{
a message if extension was successfully copied over
}
\description{
Install bundled Quarto extensions into current working directory and create
new qmd using skeleton documents.
}
