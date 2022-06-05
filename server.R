shinyServer(function(input, output) {

  output$premier_league_data <- DT::renderDataTable({
    
 
    
    main_pl_tab
    
  })
  
  fixes_pl_tab <- reactiveVal({
    fixes_pl_tab <- main_pl_tab

    fixes_pl_tab <- fixes_pl_tab %>%
      filter(`FT / HT` == "1/2" | `FT / HT` == "2/1")
    
    fixes_pl_tab <- fixes_pl_tab %>%
      mutate('Actions' = shinyInput(
        FUN = actionButton,
        n = length(fixes_pl_tab$Data),
        id = 'button_',
        label = "More info...",
        onclick = 'Shiny.setInputValue(\"select_button\", this.id, {priority: \"event\"})')
      )
    
    
  })
  
  output$premier_league_lamaki <- DT::renderDataTable({
    
    fixes_pl_tab()

    
  },
  escape = FALSE,
  
  # turn off row selection otherwise you'll also select that row when you
  # click on the actionButton 
  selection = 'none'
  )
  
  observeEvent(input$select_button, {
    showModal(modalDialog(
      title = "Somewhat important message",
      "This is a somewhat important message.",
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  employee <- eventReactive(input$select_button, {
    # take the value of input$select_button, e.g. "button_1"
    # get the button number (1) and assign to selectedRow
    selectedRow <- as.numeric(strsplit(input$select_button, "_")[[1]][2])
    
    # get the value of the "Name" column in the data.frame for that row
    paste('click on ',df()[selectedRow,"Name"])
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
