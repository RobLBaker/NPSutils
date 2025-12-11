# Get URL for references for a park-species combination

`get_park_taxon_url` returns a vector of URLs for references in Data
Store corresponding to a particular taxon at a park.

## Usage

``` r
get_park_taxon_url(park_code, taxon_code)
```

## Arguments

- park_code:

  The four-letter unit code for the park of interest.

- taxon_code:

  The IRMA taxon code.

## Details

Note that this function only returns URLs for references that have been
"tagged" with a taxon code and may represent only a subset of references
that have information about a taxon.

## Examples

``` r
if (FALSE) { # \dontrun{
get_park_taxon_url("APIS", 126749)
} # }
```
