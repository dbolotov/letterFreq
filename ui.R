#ui.R

shinyUI(fluidPage(
    theme="bootstrap.css",
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
            textInput("text1",HTML("<b>ENTER SOME TEXT</b>"),"Lorem Ipsum"),
#             selectInput("ref", 
#                         label = "Reference Distribution:",
#                         choices = list("English classics","Oxford dictionary","None"),
#                         selected = "None"),
#             

            radioButtons("ref", 
            label = HTML("<b>REFERENCE DISTRIBUTION</b>"),
            choices = list("English classics","Oxford dictionary","None"),
            selected = "None"),



            submitButton("Plot")
            
            ),

            wellPanel(
                helpText(HTML("<b>REFERENCE DATA SOURCES</b>")),
                helpText(HTML("<a href='http://www.data-compression.com/english.html'>English classics</a>")),
                helpText(HTML("<a href='http://www.oxforddictionaries.com/us/words/what-is-the-frequency-of-the-letters-of-the-alphabet-in-english'>Oxford dictionary</a>"))
                
                ),

            wellPanel(
                helpText(HTML("<b>OTHER INFO</b>")),
                helpText(HTML("<a href='https://github.com/dbolotov/letterFreq'>GitHub</a>"))
                )



            ),
        
        
#         mainPanel(textOutput("text"),plotOutput("freqplot"))
        mainPanel(plotOutput("freqplot"))        
        )
))