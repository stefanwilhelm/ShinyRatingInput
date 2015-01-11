# ShinyRatingInput

This package is wrapping up the [bootstrap-rating](https://github.com/dreyescat/bootstrap-rating/) JavaScript library for the use with Shiny. It allows for easy creating of rating input controls in Shiny, such as:

```
#in ui.R
library(ShinyRatingInput)
shinyUI(bootstrapPage(
  ratingInput("movieRating", label="Rate this movie...", dataStop=10, dataFractions=2),
  htmlOutput("movieRating")
))

#the corresponding server.R
shinyServer(function(input, output, session) {
 output$movieRating <- renderText({
   paste("The movie was rated ",input$movieRating)
})
})
```

To install, install the `devtools` package if necessary (`install.packages("devtools")`) and run:

```
devtools::install_github("ShinyRatingInput", "stefanwilhelm")
```

External Javascript libraries used in this package include:

* [bootstrap-rating](https://github.com/dreyescat/bootstrap-rating/)


Credits
=======

Many thanks to [dreyescat](https://github.com/dreyescat/bootstrap-rating/) for the [bootstrap-rating](https://github.com/dreyescat/bootstrap-rating/) library.

Many thanks also to

* [shinyDash](https://github.com/trestletech/ShinyDash) and
* [shiny-jsdemo](https://github.com/wch/shiny-jsdemo)

for demonstrating various techniques to integrate third-party JavaScript libraries into Shiny.


License information
===================

* [bootstrap-rating](https://github.com/dreyescat/bootstrap-rating/) is released under the MIT license.
* All other code in this package is licensed under MIT license.

