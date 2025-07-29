#' Shen Lab Custom ggplot2 Theme
#'
#' A simple custom ggplot2 theme based on \code{\link[ggplot2]{theme_bw}}
#' with minor grid lines removed and axis text sizes adjusted.
#'
#' @param base_size Numeric. Base font size for text elements (default = 12).
#'
#' @details
#' This theme builds on \code{\link[ggplot2]{theme_bw}} and customizes:
#' \itemize{
#'   \item Removes minor grid lines.
#'   \item Sets axis titles and axis text to \code{base_size}.
#' }
#'
#' @return A \code{\link[ggplot2]{theme}} object that can be added to ggplot2 plots.
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
#' p + theme_shenlab()
#'
#' @export
theme_shenlab <-
  function(base_size = 12) {
    ggplot2::theme_bw(base_size = base_size) +
      ggplot2::theme(
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = base_size),
        axis.text = element_text(size = base_size)
      )
  }
