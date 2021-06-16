#https://stackoverflow.com/questions/35472674/interactive-map-in-r-using-leaflet-shiny/35515523

library(shiny)
library(leaflet)


#Saves html code for site to shinyUI
shinyUI <- fluidPage(
  titlePanel("NYC  Cab/Uber Pay Map"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cab_type", 
                  label = "Cab Type:",
                  choices = c(2000,2005,2010), #SHOULD THESE BE NUMBERS? But how would the user know what each number represents 
                  selected = 2000
      ),
      selectInput("source", 
                  label = "Pickup Location:",
                  choices = c(2000,2005,2010),
                  selected = 2000
      ),
      selectInput("surge_multiplier", 
                   label = "Surge Multiplier:",
                   choices = c(2000,2005,2010),
                   selected = 2000
      ),
      selectInput("product_id", 
                  label = "Product id:",
                  choices = c(2000,2005,2010),
                  selected = 2000
      ),
      selectInput("name", 
                  label = "Name of Cab Company:",
                  choices = c(2000,2005,2010),
                  selected = 2000
      ),
      selectInput("minute", 
                  label = "Choose Minute:",
                  choices = c(2000,2005,2010),
                  selected = 2000
      ),
      selectInput("hour", 
                    label = "Choose Hour:",
                    choices = c(2000,2005,2010),
                    selected = 2000
      ),
      selectInput("day", 
                    label = "Choose Day:",
                    choices = c(2000,2005,2010),
                    selected = 2000
      ),
      selectInput("month", 
                  label = "Choose Month:",
                  choices = c(2000,2005,2010),
                  selected = 2000
      ),
      selectInput("year", 
                    label = "Choose Year:",
                    choices = c(2018),
                    selected = 2018
      )),
    
    mainPanel (leafletOutput("map","100%",300))
    
  )
)

