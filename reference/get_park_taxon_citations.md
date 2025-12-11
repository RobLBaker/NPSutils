# Get DataStore Citations for a park-species combination

`get_park_taxon_citations` returns a vector of citations in Data Store
corresponding to a particular taxon at a park.

Because \`get_park_taxon_citations()\` accesses restricted data on the
secure DataStore server, results of these queries need to be considered
for potential park-specific data protection protocols.

Note that this function only returns citations that have been "tagged"
with a taxon code and may represent only a subset of references that
have information about a taxon.

## Usage

``` r
get_park_taxon_citations(park_code, taxon_code)
```

## Arguments

- park_code:

  The four-letter unit code for the park of interest.

- taxon_code:

  The IRMA taxon code.

## Value

a dataframe

## Examples

``` r
if (FALSE) { # \dontrun{
get_park_taxon_citations("APIS", 126749)
} # }
```
