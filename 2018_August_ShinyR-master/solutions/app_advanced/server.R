#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
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

# load libraries
library(shiny)
library(tidyverse) 


# Define server logic required to draw a histogram
shinyServer(function(session, input, output) {
   
    #load your data
    dt <- read.csv("./data/Reveal_EEO1_for_2016.csv", colClasses = c(rep("factor",4), "numeric"), sep = ";")

    # add choices to ui input
    updateSelectizeInput(session, 'selectCompany', choices = dt$company, server = TRUE)
    updateSelectizeInput(session, 'selectEthnicity', choices = dt$ethnicity, server = TRUE)
    updateSelectizeInput(session, 'selectJob', choices = dt$job_category, server = TRUE)
  
    # create bar plot 
    output$barPlot <- renderPlot({
        dtPlot <- subset(dt,company %in% input$selectCompany & 
                         ethnicity %in% input$selectEthnicity & 
                         job_category %in% input$selectJob)
        
        plt <- ggplot(dtPlot, aes(x= company, y = count, fill = gender)) +
            geom_bar(stat = 'identity', position = position_dodge(), color= 'black') +
            scale_fill_manual(values = c('#28D246', '#7142FF')) +
            theme_classic() + 
            labs(title = sprintf("Gender diversity in %s", input$selectJob),
                 x= "Company",
                 y = "Number of employees") +
            theme(axis.text.x = element_text(face="bold", size=12), 
                  axis.text.y = element_text(face="bold", size=12), 
                  plot.title = element_text(hjust = 0.5, size=14),
                  axis.title = element_text(size=12)) +
            NULL
        plt
        
    })
    
    # create table
    output$table <- renderDataTable({
        dtPlot <- subset(dt,company %in% input$selectCompany & 
                             ethnicity %in% input$selectEthnicity & 
                             job_category %in% input$selectJob)
        
        
        datatable(dtPlot, rownames = FALSE)
    })
})
