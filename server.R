shinyServer(function(input, output) {
  
  # map logic
  output$mymap <- renderLeaflet({
    
    return(leaflet() %>%
             setView(lat = 30, lng = 11, zoom = 2) %>%
             addTiles())
  })
})