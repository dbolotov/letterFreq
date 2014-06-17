#ui.R

shinyUI(fluidPage(
    titlePanel("LetterFreq!"),
    
    sidebarLayout(
        sidebarPanel(
            wellPanel(
                helpText(HTML("<b>ABOUT</b>")),
                helpText("This little app displays the distribution of relative English letter frequencies
                        of the input text, 
                        and optionally shows a reference distribution from one of several sources.")
            ),
            
            wellPanel(
            textInput("text1","Enter some text here:","Lorem Ipsum"),
            selectInput("ref", 
                        label = "Reference Distribution:",
                        choices = list("English classics","Oxford dictionary","None"),
                        selected = "None"),
            

            submitButton("Submit")
            
            )),
        
        
#         mainPanel(textOutput("text"),plotOutput("freqplot"))
        mainPanel(plotOutput("freqplot"))        
        )
))