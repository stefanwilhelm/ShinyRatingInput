# This input builds a Shiny rating input,
# based on the library "bootstrap-rating" from
# https://github.com/dreyescat/bootstrap-rating/ 
# (live demo: http://dreyescat.github.io/bootstrap-rating/)

# Icons are used from Fontawesome or Glyphicon,
# e.g. the fontawesome stars
# fa-star-o (empty)
# fa-star   (full)

ratingInput <- function(inputId, label, class="rating",
 dataFilled="fa fa-star",
 dataEmpty="fa fa-star-o",
 dataStart=0, dataStop=5, dataStep=1,
 dataFractions=1,
 disabled=FALSE,
 readonly=FALSE,
 value=NULL) {

 # For <input type="hidden">, no Shiny input binding exists, so users may need to write one on their own.
 # See discussion: https://groups.google.com/forum/#!topic/shiny-discuss/FU-aDoxKBNA
 # We use <input type="text" style="display:none"> instead,
 # because for text inputs the Shiny binding is already available.
 #
 controlLabel <- tags$label(class = "control-label", `for` = inputId, label)
 inputTag <- tags$input(id=inputId, class=class, type="text", style="display:none",
      `data-filled`=dataFilled,
      `data-empty`=dataEmpty,
      `data-start`=dataStart,
      `data-stop`=dataStop,
      `data-step`=dataStep,
      `data-fractions`=dataFractions)

 if (disabled) inputTag <- tagAppendAttributes(inputTag, `disabled`="disabled")
 if (readonly) inputTag <- tagAppendAttributes(inputTag, `readonly`="readonly")
 if (!is.null(value)) inputTag <- tagAppendAttributes(inputTag, `value`=value)

 tagList(
   singleton(
    tags$head(
     initResourcePaths(),  
     tags$script(src = "ShinyRatingInput/bootstrap-rating-master/bootstrap-rating.js"),
     tags$link(rel = "stylesheet", type = "text/css", href = "ShinyRatingInput/bootstrap-rating-master/bootstrap-rating.css"),
     tags$link(rel = "stylesheet", type = "text/css", href = "ShinyRatingInput/css/font-awesome.min.css"),
     tags$link(rel = "stylesheet", type = "text/css", href = "ShinyRatingInput/css/bootstrap.min.css")
    )
   ),
   controlLabel,
   inputTag
 )
}
