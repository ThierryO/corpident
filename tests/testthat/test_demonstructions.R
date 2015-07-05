context("poster_demo.Rnw")
expect_identical(
  knitr::knit2pdf(
    input = system.file("demonstructions/poster_demo.Rnw", package = "corpident"), 
    compiler = "xelatex", 
    encoding = "UTF-8"
  ),
  "poster_demo.pdf"
)
file.remove(list.files(pattern = "^poster_demo", recursive = TRUE, full.names = TRUE))
unlink("figure", recursive = TRUE, force = TRUE)
