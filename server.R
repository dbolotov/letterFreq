#server.R

library(plyr)
library(ggplot2)
source("helper_functions.R")

str <- "Lorem Ipsum is si776mply dummy text ^^ 0-2w/./ ."


shinyServer(function(input, output) {
    
    output$text <- renderText({
        paste("Original text:", input$text1)
    })

    output$freqplot <- renderPlot({
        
        fplot(input$text1)
    })
    
    
})
