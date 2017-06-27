files <- list.files(".", pattern = "*.Rmd")
remove_exercises <- function(x) {
  f <- readLines(x)
  f_ex <- ifelse(grepl("# exercise", f), "# exercise", f)
  f_ex <- ifelse(grepl("<!-- exercise -->", f_ex), "<!-- exercise -->", f_ex)
  writeLines(as.character(f_ex), con = file.path("exercises", x))
}
exercises <- lapply(files, remove_exercises)

# knit all exercises
knit_exercises <- function(x) {
  rmarkdown::render(x, "rmarkdown::html_vignette")
}
ignore_me <- lapply(files, knit_exercises)
