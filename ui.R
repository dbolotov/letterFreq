
shinyUI(fluidPage(
    titlePanel("LetterFreq"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Some help text."),
            
            selectInput("ref", 
                        label = "Reference Frequencies",
                        choices = list("English classics","Oxford dictionary"),
                        selected = "English classics"),
            
            textInput("text1","Enter some text here:","Lorem Ipsum"),
            submitButton("Submit")
            
            ),
        
        
        mainPanel(textOutput("text"),plotOutput("freqplot"))
#         mainPanel(textOutput("text"))
        
        )
))