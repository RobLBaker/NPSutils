# Restricts get_unit_code to just National Parks

\`get_park_code\` is identical to \`get_unit_code\` except the output is
restricted to just National Parks (as opposed to including networks,
etc.). Accesses info from irmaservices.nps.gov. Search for park or park
unit with any string and return all applicable national park unitCodes.

## Usage

``` r
get_park_code(park)
```

## Arguments

- park:

  is a case-insensitive string containing some part of the unit's
  FullName, e.g "Yellow".

## Value

one data frame to the global environment. May contain multiple matches.

## Examples

``` r
if (FALSE) { # \dontrun{
get_park_code("Yellow")
} # }
```
