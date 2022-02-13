shinyServer(function(input, output) {

  output$premier_league_data <- DT::renderDataTable({
    
    main_pl_tab$Data <- as.Date(main_pl_tab$Data, format = '%y%m%d')
    
    main_pl_tab
    
  })
  
  output$premier_league_lamaki <- DT::renderDataTable({
    
    lamaki_pl_tab <- main_pl_tab
    
    lamaki_pl_tab$Data <- as.Date(lamaki_pl_tab$Data, format = '%y%m%d')
    
    lamaki_pl_tab <- lamaki_pl_tab %>%
      filter(`FT / HT` == "1/2" | `FT / HT` == "2/1")
    
    lamaki_pl_tab
    
  })

})
