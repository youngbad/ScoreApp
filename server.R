shinyServer(function(input, output) {

  output$premier_league_data <- DT::renderDataTable({
    
    main_pl_tab <- main_eng_data %>% filter(Div == "E0")
    
  })
  
  fix_pl_tab <- reactiveVal({
    
    fix_pl_tab <- main_eng_data %>% filter(Div == "E0")

    fix_pl_tab <- fix_pl_tab %>%
      filter(`FT / HT` == "1/2" | `FT / HT` == "2/1") %>%
      select(Date, HomeTeam, AwayTeam, FTR,
             HTR, Referee, FTR, `FT / HT`)
      
      fix_pl_tab <- fix_pl_tab %>%
      mutate('Actions' = shinyInput(
        FUN = actionButton,
        n = length(fix_pl_tab$Date),
        id = 'button_',
        label = "More info...",
        onclick = 'Shiny.setInputValue(\"select_button_pl\", this.id, {priority: \"event\"})')
      )
    
    
  })
  
  output$premier_league_fixes <- DT::renderDataTable({
    
   output_table <- fix_pl_tab()
   output_table
  },
  escape = FALSE,
  
  # turn off row selection otherwise you'll also select that row when you
  # click on the actionButton 
  selection = 'none'
  )
  
  observeEvent(input$select_button_pl, {
    showModal(modalDialog(
      title = "Somewhat important message",
      "This is a somewhat important message.",
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  selected_button_value_pl <- eventReactive(input$select_button, {
    # take the value of input$select_button, e.g. "button_1"
    # get the button number (1) and assign to selectedRow
    selectedRow <- as.numeric(strsplit(input$select_button_pl, "_")[[1]][2])
    
    # get the value of the "Name" column in the data.frame for that row
    paste('click on ',df()[selectedRow,"Name"])
  })
  
  output$premier_league_stats <- DT::renderDataTable({
    
    stats_pl_tab <- main_eng_data %>%
      filter(Div == "E0") %>% 
      select(Date, HomeTeam, AwayTeam, `Home Team Shots` = HS,
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
  ### Spain
  output$premier_divison_data <- DT::renderDataTable({
    
    main_pd_tab <- main_spain_data %>% filter(Div == "SP1")
    
  })
  ### France
  output$ligue_1_data <- DT::renderDataTable({
    
    main_l1_tab <- main_france_data %>% filter(Div == "F1")
    
  })
  ### Germany
  output$bundesliga_data <- DT::renderDataTable({
    
    main_bl_tab <- main_germany_data %>% filter(Div == "D1")
  
  })
  

})
