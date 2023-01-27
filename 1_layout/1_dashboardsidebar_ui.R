sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(
      "Home",
      tabName = 'home_tab'
    ),
    menuItem(
      "England",
      tabName = "england",
      icon = icon("futbol"),
      menuItem('Premier League', tabName = 'premierleague',
               menuSubItem("Main table",
                           tabName = "main_tab_pl"),
               menuSubItem("Fixed matches",
                           tabName = "fixes_pl"),
               menuSubItem("Match stats",
                           tabName = 'match_stats_pl'),
               menuSubItem('Referees',
                           tabName = 'referees_pl')
      )
      
    ),
    menuItem(
      "Spain",
      tabName = "spain",
      icon = icon("futbol"),
      menuItem('Premier Division',
               menuSubItem("Main table",
                           tabName = "main_tab_pd"),
               menuSubItem("Fixed matches",
                           tabName = "fixes_pd"),
               menuSubItem("Match stats",
                           tabName = 'match_stats_pd'),
               menuSubItem('Referees',
                           tabName = 'referees_pd')
      )
      
    ),
    menuItem(
      "France",
      tabName = "france",
      icon = icon("futbol"),
      menuItem('Ligue 1',
               menuSubItem("Main table",
                           tabName = "main_tab_l1"),
               menuSubItem("Fixed matches",
                           tabName = "fixes_l1"),
               menuSubItem("Match stats",
                           tabName = 'match_stats_l1'),
               menuSubItem('Referees',
                           tabName = 'referees_l1')
      )
      
    ),
    menuItem(
      "Germany",
      tabName = "germany",
      icon = icon("futbol"),
      menuItem('Bundesliga',
               menuSubItem("Main table",
                           tabName = "main_tab_bl"),
               menuSubItem("Fixed matches",
                           tabName = "fixes_bl"),
               menuSubItem("Match stats",
                           tabName = 'match_stats_bl'),
               menuSubItem('Referees',
                           tabName = 'referees_bl')
      )
      
    )
    
  )
)