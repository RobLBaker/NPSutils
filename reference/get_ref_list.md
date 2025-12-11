# Get a list of reference codes from DataStore

\`get_ref_list\` will return a list of the DataStore reference codes
associated with a given reference type. Where "All" might be a bit
generous: I would not expect more than the number given by
"no_of_entries" as that is technically the number of entries per page
and the function defaults to returning just one page (not entirely sure
what a "page" is in this context).

## Usage

``` r
get_ref_list(
  reference_type = "dataPackage",
  no_of_entries = 500,
  secure = FALSE
)
```

## Arguments

- reference_type:

  String. The reference type to to query data store for. Defaults to
  data package ("dataPackage").

- no_of_entries:

  Integer. The number of entries to return per page (where only one
  "page" of results is returned by default). Defaults to 500.

- secure:

  Logical. Defaults to FALSE for external users. Setting secure = TRUE
  will, with the proper credentials, return DataStore references with
  visibility set to both Public and Restricted.

## Value

A List of reference IDs

## Examples

``` r
if (FALSE) { # \dontrun{
get_ref_list()
} # }
```
