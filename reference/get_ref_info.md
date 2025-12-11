# Get citation for Data Store holding info by reference ID

\`get_ref_info\` returns a character string or a vector with information
from one of the metadata fields in a Data Store reference's associated
xml file.

## Usage

``` r
get_ref_info(reference_id, field)
```

## Arguments

- reference_id:

  The six-seven digit reference ID number unique to the data store
  record.

- field:

  is one of the following: "Title" returns the title of the data store
  reference as a string value; "Abstract" returns the abstract as a
  string value; "Citation" returns the citation as a string value, and
  "Keywords" returns a vector containing all keywords as character
  values.

## Examples

``` r
if (FALSE) { # \dontrun{
get_ref_info(2266196, "Title")
} # }
```
