shinyServer(function(input, output) {
  
  # map logic
  output$mymap <- renderLeaflet({
    # empty dataframe
    address_result <- data.frame(latitude = numeric(0), longitude = numeric(0), address = character(0))
    # initial view parameters (whole map centered)
    center.lat <- 30
    center.long <- 11
    init.zoom <- 2
    
    # input is a CSV and the file is working
    if ((input$input_type == "CSV") && (!is.null(input$csv_file))) {
      
      my.file <- input$csv_file
      address_result <- geo_connect_csv(my.file$datapath)
      
      # input is an address
    }else if (input$input_type == "ADDRESS") {
      
      address_result <- geo_connect_vector(input$address_t)
      # specific view parameters only if the user's input is correct
      if ((input$address_t != "") && (address_result$address != "ERROR")) {
        center.long <- address_result$longitude
        center.lat <- address_result$latitude
        init.zoom <- 15
      }
      # coordinates as input
    } else if (input$input_type == "LAT_LONG") {
      
      address_result <- geo_connect_vector(paste0(input$lat_t, ",", input$long_t))
      # specific view parameters only if the user's input is correct
      if ((input$long_t != "") && (input$lat_t != "") && (address_result$address != "ERROR")) {
        center.long <- address_result$longitude
        center.lat <- address_result$latitude
        init.zoom <- 15
      }
      
    }
    
    address_result <- subset(address_result, address_result$address != "ERROR")
    return(leaflet(data = address_result) %>%
             setView(lat = center.lat, lng = center.long, zoom = init.zoom) %>%
             addTiles() %>%
             addMarkers(lng = ~longitude, ~latitude, popup = ~as.character(address)))
  })
})