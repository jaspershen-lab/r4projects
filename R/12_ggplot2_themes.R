#' Shen Lab Custom ggplot2 Theme
#'
#' A more polished ggplot2 theme built on \code{\link[ggplot2]{theme_bw}}.
#' It keeps the clean white background of \code{theme_bw()} while adding
#' stronger hierarchy for titles, axes, legends, facet strips, and panel
#' spacing.
#'
#' @param base_size Numeric. Base font size for text elements.
#' @param base_family Character. Base font family passed to \code{theme_bw()}.
#' @param accent Character. Accent color used for titles and strip styling.
#'
#' @details
#' This theme builds on \code{\link[ggplot2]{theme_bw}} and customizes:
#' \itemize{
#'   \item plot title, subtitle, caption, and tag styling;
#'   \item axis text, axis ticks, and axis title emphasis;
#'   \item major grid lines while removing minor grid lines;
#'   \item legend placement and legend key cleanup;
#'   \item facet strip backgrounds and text hierarchy;
#'   \item panel borders, plot margins, and spacing.
#' }
#'
#' @return A \code{\link[ggplot2]{theme}} object that can be added to ggplot2 plots.
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
#'   geom_point(size = 3, alpha = 0.9) +
#'   labs(
#'     title = "Example scatter plot",
#'     subtitle = "theme_shenlab() on top of theme_bw()",
#'     x = "Miles per gallon",
#'     y = "Weight",
#'     color = "Cylinders"
#'   )
#' p + theme_shenlab()
#'
#' @export
theme_shenlab <-
  function(base_size = 12,
           base_family = "",
           accent = "#1F4E79") {
    ggplot2::theme_bw(base_size = base_size, base_family = base_family) +
      ggplot2::theme(
        line = ggplot2::element_line(
          colour = "#3A3A3A",
          linewidth = 0.4,
          lineend = "round"
        ),
        rect = ggplot2::element_rect(
          fill = "white",
          colour = NA
        ),
        text = ggplot2::element_text(
          colour = "#222222"
        ),
        plot.title = ggplot2::element_text(
          size = base_size * 1.3,
          face = "bold",
          colour = accent,
          hjust = 0,
          margin = ggplot2::margin(b = 6)
        ),
        plot.subtitle = ggplot2::element_text(
          size = base_size * 1.02,
          colour = "#4F5B66",
          hjust = 0,
          margin = ggplot2::margin(b = 10)
        ),
        plot.caption = ggplot2::element_text(
          size = base_size * 0.82,
          colour = "#6B7280",
          hjust = 1,
          margin = ggplot2::margin(t = 10)
        ),
        plot.tag = ggplot2::element_text(
          size = base_size * 1.15,
          face = "bold",
          colour = accent
        ),
        axis.title = ggplot2::element_text(
          size = base_size,
          face = "bold",
          colour = "#222222"
        ),
        axis.text = ggplot2::element_text(
          size = base_size * 0.9,
          colour = "#3F3F46"
        ),
        axis.ticks = ggplot2::element_line(
          colour = "#4B5563",
          linewidth = 0.4
        ),
        axis.ticks.length = grid::unit(2.2, "mm"),
        panel.grid.minor = ggplot2::element_blank(),
        panel.grid.major.x = ggplot2::element_line(
          colour = "#E5E7EB",
          linewidth = 0.35
        ),
        panel.grid.major.y = ggplot2::element_line(
          colour = "#D1D5DB",
          linewidth = 0.4
        ),
        panel.border = ggplot2::element_rect(
          colour = "#4B5563",
          linewidth = 0.8,
          fill = NA
        ),
        panel.background = ggplot2::element_rect(
          fill = "white",
          colour = NA
        ),
        strip.background = ggplot2::element_rect(
          fill = "#EEF3F8",
          colour = accent,
          linewidth = 0.7
        ),
        strip.text = ggplot2::element_text(
          size = base_size * 0.9,
          face = "bold",
          colour = accent,
          margin = ggplot2::margin(4, 6, 4, 6)
        ),
        legend.background = ggplot2::element_blank(),
        legend.key = ggplot2::element_rect(
          fill = "white",
          colour = NA
        ),
        legend.title = ggplot2::element_text(
          size = base_size * 0.92,
          face = "bold"
        ),
        legend.text = ggplot2::element_text(
          size = base_size * 0.85
        ),
        legend.spacing.y = grid::unit(2, "mm"),
        plot.margin = ggplot2::margin(12, 14, 12, 12),
        complete = FALSE
      )
  }
