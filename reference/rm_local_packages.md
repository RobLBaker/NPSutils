# Delete data packages from your local machine

\`rm_local_packages()\` will delete one or more specified data packages
from your local machine (not DataStore). The function assumes that all
data packages are in a folder called "data" and will delete items within
the folder "data" but will not remove the "data" folder itself. You
could just delete the files using Windows explorer. But if you really
hate your OS (or just don't like using a mouse) you can do it this way
too.

## Usage

``` r
rm_local_packages(
  reference_id,
  all = FALSE,
  path = here::here(),
  force = FALSE
)
```

## Arguments

- reference_id:

  List. One or more data packages indicated by their 7-digit reference
  number.

- all:

  Logical. Defaults to \`FALSE\`. When set to \`TRUE\` all files and
  directories within the "data" folder will be deleted. It does not
  matter whether they are data packages or other files: the "data"
  folder will be empty. When \`all = TRUE\`, you do not need to supply
  the data package reference IDs in the reference_id parameter. When set
  to TRUE,

- path:

  String. Defaults to the current working directory. The assumption is
  that the "data" folder containing data packages is located in the
  working directory (in other words, it assumes you used the default
  path when downloading data packages using \`get_data_packages()\`). If
  you downloaded data packages to a custom directory, use \`path\` to
  specify the directory where the "data" folder containing the data
  packages is located. Do not include the "data" folder itself in the
  path you supply.

- force:

  Logical. Defaults to \`FALSE\`. If set to \`TRUE\` (for instance for
  scripting purposes) the output to the console is suppressed.

## Value

invisible

## Examples

``` r
if (FALSE) { # \dontrun{
#delete a single local data package:
delete_packages(1234567)

#delete multiple local data packages:
pkgs<-c(1234567, 1234568, 1234569)
delete_packages(pkgs, force=TRUE)

#delete all local data packages:
delete_packages(all = TRUE)

#delete data packages from a "data" directory in a custom location:
rm_local_packages(1234567, path = "C:/Users/username/Documents")
} # }
```
