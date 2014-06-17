
shinyUI(fluidPage(
    titlePanel("LetterFreq"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Some help text."),
            textInput("text1","Enter some text here:","Lorem Ipsum"),
            selectInput("ref", 
                        label = "Reference Frequencies",
                        choices = list("English classics","Oxford dictionary","None"),
                        selected = "None"),
            

            submitButton("Submit")
            
            ),
        
        
#         mainPanel(textOutput("text"),plotOutput("freqplot"))
        mainPanel(plotOutput("freqplot"))        
        )
))