stats_pl_tab <- DT::renderDataTable({
  stats_pl_tab <- main_eng_data %>%
    filter(Div == "E0") %>% 
    select(Date,
           HomeTeam,
           AwayTeam,
           `Home Team Shots` = HS,
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