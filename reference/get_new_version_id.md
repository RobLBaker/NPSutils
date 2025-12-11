# Get newest DataStore reference version

If a DataStore reference has been versioned, \`get_new_version_id()\`
will return the DataStore reference ID for the newest version. If the
reference has not been versioned, the function returns NULL.

## Usage

``` r
get_new_version_id(reference_id, secure = TRUE, dev = FALSE)
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

Integer. A 7-digit integer corresponding to the DataStore reference ID
for the newest version of the supplied DataStore reference. If the
supplied reference has not been versioned, NULL is returned.

## Examples

``` r
if (FALSE) { # \dontrun{
get_new_version_id(1234567)
get_new_version_id(1234567, secure = FALSE)
} # }
```
