# Map WKT geometry (points and polygons)

\`map_wkt()\` takes a well-known text (WKT) geometry column and maps
points and polygons onto a gray leaflet map. All NA geometry is dropped
before mapping.

## Usage

``` r
map_wkt(
  df,
  wellknowntext = "footprintWKT",
  type = "all",
  remove.duplicates = TRUE
)
```

## Arguments

- df:

  \- The name of the data frame that contains WKT geometry.

- wellknowntext:

  \- The name of the specific column within the data frame that contains
  the WKT geometry. This parameter is currently not fully implemented
  and defaults to the Darwin Core 'footprintsWKT'.

- type:

  \- Pick one from "points", "polygons", or "all" to map specific
  geometry types.

- remove.duplicates:

  \- Boolean (TRUE or FALSE). Whether or not to remove identical
  geometries before plotting.

## Value

The function returns a dynamic, zoomable leaflet map with the specific
geometry plotted.

## Details

Define your dataframe, the column that contains WKT, and an option to
map specific geometry types.

## Examples

``` r
if (FALSE) { # \dontrun{
#map species observations
map_wkt(my_NPS_species_obs)

#map species observations - points only
map_wkt(my_NPS_species_obs, wellknowntext = "footprintWKT", type = "points")
} # }
```
