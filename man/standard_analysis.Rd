% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/standard_analysis.R
\name{standard_analysis}
\alias{standard_analysis}
\title{Create standard analysis template for RStudio project}
\usage{
standard_analysis(
  path,
  include_analysis_for_publication,
  use_renv,
  include_gitignore,
  ...
)
}
\arguments{
\item{path}{path of the new project}

\item{include_analysis_for_publication}{additional Analysis for publication folder}

\item{use_renv}{should renv be used?}

\item{include_gitignore}{should a gitingore file be created}

\item{...}{additional parameters, currently not used}
}
\value{
no return values, just the folders and README are created
}
\description{
Create standard analysis template for RStudio project
}
