% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_available_files.r
\name{get_available_files}
\alias{get_available_files}
\title{Helper function for \code{download_abs_data_cube} to show the available catalogues.}
\usage{
get_available_files(catalogue_string, refresh = FALSE)
}
\arguments{
\item{catalogue_string}{character string specifying the catalogue, e.g. "labour-force-australia-detailed".
You can use \code{show_available_catalogues} to find this out.}

\item{refresh}{logical; `FALSE` by default. If `FALSE`, an internal table
of the available ABS catalogues is used. If `TRUE`, this table is refreshed
from the ABS website.}
}
\value{
A tibble containing the title of the file, the filename and the complete url.
}
\description{
This function lists the possible files that are available in a catalogue.
The filename (or an unambiguous part of the filename) must be specified
as a string as an argument to \code{download_abs_data_cube}.
}
\examples{
\dontrun{
get_available_files("labour-force-australia-detailed")
}

}
