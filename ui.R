
shinyUI(fluidPage(
    titlePanel("LetterFreq"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Some help text."),
            
            selectInput("var", 
                        label = "Choose",
                        choices = list("one","two"),
                        selected = "one"),
            
            textInput("text1","Enter some text here:","Lorem Ipsum"),
            submitButton("Submit")
            
            ),
        
        
        mainPanel(verbatimTextOutput("text"))
    )
))