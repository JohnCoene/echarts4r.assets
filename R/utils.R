.build_asset <- function(x){
  paste0(x$path, x$name, ".", x$ext)
}

.get_file <- function(file, convert){
  file <- system.file(file, package = "echarts4r.assets")
  if(isTRUE(convert))
    ea_convert(file) -> file
  file
}

VALID_ASSETS <- c(
  "world",
  "composite_4k",
  "elevation_4k",
  "galaxy",
  "jupiter",
  "starfield",
  "world_night",
  "world_dark",
  "world_topo"
)
