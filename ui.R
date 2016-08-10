#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Pokémon Hidden Power Calculator"),
  
  # Sidebar with a slider input
  sidebarLayout(
    sidebarPanel(
       sliderInput("hp",
                   "HP:",
                   min = 0,
                   max = 31,
                   value = 31),
       sliderInput("atk",
                   "Attack:",
                   min = 0,
                   max = 31,
                   value = 31),
       sliderInput("def",
                   "Defense:",
                   min = 0,
                   max = 31,
                   value = 31),
       sliderInput("spa",
                   "Special Attack:",
                   min = 0,
                   max = 31,
                   value = 31),
       sliderInput("spd",
                   "Special Defense:",
                   min = 0,
                   max = 31,
                   value = 31),
       sliderInput("sp",
                   "Speed:",
                   min = 0,
                   max = 31,
                   value = 31)
    ),
    
    # Show text for calculated type and damage
    mainPanel(
       h3("Type:"),
       textOutput("type"),
       # h3("Damage:"),
       # textOutput("dmg")
    )
  )
))
