# Get DS References for a park-species combination

`get_park_taxon_refs` returns a tibble of metadata for references in
Data Store corresponding to a particular taxon at a park. The resultant
data frame is then usable by other functions to extract metadata from
the records.

Because \`get_park_taxon_refs()\` accesses restricted data on the secure
DataStore server, results of these queries need to be considered for
potential park-specific data protection protocols.

Note that this function only returns references that have been "tagged"
with a taxon code and may represent only a subset of references that
have information about a taxon.

## Usage

``` r
get_park_taxon_refs(park_code, taxon_code)
```

## Arguments

- park_code:

  The four-letter unit code for the park of interest.

- taxon_code:

  The IRMA taxon code.

## Examples

``` r
if (FALSE) { # \dontrun{
get_park_taxon_refs("APIS", 126749)
} # }
```
