# ui.R

shinyUI(fluidPage(
    titlePanel("MyApp"),
    
    sidebarLayout(
        sidebarPanel(
          "sometext"
        ),
        
        #mainPanel(plotOutput("plot"))
        mainPanel("hey.")
    )
))
