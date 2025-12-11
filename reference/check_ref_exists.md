# Check whether a reference exists on DataStore

given a DataStore reference ID, the function will hit the DataStore API
to determine whether the reference exists. If it cannot contact
DataStore, it will stop with an error that states the connection failed.

## Usage

``` r
check_ref_exists(reference_id, secure = TRUE, dev = FALSE)
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

logical. TRUE means the reference exists, false means it does not exist.

## Examples

``` r
if (FALSE) { # \dontrun{
check_ref_exists(1234567)
check_ref_exists(1234567, secure = FALSE)
} # }
```
