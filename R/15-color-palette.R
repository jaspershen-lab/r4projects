#' Generate Color Palettes
#'
#' `color_palette()` returns curated palettes for data visualization.
#' It supports both the legacy numeric interface and a newer named interface
#' for journal- and media-inspired palettes.
#'
#' @param palette Character. Name of the palette to return. Supported values are
#'   `"nature"`, `"science"`, `"cell"`, `"economist"`, `"bbc"`,
#'   `"nytimes"`, and `"legacy5"`.
#' @param palette_number Integer. Legacy interface. Currently only `5` is
#'   supported and returns the original list of five-color palettes.
#' @param show_all Logical. If `TRUE`, return all available palettes as a named
#'   list.
#'
#' @details
#' The named palettes are intended for practical plotting rather than strict
#' brand replication.
#'
#' \itemize{
#'   \item `"nature"` is based on the well-known Nature Publishing Group style
#'   palette commonly used in scientific figures.
#'   \item `"science"` is based on the widely used AAAS/Science style palette.
#'   \item `"cell"`, `"economist"`, `"bbc"`, and `"nytimes"` are editorial or
#'   publication-inspired palettes curated for clear categorical contrast.
#'   \item `palette_number = 5` preserves the original package behavior.
#' }
#'
#' @return
#' If `palette` is provided, a character vector of hex colors.
#'
#' If `show_all = TRUE`, a named list of all palettes.
#'
#' If `palette_number = 5`, the original list of five-color palettes.
#'
#' @examples
#' # New named interface
#' color_palette("nature")
#' color_palette("economist")
#'
#' # Return all named palettes
#' names(color_palette(show_all = TRUE))
#'
#' # Legacy interface
#' legacy_palettes <- color_palette(palette_number = 5)
#' legacy_palettes[[1]]
#'
#' # Boxplot with a Nature-style palette
#' library(ggplot2)
#' pal <- color_palette("nature")
#' ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'   geom_boxplot() +
#'   scale_fill_manual(values = pal[1:3]) +
#'   labs(
#'     title = "Nature-style palette",
#'     x = "Cylinders",
#'     y = "Miles per gallon",
#'     fill = "Cylinders"
#'   ) +
#'   theme_shenlab()
#'
#' # Scatter plot with an Economist-inspired palette
#' pal <- color_palette("economist")
#' ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
#'   geom_point(size = 3, alpha = 0.9) +
#'   scale_color_manual(values = pal[1:3]) +
#'   labs(
#'     title = "Economist-inspired palette",
#'     x = "Miles per gallon",
#'     y = "Weight",
#'     color = "Cylinders"
#'   ) +
#'   theme_shenlab()
#'
#' # Palette preview
#' palettes <- color_palette(show_all = TRUE)
#' pal <- palettes$bbc
#' df <- data.frame(
#'   x = seq_along(pal),
#'   y = 1,
#'   fill = pal
#' )
#' ggplot(df, aes(x, y, fill = fill)) +
#'   geom_tile() +
#'   scale_fill_identity() +
#'   scale_x_continuous(breaks = df$x, labels = pal) +
#'   labs(
#'     title = "BBC-inspired palette preview",
#'     x = NULL,
#'     y = NULL
#'   ) +
#'   theme_shenlab() +
#'   theme(
#'     axis.text.y = element_blank(),
#'     axis.ticks = element_blank()
#'   )
#'
#' @export
color_palette <-
  function(palette = NULL,
           palette_number = NULL,
           show_all = FALSE) {
    legacy5 <-
      list(
        c("#2C3E50", "#E74C3C", "#ECF0F1", "#3498DB", "#2980B9"),
        c("#E67E22", "#F1C40F", "#F3FFE2", "#ACF0F2", "#1695A3", "#225378"),
        c("#002F2F", "#046380", "#EFECCA", "#A7A37E", "#E6E2AF"),
        c("#E28B00", "#B64926", "#FFB03B", "#FFD34E", "#468966"),
        c("#FF6138", "#FFFF9D", "#BEEB9F", "#79BD8F", "#00A388"),
        c("#D9ECF2", "#F56A79", "#FF414D", "#1AA687", "#002D40"),
        c("#5AA7A7", "#96D7C6", "#8AC94A", "#E2D368", "#6C8CBF"),
        c("#147C72", "#299D90", "#30C3B1", "#8FE4DC", "#B4F0E8"),
        c("#ED4557", "#B8010B", "#D9569E", "#381B2A", "#FCBC53"),
        c("#93C6BD", "#C1E1DA", "#DBE1EA", "#F2C29F", "#E9A475"),
        c("#86CBCD", "#A8DFE0", "#F9E2AE", "#FBC78D", "#A6D676"),
        c("#8969A5", "#C48ADE", "#B1BEEA", "#8FC4E9", "#8095CF"),
        c("#FD465D", "#FEB396", "#FECCBF", "#AED4D5", "#F8CC88"),
        c("#86E3CE", "#D0E6A5", "#FFDD95", "#FD9385", "#CCABDA"),
        c("#348899", "#F2EBC7", "#979C9C", "#343642", "#FE8B54"),
        c("#F95759", "#FDA099", "#FFFFFF", "#D9F3CB", "#8AC2B0"),
        c("#0A3D64", "#DDB0A7", "#EAAD5A", "#A8B293", "#DF8053"),
        c("#DC3971", "#EC719F", "#F3B3CC", "#ABE5E8", "#34ADAE"),
        c("#FEA88C", "#FFA3A6", "#F583B3", "#CD69A7", "#ED7179"),
        c("#FCF5EF", "#FEA735", "#FE7235", "#00C3FF", "#0077FF"),
        c("#2B3A42", "#95AB63", "#BDD684", "#E2F0D6", "#F6FFE0"),
        c("#E7C54F", "#E5663F", "#C7323F", "#67493A", "#009DAE"),
        c("#264D59", "#43978D", "#F9E07F", "#F9AD6A", "#D46C4E"),
        c("#FCB4C5", "#FB7A8F", "#AAB6FD", "#6096FC", "#112B8C"),
        c("#CAD4BD", "#ACC352", "#8ED4C5", "#FFF16F", "#FFA68D"),
        c("#8F797E", "#FFC2B5", "#FFE3CC", "#646C8F", "#DCC3A1")
      )

    named_palettes <-
      list(
        nature = c("#E64B35", "#4DBBD5", "#00A087", "#3C5488", "#F39B7F", "#8491B4"),
        science = c("#3B4992", "#EE0000", "#008B45", "#631879", "#008280", "#BB0021"),
        cell = c("#005587", "#1F78B4", "#4DB6E2", "#00A087", "#F4A259", "#D1495B"),
        economist = c("#E3120B", "#006BA2", "#3EBCD2", "#379A8B", "#EAC435", "#8E6C8A"),
        bbc = c("#B80000", "#0051AD", "#00843D", "#FFB300", "#2E2E2E", "#8C8C8C"),
        nytimes = c("#1A1A1A", "#666666", "#B3B3B3", "#D9D9D9", "#567B95", "#C59D5F"),
        legacy5 = unlist(legacy5[1], use.names = FALSE)
      )

    if (isTRUE(show_all)) {
      return(named_palettes)
    }

    if (!is.null(palette_number) && is.null(palette)) {
      if (!identical(palette_number, 5L) && !identical(palette_number, 5)) {
        stop("Legacy palette_number only supports 5. Use palette = \"nature\" or another named palette instead.")
      }
      return(legacy5)
    }

    if (is.null(palette)) {
      stop("Please provide palette = \"nature\" (or another named palette), or use palette_number = 5 for the legacy interface.")
    }

    palette <- match.arg(
      palette,
      choices = names(named_palettes)
    )

    named_palettes[[palette]]
  }
