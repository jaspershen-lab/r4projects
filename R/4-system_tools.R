## -----------------------------------------------------------------------
#' @title get_os
#' @description get os information.
#' @author Xiaotao Shen
#' \email{shenxt1990@@outlook.com}
#' @export
#' @return os name
#' @examples
#' get_os()
get_os <- function() {
  sysinf <- Sys.info()
  if (!is.null(sysinf)) {
    os <- sysinf["sysname"]
    if (os == "Darwin") {
      os <- "osx"
    }
  } else {
    ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os)) {
      os <- "osx"
    }
    if (grepl("linux-gnu", R.version$os)) {
      os <- "linux"
    }
  }
  tolower(os)
}


## -----------------------------------------------------------------------
#' @title create_project_organization
#' @description Create project organization.
#' @author Xiaotao Shen
#' \email{shenxt1990@@outlook.com}
#' @export
#' @return some folders
create_project_organization <-
  function() {
    current_wd <-
      getwd()
    ####code
    dir.create(file.path(current_wd, "1_code"),
               showWarnings = FALSE,
               recursive = TRUE)

    if (!file.exists(file.path(current_wd, "1_code/100_tools.R"))) {
      file.create(file.path(current_wd, "1_code/100_tools.R"),
                  showWarnings = FALSE)
      writeLines(
        "library(tidyverse)\nlibrary(ggplot2)",
        file.path(current_wd, "1_code/100_tools.R")
      )
    } else {
      warning("'1_code/100_tools.R' already exists. Not overwriting.\n")
    }

    file.create(file.path(current_wd, "1_code/101_demo_code.R"),
                showWarnings = FALSE)

    writeLines(
      "library(r4projects)\nsetwd(get_project_wd())\nrm(list = ls())\nsource('1_code/100_tools.R')",
      file.path(current_wd, "1_code/101_demo_code.R")
    )

    #####data
    dir.create(file.path(current_wd, "2_data"),
               showWarnings = FALSE,
               recursive = TRUE)

    ###data_analysis
    dir.create(
      file.path(current_wd, "3_data_analysis"),
      showWarnings = FALSE,
      recursive = TRUE
    )

    ###manuscript
    dir.create(
      file.path(current_wd, "4_manuscript"),
      showWarnings = FALSE,
      recursive = TRUE
    )

    dir.create(
      file.path(current_wd, "4_manuscript/Figures"),
      showWarnings = FALSE,
      recursive = TRUE
    )

    dir.create(
      file.path(current_wd, "4_manuscript/Supplementary_data"),
      showWarnings = FALSE,
      recursive = TRUE
    )

    dir.create(
      file.path(current_wd, "4_manuscript/Supplementary_figures"),
      showWarnings = FALSE,
      recursive = TRUE
    )

    ###summary
    dir.create(
      file.path(current_wd, "5_summary"),
      showWarnings = FALSE,
      recursive = TRUE
    )

    download.file(url = "https://jaspershen.github.io/file/demo_summary.pptx",
                  destfile = file.path(current_wd, "5_summary/demo_summary.pptx"))

  }
