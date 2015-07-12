#' A function to convert an Rmarkdown document to a pdf report
#' @export
#' @importFrom  rmarkdown pandoc_variable_arg output_format knitr_options pandoc_options
#' @param subtitle the optional subtitle of the report
#' @param cover the optional cover image of the report
#' @param cover_offset A LaTeX length unit to shift the cover image up
#' @param cover_text An optional description of the cover image. Only displayed when a cover image is added
#' @param reportnumber The number of the report. The current date will be used when missing.
#' @param lang The language to use for the babel package
#' @param keep_tex keep all intermediate files when TRUE. Useful for debugging. Defaults to FALSE
ci_report_pdf <- function(
  subtitle, 
  cover, 
  cover_offset, 
  cover_text,
  reportnumber, 
  lang,
  keep_tex = FALSE
){
  template <- system.file("pandoc/ci_report.tex", package = "corpident")
  csl <- system.file("jss.cls", package = "corpident")
  args <- c(
    "--template", template,
    pandoc_variable_arg("documentclass", "report"),
    "--latex-engine", "xelatex"
  )
  if (!missing(lang)) {
    args <- c(args, pandoc_variable_arg("lang", lang))
  }
  if (!missing(cover)) {
    args <- c(args, pandoc_variable_arg("cover", cover))
    if (!missing(cover_offset)) {
      args <- c(args, pandoc_variable_arg("coveroffset", cover_offset))
    }
    if (!missing(cover_text)) {
      args <- c(args, pandoc_variable_arg("covertext", cover_text))
    }
  }
  if (!missing(reportnumber)) {
    args <- c(args, pandoc_variable_arg("reportnumber", reportnumber))
  }
  if (!missing(subtitle)) {
    args <- c(args, pandoc_variable_arg("subtitle", subtitle))
  }
  output_format(
    knitr = knitr_options(
      opts_knit = list(
        width = 60, 
        concordance = TRUE
      ),
      opts_chunk = list(
        dev = 'pdf', 
        dpi = 300, 
        fig.width = 4.5, 
        fig.height = 2.9
      )
    ),
    pandoc = pandoc_options(
      to = "latex",
      args = args,
      keep_tex = keep_tex
    ),
    clean_supporting = !keep_tex
  )
}
