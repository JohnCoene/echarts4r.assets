
db <- tibble::tribble(
  ~ name,              ~ext,    ~path,
  "clouds_trans",      "png",   "assets/",
  "clouds",            "jpg",   "assets/",
  "world_bw",          "jpg",   "assets/",
  "world_bump",        "jpg",   "assets/",
  "composite_4k",      "jpg",   "assets/",
  "elevation_4k",      "jpg",   "assets/",
  "galaxy",            "jpg",   "assets/",
  "jupiter",           "jpg",   "assets/",
  "starfield",         "jpg",   "assets/",
  "world",             "jpg",   "assets/",
  "world_dark",        "jpg",   "assets/",
  "world_night",       "jpg",   "assets/",
  "world_topo",        "jpg",   "assets/",
  "canyon",            "hdr",   "assets/hdr/",
  "lake",              "hdr",   "assets/hdr/",
  "pisa",              "hdr",   "assets/hdr/",
  "leather_albedo",    "jpg",   "assets/leather/",
  "leather_height",    "jpg",   "assets/leather/",
  "leather_normal",    "jpg",   "assets/leather/",
  "leather_roughness", "jpg",   "assets/leather/",
  "hatch0",            "jpg",   "assets/tam/",
  "hatch1",            "jpg",   "assets/tam/",
  "hatch2",            "jpg",   "assets/tam/",
  "hatch3",            "jpg",   "assets/tam/",
  "hatch4",            "jpg",   "assets/tam/",
  "hatch5",            "jpg",   "assets/tam/"
)

devtools::use_data(db, internal = TRUE, overwrite = TRUE)
