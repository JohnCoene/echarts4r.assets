globalVariables(c("name", "path"))

#' Icons.
#'
#' This is a dataset 77 SVG icons.
#'
#' @format A data frame with 77 rows and 2 variables:
#' \describe{
#'   \item{path}{SVG path of icons}
#'   \item{name}{Name of icon}
#' }
#'
#' @name icons
#' @docType data
#' @source \url{https://dribbble.com/shots/1934932-77-Essential-Icons-Free-Download}
#' @keywords data
NULL

#' Icon
#'
#' Get an icon from the database of \link{icons}.
#'
#' @param names The name or vector of names of the icon(s) as listed in \link{icons}.
#'
#' @examples ea_icon("bar_graph")
#'
#' @rdname icons-func
#' @export
ea_icons <- function(names){

  does_exist <- !names %in% unique(icons$name)

  if(sum(does_exist) > 0)
    stop("wrong names passed.", call. = FALSE)

  icons %>%
    dplyr::filter(name %in% names) %>%
    dplyr::pull(path) %>%
    paste0("path://", .)
}

#' @rdname icons-func
#' @export
ea_icons_search <- function(names){
  nms <- paste0(names, collapse = "|")
  icons$name[grepl(nms, icons$name)]
}
