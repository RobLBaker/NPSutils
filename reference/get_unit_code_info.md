# Gets information about a park Unit Code

\`get_unit_code_info\` accesses info from irmaservices.nps.gov and
allows you to search a Park Unit Code and determine which park, network,
or other entity it is associated with along with ancillary information.

## Usage

``` r
get_unit_code_info(code)
```

## Arguments

- code:

  is a case-insensitive string. It typically is 4 letters long and
  typically does not include numbers but may be longer, shorter, or
  include special characters such as "-", e.g. "SFCN".

## Value

one data frame to the global environment. May contain multiple matches.
Sufficient detail should be provided to determine the intended Park
Unit's name. Data frame includes UnitCode, FullName, UnitLifeCycle,
Network, Region, and StateCodes.

## Examples

``` r
if (FALSE) { # \dontrun{
get_unit_code_info("SFCN")
} # }
```
