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