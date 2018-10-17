#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# check shiny gallery for different input widgets and buttons
#  https://shiny.rstudio.com/gallery/widget-gallery.html


library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("Humble beginnings"),
    sidebarLayout(
        position = "left",
        sidebarPanel(
            "From humble beginnings come great things.",
            
            #include input that gives a number
            numericInput('num', label = 'Select a sample size', value = 50),
            
            # include text input for plot title
            textInput(inputId = "plot_title", 
                      label = "Give the histogram a title:", 
                      value = "", 
                      placeholder = "Suspicious curve"),
            
            # include radio buttons for color options
            radioButtons(inputId = "radio_color", 
                         label = "Change color:", 
                         choices = list("red" = "#c51b8a",
                                        "blue" = "blue", 
                                        "green" = "#2ca25f"), 
                         selected = "#c51b8a")
        ),
        mainPanel(
            # include a plot as output
            plotOutput('graph')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # plot a histogram
    output$graph <- renderPlot({
        dataset <- data.frame("x_value" = rnorm(input$num))

        plt <- ggplot(dataset, aes(x_value)) +
            geom_histogram(fill= input$radio_color) +
            labs(title = input$plot_title)
        plt
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

