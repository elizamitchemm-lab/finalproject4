# run this once to install required packages

pkgs <- c("rmarkdown", "knitr", "dplyr", "ggplot2",
          "readr", "here", "scales", "kableExtra")

for (pkg in pkgs) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org")
  }
}
