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
  
  
  output$premier_league_stats <- DT::renderDataTable({
    
    stats_pl_tab <- pl_2019_2022 %>% select(Date, HomeTeam, AwayTeam, `Home Team Shots` = HS,
                                            `Away Team Shots` = AS, 
                                            `Home Team Shots on` = HST,
                                            `Away Team Shots on Target` = AST,
                                            # `Home Team Hit Woodwork` = HHW,
                                            # `Away Team Hit Woodwork` = AHW,
                                            `Home Team Corners` = HC,
                                            `Away Team Corners` = AC,
                                            `Home Team Fouls Committed` = HF,
                                            `Away Team Fouls Committed` = AF,
                                            #`Home Team Free Kicks Conceded` = HFKC,
                                            #`Home Team Offsides` = HO,
                                            #`Away Team Offsides` = AO,
                                            `Home Team Yellow Cards` = HY,
                                            `Away Team Yellow Cards` = AY,
                                            `Home Team Red Cards` = HR,
                                            `Away Team Red Cards` = AR
                                            )
    stats_pl_tab
    
  })

})
