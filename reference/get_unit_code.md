# Dynamically access NPS park unit code data

Accesses info from irmaservices.nps.gov. Search for park or park unit
with any string and return all applicable UnitCodes.

## Usage

``` r
get_unit_code(unit)
```

## Arguments

- unit:

  is a case-insensitive string containing some part of the unit's
  FullName.

## Value

one data frame to the global environment. May contain multiple matches.

## Details

Contains multiple somewhat redundant functions for searching park units
including unit codes, names, states, regions, networks, regions, etc.
These functions can be handy if you need to supply the unit code when
downloading data but only know the park name, if you have a unit code
but don't know what park, region, etc it refers to, or if you want to
know all the parks that are within a given network, region, or state
(note: it will actually supply all park units, not just National Parks).
Regions do NOT use the region numbering system because the underlying
data this code draws on from irma does not include the region numbers.

## Examples

``` r
if (FALSE) { # \dontrun{
get_unit_code("Rocky")
} # }
```
