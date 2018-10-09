globalVariables("name")

#' Valid Assets
#'
#' Returns list of valid assets
#'
#' @examples
#' ea_bank()
#'
#' @export
ea_bank <- function(){
  x <- dplyr::mutate(db, name = gsub("_", " ", name))
  dplyr::pull(x, "name")
}

#' Assets
#'
#' Assets for the \href{http://echarts4r.john-coene.com}{echarts4r} package.
#'
#' @param file Path to file.
#' @param dir Directory to copy asset to.
#' @param asset Name of texture, see details below.
#' @param convert Converts image to JSON formatted arrays.
#'
#' @section Functions:
#' \itemize{
#'   \item{\code{ea_asset} include asset.}
#'   \item{\code{ea_convert} convert file to JSON formatted array.}
#'   \item{\code{ea_copy} moves an asset to the folder of your choice. This is useful as \code{convert = TRUE} argment is computationally expensive, for instance, in Shiny, move the asset to your www folder for better perfromances.}
#'   \item{\code{ea_source} source your copied asset.}
#' }
#'
#' @details
#' Due to browser
#' "same origin policy" security restrictions, loading textures
#' from a file system may lead to a security exception,
#' see
#' \url{https://github.com/mrdoob/three.js/wiki/How-to-run-things-locally}.
#' References to file locations work in Shiny apps, but not in stand-alone
#' examples. The \code{*texture} functions facilitates transfer of image
#' texture data from R into textures when \code{convert} is set to \code{TRUE}.
#'
#' Valid run \code{\link{ea_bank}} \code{asset}.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#' library(echarts4r)
#'
#' # copy asset to www folder
#' ea_copy("world")
#'
#' ui <- fluidPage(
#'   echarts4rOutput("globe")
#' )
#'
#' server <- function(input, output){
#'
#'   output$globe <- renderEcharts4r({
#'
#'     e_charts() %>%
#'       e_globe(
#'         environment = ea_source("earth"),
#'         base.texture = e_globe_texture()
#'       )
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @rdname textures
#' @export
ea_asset <- function(asset, convert = TRUE){

  if(missing(asset))
    stop("missing asset", call. = FALSE)

  asset <- gsub(" ", "_", tolower(asset))

  asset <- dplyr::filter(db, name == asset)

  if(nrow(asset) == 0)
    stop("invalid asset name, see ea_bank()", call. = FALSE)

  asset <- .build_asset(asset)

  .get_file(asset, convert)
}

#' @rdname textures
#' @export
ea_convert <- function(file){
  if(missing(file))
    stop("missing file", call. = FALSE)
  paste0("data:image/png;base64,", base64enc::base64encode(file))
}

#' @rdname textures
#' @export
ea_copy <- function(asset, dir = "www"){

  if(missing(asset))
    stop("missing asset", call. = FALSE)

  if(!dir.exists(dir)){
    ANSWER <- readline(
      paste0(
        "Directory ", dir, " does not exist, would you like to create it?"
      )
    )

    ANSWER <- substr(ANSWER, 1, 1)

    if(ANSWER == "y" || ANSWER == 1)
      dir.create(dir)
    else
      stop("Directory does not exist", call. = FALSE)
  }

  ASSET <- paste0("assets/", asset, ".jpg")

  files <- list.files(dir)

  if(!ASSET %in% files)
    file.copy(.get_file(ASSET, FALSE), dir)
  else
    message("asset already present in directory, not copying.\n")

  message(
    "File successfully copied!"
  )
}

#' @rdname textures
#' @export
ea_source <- function(asset, dir = "www"){
  paste0(dir, "/", asset, ".jpg")
}
