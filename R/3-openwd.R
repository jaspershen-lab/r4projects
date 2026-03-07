#' @title openwd
#' @description Open current work directory.
#' @author Xiaotao Shen
#' \email{xiaotao.shen@outlook.com}
#' @return inder.
#' @export
#' @examples
#' \dontrun{
#' openwd()
#' }
openwd <- function() {
  system(sprintf("open %s", shQuote(getwd())))
}
