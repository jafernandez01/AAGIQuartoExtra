% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aagi_project.R
\name{aagi_project}
\alias{aagi_project}
\title{Create a new AAGI project}
\usage{
aagi_project(path, ...)
}
\arguments{
\item{path}{Path to save the new project}

\item{...}{Additional arguments}
}
\value{
A new AAGI project
}
\description{
Create a new AAGI project with the following structure:
}
\details{
\itemize{
\item{A new directory with the name of the project}
\item{A \verb{_quarto.yml} file with the title of the project}
\item{A \code{index.qmd} file with the title of the project}
\item{A \code{references.bib} file}
\item{A \code{pyenv} directory if \code{python_venv} is \code{TRUE}}
\item{A \code{renv} directory if \code{with_renv} is \code{TRUE}}
}
}
