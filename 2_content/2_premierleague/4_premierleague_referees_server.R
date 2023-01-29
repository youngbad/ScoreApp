pl_referees_tab <- DT::renderDataTable({
  
  pl_referees_tab <- pl_matches_all() %>%
    select(Referee,
           `Home Team` = HomeTeam,
           `Away Team` = AwayTeam,
           `Home Team Fouls Committed` = HF,
           `Away Team Fouls Committed` = AF,
           # `Home Team Free Kicks Conceded` = HFKC,
           # `Away Team Free Kicks Conceded` = AFKC,
           `Home Team Offsides` = HO,
           `Away Team Offsides` = AO,
           `Home Team Yellow Cards` = HY,
           `Away Team Yellow Cards` = AY,
           `Home Team Red Cards` = HR,
           `Away Team Red Cards` = AR
           )
    
  
})

pl_referees_summary <- DT::renderDataTable({  
  pl_referess_summary <- referees_pl_tab()
    
  pl_referess_summary
},
escape = FALSE,

# turn off row selection otherwise you'll also select that row when you
# click on the actionButton 
selection = 'none'
)
select_button_pl_ref <- eventReactive(input$select_button_r, {
  # take the value of input$select_button, e.g. "button_1"
  # get the button number (1) and assign to selectedRow
  selectedRow <- as.numeric(strsplit(input$select_button_pl_referees, "_")[[1]][2])
  
  # get the value of the "Name" column in the data.frame for that row
  paste('click on ',df()[selectedRow,"Name"])
})  