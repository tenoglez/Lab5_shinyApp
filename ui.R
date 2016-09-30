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
      conditionalPanel(
        condition = "input.input_type == 'ADDRESS'",
        textInput("address_t", "Type an address:", placeholder = "Skattegarden 29B, Linköping")
      ),
      conditionalPanel(
        condition = "input.input_type == 'LAT_LONG'",
        textInput("lat_t", "Type a latitude value:", placeholder = "58.4290005"),
        textInput("long_t", "Type a longitude value:", placeholder = "15.5799367")
      ),
      conditionalPanel(
        condition = "input.input_type == 'CSV'",
        fileInput('csv_file', 'Choose a file to upload',
                  accept = c(
                    'text/csv',
                    'text/comma-separated-values',
                    'text/tab-separated-values',
                    'text/plain',
                    '.csv',
                    '.tsv'
                  )
        )
      )
    ),
    
    # Show map
    mainPanel(leafletOutput("mymap", height = "800px"))
    
  )
  
  
  
))