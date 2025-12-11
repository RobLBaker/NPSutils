# Search irmaservices.nps using any piece of information.

\`get_unit_info\` accesses info from irmaservices.nps.gov and allows you
to search a Park Unit based on any number or combination of parameters.
Not all parameters need to be specified, but it is probably worth
specifying which parameters ARE specified, e.g.
get.unitInfo(LifeCycle="Inactive"). If the arguments are not specified,
they will default to the order supplied in the function.

## Usage

``` r
get_unit_info(
  code = NULL,
  park = NULL,
  life_cycle = NULL,
  network_code = NULL,
  net_name = NULL,
  region_abb = NULL,
  region = NULL,
  state = NULL
)
```

## Arguments

- code:

  defaults to NULL. Is a case-insensitive string. It typically is 4
  letters long and typically does not include numbers but may be longer,
  shorter, or include special characters such as "-".

- park:

  defaults to NULL. Is a case-insensitive string. It will search for any
  subset of the FullName or parks or park units

- life_cycle:

  is a case-insensitive string that will filter search results based on
  LifeCycle status. Currently acceptable values are: \* "Active",
  "Inactive" or "Pending"

- network_code:

  defaults to NULL. Is a case-insensitive string for the network code
  (or some subset of it). Note: not all park units have Network
  designations.

- net_name:

  defaults to NULL. Is a case-insensitive string containing of the
  network name (or some subset of it). Note not all park units are
  associated with networks.

- region_abb:

  defaults to NULL. Is a case-insensitive string containing the region
  abbreviation (or some subset of it), e.g.IMR for Intermountain Region.
  Not all park units are associated with a region.

- region:

  defaults to NULL. Is a case-insensitive string of the region name (or
  some subset of it). Not all park units are associated with a region.

- state:

  defaults to NULL. Is a case-insensitive search of the park unit's
  state. States are indicated using 2-letter abbreviations. Park units
  may span multiple states. Not all parks have state designations.

## Value

one data frame to the global environment. May contain multiple matches.
Sufficient detail should be provided to determine the intended Park
Unit's name.

## Examples

``` r
if (FALSE) { # \dontrun{
get_unit_info(state = "CO")
} # }
```
