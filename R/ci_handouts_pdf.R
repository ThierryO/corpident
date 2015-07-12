#' Use the handout version of slides
#' @param subtitle The date and place of the event
#' @param location The date and place of the event
#' @param institute The aviliation of the authors
#' @param cover The filename of the cover image
#' @param cover_offset An optional offset for the cover image
#' @param fontsize The fontsite of the document. Defaults to 10pt.
#' @param lang The language of the document. Defaults to "dutch"
#' @param slide_level Indicate which heading level is used for the frame titles
#' @param keep_tex Keep the tex file. Defaults to FALSE.
#' @param ... extra parameters
#' @export
#' @importFrom rmarkdown output_format knitr_options pandoc_options pandoc_variable_arg pandoc_path_arg
ci_handouts_pdf <- function(
  subtitle, 
  location, 
  institute, 
  cover, 
  cover_offset, 
  fontsize, 
  lang = "english", 
  slide_level = 2, 
  keep_tex = FALSE, 
  ...
){
  extra <- list(...)
  csl <- system.file("jss.cls", package = "corpident")
  template <- system.file("pandoc/ci_slides.tex", package = "corpident")
  args <- c(
    "--slide-level", as.character(slide_level),
    "--template", template,
    "--latex-engine", "xelatex",
    pandoc_variable_arg("lang", lang),
    pandoc_variable_arg("handout", "true")
  )
  if ("usepackage" %in% names(extra)) {
    tmp <- sapply(
      extra$usepackage,
      pandoc_variable_arg,
      name = "usepackage"
    )
    args <- c(args, tmp)
  }
  args <- c(args, "--csl", pandoc_path_arg(csl))
  if (!missing(subtitle)) {
    args <- c(args, pandoc_variable_arg("subtitle", subtitle))
  }
  if (!missing(location)) {
    args <- c(args, pandoc_variable_arg("location", location))
  }
  if (!missing(fontsize)) {
    args <- c(args, pandoc_variable_arg("fontsize", fontsize))
  }
  if (!missing(institute)) {
    args <- c(args, pandoc_variable_arg("institute", institute))
  }
  if (!missing(cover)) {
    args <- c(args, pandoc_variable_arg("cover", cover))
    if (!missing(cover_offset)) {
      args <- c(args, pandoc_variable_arg("coveroffset", cover_offset))
    }
  }
  output_format(
    knitr = knitr_options(
      opts_knit = list(
        width = 60, 
        concordance = TRUE
      ),
      opts_chunk = list(
        dev = 'pdf', 
        dev.args = list(bg = 'transparent'), 
        dpi = 300, 
        fig.width = 4.5, 
        fig.height = 2.9
      )
    ),
    pandoc = pandoc_options(
      to = "beamer",
      args = args,
      keep_tex = keep_tex
    ),
    clean_supporting = !keep_tex
  )
}
