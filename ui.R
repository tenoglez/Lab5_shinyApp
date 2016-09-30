shinyUI(fluidPage(  
  
  headerPanel("Shiny app using package geoloc"),
  
  sidebarLayout(
    # Sidebar 
    sidebarPanel(
      # radio
      radioButtons("input_type", "Select an input:",
                   c("Address" = "ADDRESS",
                     "Latitude and Longitude" = "LAT_LONG",
                     "CSV file" = "CSV")),
      
    ),
    
    # Show map
    mainPanel()
    
  )
  
  
  
))