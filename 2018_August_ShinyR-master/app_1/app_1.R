#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("Humble beginnings"),
    sidebarLayout(
        position = "left",
        sidebarPanel(
            #add some explanatory text
            
            #include input that gives a number
            numericInput(inputId = 'num', 
                         label = 'Select a sample size', 
                         value = 50)

        ),
        mainPanel(
            plotOutput('hist')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # plot a histogram
    output$hist <- renderPlot({
        dataset <- data.frame("x_value" = rnorm(input$num))

        plt <- ggplot(dataset, aes(x_value)) +
            geom_histogram()
        plt
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

