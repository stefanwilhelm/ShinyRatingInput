.global <- new.env()

initResourcePaths <- function() {
  if (is.null(.global$loaded)) {
    shiny::addResourcePath(
    prefix = 'ShinyRatingInput',
      directoryPath = system.file('ShinyRatingInput', package='ShinyRatingInput'))
   .global$loaded <- TRUE
  }
  HTML("")
}