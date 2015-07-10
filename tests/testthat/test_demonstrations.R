context("poster_demo.Rnw")
expect_identical(
  knitr::knit2pdf(
    input = system.file("demonstrations/poster_demo.Rnw", package = "corpident"), 
    compiler = "xelatex", 
    encoding = "UTF-8"
  ),
  "poster_demo.pdf"
)
file.remove(list.files(pattern = "^poster_demo", recursive = TRUE, full.names = TRUE))
unlink("figure", recursive = TRUE, force = TRUE)

temp_dir <- normalizePath(tempdir(), winslash = "/")
context("rw-FAQ.Rmd")
expect_identical(
  rmarkdown::render(
    input = system.file("demonstrations/rw-FAQ.Rmd", package = "corpident"), 
    output_format = "ci_report_pdf", 
    output_file = paste0(temp_dir, "/rw-FAQ-report.pdf"),
    encoding = "UTF-8"
  ),
  paste0(temp_dir, "/rw-FAQ-report.pdf")
)

expect_identical(
  rmarkdown::render(
    input = system.file("demonstrations/rw-FAQ.Rmd", package = "corpident"), 
    output_format = "ci_report_html", 
    output_file = paste0(temp_dir, "/rw-FAQ-report.html"),
    encoding = "UTF-8"
  ),
  paste0(temp_dir, "/rw-FAQ-report.html")
)
