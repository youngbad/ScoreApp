pl_matches_all <- reactiveVal({
  pl_matches_all <- main_eng_data %>% filter(Div == "E0")
})


fix_pl_tab <- reactiveVal({
  
  fix_pl_tab <- main_eng_data %>% filter(Div == "E0")
  
  fix_pl_tab <- fix_pl_tab %>%
    filter(`FT / HT` == "1/2" | `FT / HT` == "2/1") %>%
    select(Date, HomeTeam, AwayTeam, FTR,
           HTR, Referee, FTR, `FT / HT`)
  
  fix_pl_tab <- fix_pl_tab %>%
    mutate('Details' = shinyInput(
      FUN = actionButton,
      n = length(fix_pl_tab$Date),
      id = 'button_',
      label = "More info...",
      onclick = 'Shiny.setInputValue(\"select_button_pl\", this.id, {priority: \"event\"})')
    )
  
  
})

referees_pl_tab <- reactiveVal({
  referees_pl_tab <- main_eng_data %>% filter(Div == "E0") %>%
  select(Referee,
         `Home Team Fouls Committed` = HF,
         `Away Team Fouls Committed` = AF,
         # `Home Team Free Kicks Conceded` = HFKC,
         # `Away Team Free Kicks Conceded` = AFKC,
         `Home Team Yellow Cards` = HY,
         `Away Team Yellow Cards` = AY,
         `Home Team Red Cards` = HR,
         `Away Team Red Cards` = AR
  ) %>% group_by(Referee) %>%
    summarise(
      `Home Team Total Fouls Committed` = sum(`Home Team Fouls Committed`, na.rm = T),
      `Away Team Total Fouls Committed` = sum(`Away Team Fouls Committed`, na.rm = T),
      `Home Team Total Yellow Cards` = sum(`Home Team Yellow Cards`, na.rm = T),
      `Away Team Total Yellow Cards` = sum(`Away Team Yellow Cards`, na.rm = T),
      `Home Team Total Red Cards` = sum(`Home Team Red Cards`, na.rm = T),
      `Away Team Total Red Cards` = sum(`Away Team Red Cards`, na.rm = T)
    )
  
  referees_pl_tab <- referees_pl_tab %>%
    mutate('Details' = shinyInput(
      FUN = actionButton,
      n = length(referees_pl_tab$Referee),
      id = 'button_',
      label = "More info...",
      onclick = 'Shiny.setInputValue(\"select_button_pl_referees\", this.id, {priority: \"event\"})')
    )
})