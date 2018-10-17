#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT) # create nice tables

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Gender Diversity in Silicon Valley Tech Companies in 2016"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        # make a selection box for a number of companies
        selectInput("selectCompany", label = h4("Select a company:"), choices = list("23andMe" = "23andMe", 
                                                                                     "Intel" = "Intel", 
                                                                                     "LinkedIn" = "LinkedIn",
                                                                                     "Pinterest" = "Pinterest",
                                                                                     "Google" = "Google",
                                                                                     "Facebook" = "Facebook"), selected = "LinkedIn"),
        
        # make radio buttons for ethnicity
        radioButtons("selectEthnicity", label = h4("Select an ethnicity:"), choices = list("Asian" = "Asian",
                                                                                          "Black_or_African_American" = "Black_or_African_American",
                                                                                          "Hispanic_or_Latino" = "Hispanic_or_Latino",
                                                                                          "White" = "White"), selected = "Asian"),
        
        # make a group of checkboxes for gender
        checkboxGroupInput("checkGender", label = h4("Display gender:"), 
                           choices = list("Male" = "male", "Female" = "female"),
                           selected = c("female", "male")),
        
        # make a selection box for jobs
        selectInput("selectJob", label = h4("Select an oocupation:"), choices = list("Administrative support" = "Administrative support",
                                                                                     "Executives" = "Executives",
                                                                                     "Managers" = "Managers",
                                                                                     "Professionals" = "Professionals",
                                                                                     "Sales workers" = "Sales workers",
                                                                                     "Technicians" = "Technicians"), selected = "Executives")
        
        # add submit button. changes will only be applied once button is clicked
       # submitButton(text = "Show me", icon = icon('angle-right'))
    ),
    
    # Show the generated output
    mainPanel(

        plotOutput("barPlot")
        
    )
  )
))
