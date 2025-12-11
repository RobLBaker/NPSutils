# Check whether reference is a data package

The function tests whether a valid DataStore reference is a data package
or not. If it is a data package, the value "TRUE" is returned. If it is
not a data package, the value FALSE is returned. The default setting
assumes the user is logged on to the VPN (secure = TRUE), but this can
be set to secure = FALSE for non-NPS users. This is a relatively simple
helper function that will not test whether a reference exists and may
produce unexpected errors if the reference does not exist or is not
accessible. You are advised to run \`check_reference_exists()\` prior to
using this function.

## Usage

``` r
check_is_data_package(reference_id, secure = TRUE, dev = FALSE)
```

## Arguments

- reference_id:

  Integer. A 7-digit number indicating the datastore reference to be
  queried.

- secure:

  Logical. Defaults to TRUE, indicating that the user is logged on to
  the NPS VPN (or is accessing the resource from an NPS office). Can be
  set to FALSE for non-NPS users. If \`secure\` is set to FALSE, \`dev\`
  is automatically set to FALSE.

- dev:

  Logical. Defaults to FALSE, indicating that the user wishes to work
  with the production version of DataStore. Can be set to TRUE if the
  user wants to work with the development environment on DataStore.
  Setting dev = TRUE will only work if the user has the appropriate
  permissions. Requires secure = TRUE.

## Value

Logical.FALSE if the DataStore reference is not a data package. TRUE if
the DataStore reference is a data package.

## Examples

``` r
if (FALSE) { # \dontrun{
check_is_data_package(1234567)
check_is_data_package(1234567, secure = FALSE)
} # }
```
