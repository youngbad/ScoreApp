source('0_init/0_server_reactive_values.R')
source('2_content/2_premierleague/1_premierleague_maintab_server.R')
source('2_content/2_premierleague/2_premierleague_fixes_server.R')
source('2_content/2_premierleague/3_premierleague_matchstats_server.R')
source('2_content/3_premierdivision/1_premierdivision_maintab_server.R')
source('2_content/4_ligue1/1_ligue1_maintab_server.R')
source('2_content/5_bundesliga/1_bundesliga_maintab_server.R')


shinyServer(function(input, output) {
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
  
  ### Premier Divison part ###
  output$premier_divison_data <- main_pd_tab
  ### Ligue 1 part ###
  output$ligue_1_data <- main_l1_tab
  ### Bundesliga part ###
  output$bundesliga_data <- main_bl_tab
  

})
