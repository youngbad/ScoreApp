shinyServer(function(input, output) {

  output$premier_league_data <- DT::renderDataTable({
    
    main_pl_tab
    
  })

})
