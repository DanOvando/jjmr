#' ggplot2 theme for jjmR
#'
#' @param ...
#'
#' @return a ggplot2 theme object
#' @export
#' @importFrom ggplot2 %+replace%
#' 
#' @examples  
#' 
#' ggplot(mtcars, aes(mpg)) + geom_histogram() + jjmr::theme_jjm()
#' 
theme_jjm <- function(base_size = 14,...) {
  ggplot2::theme_minimal(...) %+replace%
    ggplot2::theme(
      # background
      panel.background = ggplot2::element_blank(),
      # borders and axis lines
      panel.border = ggplot2::element_rect(size = 1, fill = "NA"),
      axis.line = ggplot2::element_blank(),
      # gridlines
      panel.grid.major = ggplot2::element_line(
        size = 0.1,
        linetype = 2,
        colour = "lightgray"
      ),
      panel.grid.minor = ggplot2::element_line(
        size = 0.1,
        linetype = 2,
        colour = "lightgray"
      ),
      # title
      plot.title = ggplot2::element_text(
        face = "bold.italic",
        size = 14,
        margin = ggplot2::margin(t = 5, b = 5),
        vjust = 0.5,
        hjust = 0
      ),
      plot.title.position = "panel",
      # strips for faceted plots
      strip.background = ggplot2::element_rect(fill = "#2F385C"),
      strip.text = ggplot2::element_text(
        colour = "white",
        face = "italic",
        margin = ggplot2::margin(t = 2, b = 2),
        vjust = 0.5
      ),
      # legends
      legend.title = ggplot2::element_text(face = "italic", hjust = 0.5),
      #text
      axis.title = ggplot2::element_text(size = base_size),
      axis.text = ggplot2::element_text(size = 0.75 * base_size)
    )
}