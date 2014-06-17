#server.R

library(plyr)
library(ggplot2)

str <- "Lorem Ipsum is simply dummy text"


shinyServer(function(input, output) {
    
    output$text <- renderText({
        paste("You wrote:", input$text1)
    })
    
    
    
})
