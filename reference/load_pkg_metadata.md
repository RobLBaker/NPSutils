# Loads EML-formatted metadata into R for inspection and/or editing

\`load_pkg_metadata()\` is essentially a wrapper around
\`DPchecker::load_metadata\` with the directory structure pre-set to
work well the default location that \`get_data_package\` stores
downloaded data packages. If you did not use the default settings for
\`get_data_package\` (or downloaded a data package manually) you may
find it easier to adjust the directory structure pointing to your data
package and load the metadata using \`DPchecker::load_metadata()\`. Much
like \`load_metadata\`, \`load_pkg_metadata\` requires that there be a
single .xml file in the data package directory, that the metadata file
name end in \*\_metadata.xml, and that the file contain schema-valid EML
metadata.

## Usage

``` r
load_pkg_metadata(reference_id, directory = "data")
```

## Arguments

- reference_id:

  is a 6-7 digit number corresponding to the reference ID of the data
  package on DataStore. Your data should be in a directory that that has
  the reference ID as its name.

- directory:

  String. Path to the data package directory, defaults to "data".

## Value

one data frame to the global environment.

## Examples

``` r
if (FALSE) { # \dontrun{
load_pkg_metadata(2266200)
} # }
```
