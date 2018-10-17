#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes) # change layout of shinyapp 
library(DT) # create nice tables

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    theme= shinytheme("journal"), # app layout
    # Application title
    titlePanel("Gender Diversity in Silicon Valley Tech Companies in 2016"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        # make a selection box for race
        selectizeInput("selectCompany", label = h4("Select a company:"), choices = NULL, selected = "LinkedIn", multiple = TRUE,
                       options = NULL),
        
        # make a selection box for race
        selectizeInput("selectEthnicity", label = h4("Select an ethnicity:"), choices = NULL, selected = "Asian", multiple = FALSE,
                       options = NULL),
        
        # make a group of checkboxes for gender
        checkboxGroupInput("checkGender", label = h4("Display gender:"), 
                           choices = list("Male" = "male", "Female" = "female"),
                           selected = c("female", "male")),
        
        # make a selection box for jobs
        selectizeInput("selectJob", label = h4("Select an oocupation:"), choices = NULL, selected = "Professionals", multiple = FALSE,
                       options = NULL)
        # add submit button. changes will only be applied once button is clicked
       # submitButton(text = "Show me", icon = icon('angle-right'))
    ),
    
    # Show the generated output
    mainPanel(
        #create tabs
        tabsetPanel(type = "pills",
                    tabPanel(title= "Diversity", plotOutput("barPlot"), icon = icon("transgender")), 
                    #tabPanel("Summary", verbatimTextOutput("summary")),
                    tabPanel("Table", dataTableOutput("table"), icon = icon("table"))
        )
    )
  )
))
