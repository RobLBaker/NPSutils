% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_data_packages.R
\name{load_data_packages}
\alias{load_data_packages}
\alias{load_data_package}
\title{Read contents of data package(s) and return a list of tibbles list of tibbles based on the data file(s). Can use metadata to specify data types.}
\usage{
load_data_packages(
  reference_id,
  directory = here::here("data"),
  assign_attributes = FALSE,
  simplify = TRUE
)

load_data_package(
  reference_id,
  directory = here::here("data"),
  assign_attributes = FALSE,
  simplify = TRUE
)
}
\arguments{
\item{reference_id}{the immediate directory/directories where your data packages reside. For data packages downloaded from DataStore using `get_data_package()` or `get_data_packages()` default settings, this is the DataStore reference ID for your data package(s). Alternatively, you can set `reference_id` to "`load_all`", which will load all the data packages in the directory specified in via `directory` (typically ./data).}

\item{directory}{is the location of a folder that contains all of the data packages (where data packages are a folder containing .csv data files and a single .xml EML metadata file). If these data packages were downloaded from DataStore using the default settings for `get_data_packages`, this folder is "./data" and you can use the default settings for `directory`.}

\item{assign_attributes}{Logical. Defaults to FALSE. Data will be loaded using `readr::read_csv()` guessing algorithm for calling column types. If you set to `assign_attributes = TRUE`, column types will be set using the data types specified in the metadata. Currently supported data types include string, dateTime, float, double, integer, and categorical (factor in R). This assignment is very stringent: for instance if you did not specify date-time formats using ISO-8601 notation (i.e. "YYYY", not "yyyy"), your data will import as NAs. If you have undefined missing values or blank cells, your data will not import at all. If you run into problems consider using the default settings and letting `read_csv` guess the column types.}

\item{simplify}{Logical. Defaults to TRUE. If `simplify = TRUE`, the function will return a list of tibbles where each tibble is a data file from the data package(s) specified. The tibbles are named using the following format: "pkg_<reference_id.filename" (without the filename extension). If you want to load each individual data file into R for further processing, use `simplify = TRUE` and then run `list2env(x, envir=.GlobalEnv)`. If you set `simplify = FALSE`, the object returned will either be a list of tibbles identical to that returned by `simplify = TRUE` (if only one data package is loaded) or will be a list of lists where each nested list is a contains one tibble for each data file in each data package.Setting `simplify = FALSE` may make it easier to do post-processing on a package-by-package level rather than a tibble-by-tibble level.}
}
\value{
a list of (of lists of) tibbles.
}
\description{
`load_data_packages()` loads one to many data packages and returns a list. If only one data package is loaded, the list will be a list of tibbles where each tibble is a data (.csv) file from the data package. If multiple data packages are loaded, the list will be a list of lists where each nested list contains a list of tibble and each tibble is a data file (.csv). See `simplify` below for details on handling these lists.
}
\details{
currently `load_data_packages()` only supports EML metadata and .csv files. The reference_id 
'
}
\examples{
\dontrun{
dat <- load_data_packages(2272461)
}

}
