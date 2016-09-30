shinyServer(function(input, output) {
  
  # map logic
  output$mymap <- renderLeaflet({
    # empty dataframe
    address_result <- data.frame(latitude = numeric(0), longitude = numeric(0), address = character(0))
    
    # input is a CSV and the file is working
    if ((input$input_type == "CSV") && (!is.null(input$csv_file))) {
      
      
      # input is an address
    }else if (input$input_type == "ADDRESS") {
      
      
      # coordinates as input
    } else if (input$input_type == "LAT_LONG") {
      
      
    }
    
    return(leaflet(data = address_result) %>%
             setView(lat = 30, lng = 11, zoom = 2) %>%
             addTiles() %>%
             addMarkers(lng = ~longitude, ~latitude, popup = ~as.character(address)))
  })
})