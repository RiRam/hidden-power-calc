#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("hidden-power-calc/calc.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$type <- renderText({
    get_hp_type(input$hp, input$atk, input$def, input$sp,
                input$spa, input$spd)
  })
  
  output$dmg <- renderText({
    get_hp_damage(input$hp, input$atk, input$def, input$sp,
                  input$spa, input$spd)
  })
  
})
