print_select <- renderPrint(input$choice_league)


scored_goals <- renderValueBox({
  valueBox(
  if("Premier League" %in% selected_league()){
    scored_goals <- sum(main_eng_data$FTHG, na.rm = T) + sum(main_eng_data$FTAG, na.rm = T)
  }
  )
})