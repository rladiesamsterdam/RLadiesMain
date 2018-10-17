#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# load libraries
library(shiny)
# load additional libraries if required


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # load data
    df <- read.csv("./data/Reveal_EEO1_for_2016.csv", colClasses = c(rep("factor",4), "numeric"), sep = ";")
    

    # create output (e.g. a plot or a table)

  
})
