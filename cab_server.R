#Cab_Server
#https://stackoverflow.com/questions/35472674/interactive-map-in-r-using-leaflet-shiny/35515523

library(leaflet)
library(reticulate) #Sends stuff from python to R

use_python(python = "C://Users//harri//AppData//Local//Programs//Python//Python39//python.exe", required = TRUE) #Tells it to use my python stuff, & where to find it

#use_condaenv(condaenv="test123", required=TRUE) #Tells R to use anaconda environment (conda env)  

#py_install(packages='joblib') #Makes R understand python package joblib

source_python("Interface_for_R.py")

hotels <- read.table(text = "Hotel Year  latitude        longitude
                              A   2000  41.886337      -87.628472
                              B   2005  41.88819       -87.635199
                              C   2010  41.891113      -87.63301", 
                     header = TRUE)

shinyServer <- function(input, output) {
  
  output$map <- renderLeaflet({
    df <- hotels[hotels$Year == input$year,]  
    leaflet()  %>%
      addTiles() %>%
      addMarkers(data = df)
  })
  
}

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

#Runs it
shinyApp(shinyUI, shinyServer)