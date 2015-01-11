\name{ratingInput}
\alias{ratingInput}
\title{
Create a rating input control for Shiny
}
\description{
  Create a input control for Shiny for entry of numeric values over some range.
}
\usage{
ratingInput(inputId, label, class="rating",
 dataFilled="fa fa-star",
 dataEmpty="fa fa-star-o",
 dataStart=0, 
 dataStop=5, 
 dataStep=1,
 dataFractions=1,
 disabled=FALSE,
 readonly=FALSE,
 value=NULL)
}
\arguments{
  \item{inputId}{Input variable to assign the control's value to}
  \item{label}{Display label for the control}
  \item{class}{The CSS class used for the input control. Defaults to "rating".}
  \item{dataFilled}{The CSS class/icon used for filled symbols.}
  \item{dataEmpty}{The CSS class/icon used for empty symbols.}
  \item{dataStart}{The start of the range (not included)}
  \item{dataStop}{The end of the range (included)}
  \item{dataStep}{The step size}
  \item{dataFractions}{The number of equal selectable parts within one symbol.}
  \item{disabled}{Set the control to disabled.}
  \item{readonly}{Flag whether to display the rating input control in read-only mode.}
  \item{value}{Initial Value. Defaults to NULL.}
}
\details{
The rating input control creates an input control over the range dataStart (not included) to dataStop (included) with step size dataStep. The default range is (0,...,5], that is a input control over the ratings [1, 2, 3, 4, 5]. The parameter dataFractions indicates the number of equal parts that users may select. dataFractions=3 will allow to select [1,1.33,1.66,2,2.33,2.66,3,...,5].
The range will by displayed as symbols, such as stars. The parameters dataFilled and dataEmpty control which icons will be used for filled or empty symbols.

}
\references{
 See \url{https://github.com/dreyescat/bootstrap-rating} and working example on \url{http://dreyescat.github.io/bootstrap-rating/}
}
\author{
Stefan Wilhelm <wilhelm@financial.com>
}

\examples{
\dontrun{
#in ui.R
shinyUI(bootstrapPage(
  ratingInput("movieRating", label="Rate this movie...", dataStop=10, dataFractions=2),
  htmlOutput("movieRating")
))

#The corresponding server.R
shinyServer(function(input, output, session) {
 output$movieRating <- renderText({
   paste("The movie was rated ",input$movieRating)
})
})
}
}