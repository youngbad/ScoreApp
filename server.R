source('0_init/0_server_reactive_values.R') 
source('2_content/1_hometab/1_hometab_server.R')
source('2_content/2_premierleague/1_premierleague_maintab_server.R')
source('2_content/2_premierleague/2_premierleague_fixes_server.R')
source('2_content/2_premierleague/3_premierleague_matchstats_server.R')
source('2_content/2_premierleague/4_premierleague_referees_server.R')
source('2_content/3_premierdivision/1_premierdivision_maintab_server.R')
source('2_content/4_ligue1/1_ligue1_maintab_server.R')
source('2_content/5_bundesliga/1_bundesliga_maintab_server.R')


shinyServer(function(input, output) {
  ### Hometab part ###
  output$scored_goals <- renderValueBox({
    shinydashboard::valueBox(
      value = tags$p(paste0(if("Premier League" %in% input$choice_league){
        main_eng_data <- main_eng_data %>% filter(lubridate::year(main_eng_data$Date) == '2022')
        scored_goals <- sum(main_eng_data$FTHG, na.rm = T) + sum(main_eng_data$FTAG, na.rm = T)
      } else if("Premier Division" %in% input$choice_league){
        main_spain_data <- main_spain_data %>% filter(lubridate::year(main_spain_data$Date) == '2022')
        scored_goals <- sum(main_spain_data$FTHG, na.rm = T) + sum(main_spain_data$FTAG, na.rm = T)
      } else if("Ligue 1" %in% input$choice_league){
        main_france_data <- main_france_data %>% filter(lubridate::year(main_france_data$Date) == '2022')
        scored_goals <- sum(main_france_data$FTHG, na.rm = T) + sum(main_france_data$FTAG, na.rm = T)
        } else if("Bundesliga" %in% input$choice_league){
        main_germany_data <- main_germany_data %>% filter(lubridate::year(main_germany_data$Date) == '2022')
        scored_goals <- sum(main_germany_data$FTHG, na.rm = T) + sum(main_germany_data$FTAG, na.rm = T)
        
        }
      ), style = 'font-size:100%;'
      ),
      subtitle = "Scored goals",
      width = 3,
      color = "blue",
      icon = tags$i(class = 'fa-regular fa-futbol',  style="font-size: 100px; color: light-blue;"),
    )
  })
  output$yellow_cards <- renderValueBox({
    shinydashboard::valueBox(
      value = tags$p(paste0(if("Premier League" %in% input$choice_league){
        main_eng_data <- main_eng_data %>% filter(lubridate::year(main_eng_data$Date) == '2022')
        yellow_cards <- sum(main_eng_data$HY, na.rm = T) + sum(main_eng_data$AY, na.rm = T)
      } else if("Premier Division" %in% input$choice_league){
        main_spain_data <- main_spain_data %>% filter(lubridate::year(main_spain_data$Date) == '2022')
        yellow_cards <- sum(main_spain_data$HY, na.rm = T) + sum(main_spain_data$AY, na.rm = T)
      } else if("Ligue 1" %in% input$choice_league){
        main_france_data <- main_france_data %>% filter(lubridate::year(main_france_data$Date) == '2022')
        yellow_cards <- sum(main_france_data$HY, na.rm = T) + sum(main_france_data$AY, na.rm = T)
      } else if("Bundesliga" %in% input$choice_league){
        main_germany_data <- main_germany_data %>% filter(lubridate::year(main_germany_data$Date) == '2022')
        yellow_cards <- sum(main_germany_data$HY, na.rm = T) + sum(main_germany_data$AY, na.rm = T)
        
      }
      ), style = 'font-size:100%;'
      ),
      subtitle = "Yellow cards",
      #gradient = T,
      width = 3,
      color = "yellow",
      icon = icon('hand')
    )
  })
  
  output$red_cards <- renderValueBox({
    shinydashboard::valueBox(
      value = tags$p(paste0(if("Premier League" %in% input$choice_league){
        main_eng_data <- main_eng_data %>% filter(lubridate::year(main_eng_data$Date) == '2022')
        red_cards <- sum(main_eng_data$HR, na.rm = T) + sum(main_eng_data$AR, na.rm = T)
      } else if("Premier Division" %in% input$choice_league){
        main_spain_data <- main_spain_data %>% filter(lubridate::year(main_spain_data$Date) == '2022')
        scored_goals <- sum(main_spain_data$HR, na.rm = T) + sum(main_spain_data$AR, na.rm = T)
      } else if("Ligue 1" %in% input$choice_league){
        main_france_data <- main_france_data %>% filter(lubridate::year(main_france_data$Date) == '2022')
        red_cards <- sum(main_france_data$HR, na.rm = T) + sum(main_france_data$AR, na.rm = T)
      } else if("Bundesliga" %in% input$choice_league){
        main_germany_data <- main_germany_data %>% filter(lubridate::year(main_germany_data$Date) == '2022')
        red_cards <- sum(main_germany_data$HR, na.rm = T) + sum(main_germany_data$AR, na.rm = T)
        
      }
      ), style = 'font-size:100%;'
      ),
      subtitle = "Red cards",
      width = 3,
      color = "red",
      icon = icon('hand')
    )
  })
  
  ### Premier league part ###
  #Main table with all data for premier league
  output$premier_league_data <- main_pl_tab
  #Fixed matches in premier league data
  output$premier_league_fixes <- fixes_pl_tab
  
  observeEvent(input$select_button_pl, {
    showModal(modalDialog(
      title = "Somewhat important message",
      "This is a somewhat important message.",
      easyClose = TRUE,
      footer = NULL
    ))
  })
  #More detail stats for premier league matches
  output$premier_league_stats <- stats_pl_tab
  #More details on referees stats premier league matches
  output$pl_referees_tab <- pl_referees_tab
  #Referees summary
  output$pl_referees_summary <- pl_referees_summary
  observeEvent(input$select_button_pl_referees, {
    showModal(modalDialog(
      title = "Somewhat important message",
      "This is a somewhat important message.",
      easyClose = TRUE,
      footer = NULL
    ))
  })
  ### Premier Divison part ###
  output$premier_divison_data <- main_pd_tab
  ### Ligue 1 part ###
  output$ligue_1_data <- main_l1_tab
  ### Bundesliga part ###
  output$bundesliga_data <- main_bl_tab
  

})
