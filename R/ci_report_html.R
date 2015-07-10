#' A function to convert an R Markdown document to a HTML page
#' @export
#' @importFrom  rmarkdown output_format knitr_options pandoc_options
ci_report_html <- function(){
  css <- system.file("Rfaq.css", package = "corpident")
  output_format(
    knitr = knitr_options(
      opts_chunk = list(dev = 'png')
    ),
    pandoc = pandoc_options(
      to = "html",
      args = c(
        "--toc", 
        paste0("-css=", css)
      )
    ),
    clean_supporting = TRUE
  )
}
