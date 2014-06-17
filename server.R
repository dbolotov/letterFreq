#server.R

library(plyr)
library(ggplot2)
source("helpers.R")

str <- "Lorem Ipsum is simply dummy text"


shinyServer(function(input, output) {
    
    output$text <- renderText({
        paste("You wrote:", sanitize(input$text1))
    })
    
    
    
})
