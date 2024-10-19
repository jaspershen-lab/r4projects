#' @title install_fastgit
#' @description install packages from fastgit. Credit to Shixiang Wang
#' @author Xiaotao Shen
#' \email{shenxt1990@@outlook.com}
#' @param pkg pkg name from github, gitlab or gitee, "name/repo" format
#' @param from gitlab, github or gitee.
#' @param ... Other parameters for install_git
#' @importFrom remotes install_git
#' @return NULL
#' @export

install_fastgit <-
  function(pkg,
           from = c("gitee", "gitlab", "github"),
           ...) {
    from <- match.arg(from)

    if (from == "gitee") {
      if (!grepl("/", pkg)) {
        stop("Invalid package name, should in 'name/repo' format.")
      }
      remotes::install_git(paste0("https://gitee.com/", pkg), ...)
    } else {
      if (any(grepl(":", pkg))) {
        remotes::install_git(pkg, ...)
      } else {
        if (any(grepl("/", pkg))) {
          tryCatch(
            remotes::install_git(paste0("https://hub.fastgit.org/", pkg)),
            error = function(e) {
              message("Install error when use GitHub mirror, roll back to official GitHub.")
              remotes::install_github(pkg)
            }
          )
        }
      }
    }
  }



#' Ignore Large Files in a Project
#'
#' This function identifies large files in a given directory and appends them to the `.gitignore` file.
#'
#' @param path Character. The path to the directory to search for large files. Defaults to the current directory (`"."`).
#' @param size_limit Numeric. The size limit in megabytes (MB) above which files will be ignored. Defaults to 10 MB.
#'
#' @details The function searches for files in the specified directory and its subdirectories, calculates their sizes, and adds files larger than `size_limit` to the `.gitignore` file. It ensures that the function is run from the project root directory by comparing the current working directory with the project root.
#'
#' @return None. The function is used for its side effects of modifying the `.gitignore` file and printing messages to the console.
#'
#'
#' @examples
#' \dontrun{
#' # Ignore all files larger than 10 MB in the current directory
#' ignore_large_files(path = ".", size_limit = 10)
#'
#' # Ignore all files larger than 5 MB in the "data" directory
#' ignore_large_files(path = "data", size_limit = 5)
#' }
#'
#'
#' @export
ignore_large_files <-
  function(path = ".", size_limit = 10) {
    project_path <- get_project_wd()
    current_path <- getwd()
    if(current_path != project_path){
      stop("Please run this function from the project root directory")
    }
    # List all files in the folder recursively
    all_files <-
      list.files(path, recursive = TRUE, full.names = TRUE)

    all_files <- normalizePath(all_files)

    # Initialize a vector to store large files
    large_files <- c()

    # Loop through each file to check its size
    for (file in all_files) {
      file_size_MB <-
        file.info(file)$size / (1024 * 1024)  # Convert size to MB
      if (file_size_MB > size_limit) {
        large_files <- c(large_files, file)
      }
    }

    # If there are large files, append them to .gitignore
    if (length(large_files) > 0) {
      # Make the paths relative to the folder where .gitignore is located
      large_files_relative <-
        gsub(paste0(project_path, "/"), "", large_files)

      # Open .gitignore file for appending
      con <- file(".gitignore", "a")

      # Write each large file path to .gitignore
      for (file in large_files_relative) {
        writeLines(paste0(file), con)
      }

      # Close the connection
      close(con)

      message(paste0("Added ", length(large_files), " large files to .gitignore"))
    } else {
      message("No large files found.")
    }
  }
