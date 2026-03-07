# r4projects

`r4projects` is an R package for organizing bioinformatics projects and handling common research-support tasks around publication tracking, profile scraping, package metadata lookup, and lightweight visualization.

The package is designed for day-to-day academic workflows rather than for a single analysis pipeline. It combines project scaffolding utilities with helper functions that pull information from Google Scholar, PubMed, GitHub, GitLab, and Gitee.

## Installation

Install the released source from GitHub:

```r
remotes::install_github("jaspershen-lab/r4projects")
```

Load the package:

```r
library(r4projects)
```

## What the package does

`r4projects` currently covers five practical areas.

### 1. Project organization

The package can create a standard directory layout for an R-based bioinformatics project.

```r
create_project_organization()
get_project_wd()
openwd()
ignore_large_files()
```

Typical folders created by `create_project_organization()` include:

- `1_code`
- `2_data`
- `3_data_analysis`
- `4_manuscript`
- `5_summary`

This is useful when you want a repeatable project structure for exploratory analysis, manuscript preparation, and summary reporting.

### 2. Google Scholar helpers

The package can cache and parse Google Scholar pages to retrieve profile and publication information.

```r
profile <- request_profile(user_id = "3TK9yz8AAAAJ")
citations <- request_citation(user_id = "3TK9yz8AAAAJ")
pubs <- request_publications(user_id = "3TK9yz8AAAAJ")
paper <- request_publication_info(
  user_id = "3TK9yz8AAAAJ",
  pub_id = "0EnyYjriUFMC"
)
```

Related functions:

- `craw_or_load_page()`
- `craw_or_load_publication()`
- `request_profile()`
- `request_citation()`
- `draw_citation_history()`
- `request_coauthors()`
- `request_publications()`
- `request_publication_info()`

### 3. PubMed helpers

The package includes helpers for linking Google Scholar entries to PubMed and extracting PubMed metadata.

```r
pmid <- convert_gs_pub_id2pmid(
  gs_user_id = "3TK9yz8AAAAJ",
  gs_pub_id = "0EnyYjriUFMC"
)

pubmed_info <- request_pubmed_publication_info(pmid = pmid)
```

These functions are useful when you want to recover author affiliations, identifiers, abstracts, or other structured paper metadata.

### 4. GitHub and package metadata helpers

The package can collect simple GitHub profile information and package metadata from repository hosting platforms.

```r
gh_profile <- require_github_profile("jaspershen")
gh_activity <- require_github_contribution_activity("jaspershen")
pkg_info <- require_package_info("jaspershen/laggedcor", from = "github")
```

There is also a convenience installer for packages hosted on GitHub, GitLab, or Gitee:

```r
install_fastgit("jaspershen/laggedcor", from = "github")
```

### 5. Visualization and academic website support

The package includes plotting helpers and functions used in personal or lab website workflows.

```r
draw_citation_history(user_id = "3TK9yz8AAAAJ")
generate_collaborator_map(gs_user_id = "3TK9yz8AAAAJ")
```

Additional helpers include:

- `color_palette()`
- `theme_shenlab()`
- `update_packages_tidymass_org()`

## Example workflow

A minimal workflow for a new analysis project might look like this:

```r
library(r4projects)

create_project_organization()
setwd(get_project_wd())

pubs <- request_publications(user_id = "3TK9yz8AAAAJ")
plot <- draw_citation_history(user_id = "3TK9yz8AAAAJ")
```

## Exported functions

Main exported functions in the package:

- `color_palette()`
- `convert_gs_pub_id2pmid()`
- `craw_or_load_page()`
- `craw_or_load_publication()`
- `create_project_organization()`
- `draw_citation_history()`
- `fuzzy_match()`
- `generate_collaborator_map()`
- `get_os()`
- `get_project_wd()`
- `ignore_large_files()`
- `install_fastgit()`
- `openwd()`
- `r4projects_logo()`
- `r4projects_packages()`
- `request_citation()`
- `request_coauthors()`
- `request_profile()`
- `request_publication_info()`
- `request_publications()`
- `request_pubmed_publication_info()`
- `require_github_contribution_activity()`
- `require_github_profile()`
- `require_package_info()`
- `show_progresser()`
- `theme_shenlab()`
- `update_packages_tidymass_org()`

## Notes

- Several functions rely on live web pages and may break if upstream page structures change.
- Google Scholar scraping should be used conservatively because aggressive requests may be throttled.
- Some functions are tailored to the author's existing workflow and may be most useful as lightweight utilities rather than general APIs.

## Documentation website

The pkgdown site for the package is intended to be published at:

[https://jaspershen-lab.github.io/r4projects/](https://jaspershen-lab.github.io/r4projects/)

To rebuild the site locally:

```r
pkgdown::build_site()
```

## Author

Xiaotao Shen  
Email: [xiaotao.shen@outlook.com](mailto:xiaotao.shen@outlook.com)
