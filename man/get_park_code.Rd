% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getParkUnitInfo.R
\name{get_park_code}
\alias{get_park_code}
\title{Restricts get_unit_code to just National Parks}
\usage{
get_park_code(park)
}
\arguments{
\item{park}{is a case-insensitive string containing some part of the unit's FullName, e.g "Yellow".}
}
\value{
one data frame to the global environment. May contain multiple matches.
}
\description{
`get_park_code` is identical to `get_unit_code` except the output is restricted to just National Parks (as opposed to including networks, etc.). Accesses info from irmaservices.nps.gov. Search for park or park unit with any string and return all applicable national park unitCodes.
}
\examples{
\dontrun{
get_park_code("Yellow")
}
}
