% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data_packages.R
\name{get_data_packages}
\alias{get_data_packages}
\alias{get_data_package}
\title{Retrieve digital data package holding(s) from DataStore.}
\usage{
get_data_packages(
  reference_id,
  secure = FALSE,
  path = here::here(),
  force = FALSE,
  dev = FALSE
)

get_data_package(
  reference_id,
  secure = FALSE,
  path = here::here(),
  force = FALSE,
  dev = FALSE
)
}
\arguments{
\item{reference_id}{is a 6-7 digit number corresponding to the reference ID of the data package.}

\item{secure}{logical indicating whether the file should be acquired using data services available to NPS internal staff only. Defaults to FALSE for public data. TRUE indicates internal data and requires a VPN connection (unless you are in an NPS office).}

\item{path}{String. Indicates the location that the "data" directory and all sub-directories and files should be written to. Defaults to the working directory.}

\item{force}{Logical. Defaults to FALSE. In the FALSE condition, the user is prompted if a directory already exists and asked whether to overwrite it or not. The user is also given information about which files are being downloaded, extracted, deleted, and where they are being written to. The user is also notified if there is a newer version of the requested data package and given the option to download the newest version instead of the requested version. It also provides information about what errors (if any) were encountered and give suggestions on how to address them.

A user may choose to set `force = TRUE`, especially when scripting or batch processing to minimize print statements to the console.  When force is set to TRUE, all existing files are automatically overwritten without prompting. Feedback about which files are being downloaded and where is not reported. The user is not informed of newer versions of the requested data packages; only the exact reference specified is downloaded. If a reference ID corresponds to something that is not a data package, the contents will be downloaded anyway. Only critical errors that stop the function (such as failed API calls) generate warnings. Failed downloads (invalid reference ID, insufficient DataStore privileges) will result in an empty folder corresponding to that data package within the 'data' folder.}

\item{dev}{Logical. Defaults to FALSE. FALSE indicates all operations will be performed in DataStore's production environment. Setting dev = TRUE enables running functions against the DataStore development environment. Working in the development environment will allow you to test functions and code without affecting the publicly accessible DataStore application.}
}
\value{
String. The path (including the /data folder) where all data package sub-directories and data files are contained.
}
\description{
`get_data_packages()` creates a directory called "data" in the current working directory (or user-specified location, see the `path` option). For each data package, it writes a new sub-directory within the "data" directory named with the corresponding data package reference ID. All the data package files are then copied to the directory specific to the data package.
}
\details{
In the default mode (force = FALSE), `get_data_packages()` will inform a user if the directory for that data package already exists and give the user the option to overwrite it (or skip downloading). In the default mode (force = FALSE), `get_data_packages()` will also check to see if there are newer versions of the requested data package and if there are newer versions, `get_data_packages()` will inform the user of when the requested data package was issued, when the newest data package was issued, and will then ask the user if they would like to download the newest version instead of the requested version. In the default mode (force = FALSE), `get_data_packages()` will warn a user if the reference ID supplied was not found (does not exist or requires VPN) and if a reference ID refers to a product that is not a data package, `get_data_packages()` will ask if the user wants to attempt to download it anyway. `get_data_packages()` will automatically time out if any individual file download exceeds 300 seconds (5 minutes). Very large files or slow internet connections may hit this limit.

Although `get_data_packages()` is designed to handle the data package reference type on DataStore, it should in theory work on any reference type and download all files associated with a reference (it ignores web links/web resources associated with a reference). If the reference includes a .zip file, the file will be downloaded and the contents extracted. The original .zip archive file will then be deleted. If the .zip contains files with the same name as files in the parent directory, the parent directory files will be over-written by the contents of the .zip archive.
}
\examples{
\dontrun{
# get a public data package
get_data_packages(2300498, secure = FALSE)

# get a list of data packages, some public some restricted
get_data_packages(c(2272461, 1234567, 7654321), secure = TRUE)

# pass a list of data packages to retrieve to the function:
data_packages <- c(2272461, 1234567, 7654321)
get_data_packages(data_packages, secure = TRUE, path = "../../my_custom_directory")

# get a data package and return the path the data package is saved to
pathToDataForPiping <- get_data_packages(2272461, secure = TRUE, force = FALSE)
}
}
