#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# ACKNOWLDEGEMENTS DATA:
# the data is obtained from https://www.kaggle.com/rtatman/silicon-valley-diversity-data
#
# The EEO-1 database is licensed under the Open Database License (ODbL) by Reveal from The Center for Investigative Reporting.
# You are free to copy, distribute, transmit and adapt the spreadsheet, so long as you:
#     
# credit Reveal (including this link if it’s distributed online);https://www.revealnews.org/article/hidden-figures-how-silicon-valley-keeps-diversity-data-secret/
# inform Reveal that you are using the data in your work by emailing Sinduja Rangarajan at srangarajan@revealnews.org; and
# offer any new work under the same license.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
    titlePanel("Gender diversity in Silicon Valley in 2016"),
    sidebarLayout(
        position = "left",
        sidebarPanel(
            helpText("This dataset describes the number of employees in 23 companies in 
            Silicon Valley in 2016. The dataset was gathered by Reveal from the 
            EEO-1 statements of each company.")
            
            #include a number of inputs

        ),
        mainPanel(
            # include a plot/table etc as output
            
        )
    )
))
