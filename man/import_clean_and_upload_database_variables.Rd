% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import-variables.R
\name{import_clean_and_upload_database_variables}
\alias{import_clean_and_upload_database_variables}
\title{(For admin) Import and process the \code{field.tsv} file before uploading to UKB RAP home folder.}
\usage{
import_clean_and_upload_database_variables()
}
\value{
Saves a CSV file in the main RAP Project folder.
}
\description{
This function imports the \code{field.tsv} file in the \verb{Showcase metadata} folder
and then processes it so that the variable names and field IDs match what is
found in the "Cohort Browser" (because annoyingly they don't match). Lastly,
the processed metadata gets saved back to the RAP Project folder so other
researchers on the Project can use it to select (and eventually download) the
variables and data they need for their analysis. The purpose of this function
is to create this shared \code{database-variables.csv} file so that, when used in
conjunction with the \code{\link[=read_ukb_database]{read_ukb_database()}} function, the variable selection
and data creation can be reproduced easily. Small note, the \code{schema.tsv} file
in the metadata folder briefly describes what each TSV file contains.
}
