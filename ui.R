ui = dashboardPage(
        header = dashboardHeader(
            title = dashboardBrand(
                title = "Score App",
                color = "primary",
                image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
            ),
            leftUi = dropdownMenu(
                type = "messages",
                badgeStatus = "success",
                messageItem(
                    from = "Admin",
                    message = "Hi, enjoy the app!",
                    time = "15 mins"
                ),
                messageItem(
                    from = "Support Team",
                    message = "This is the content of another message.",
                    time = "2 hours"
                )
            )
        ),
        sidebar = dashboardSidebar(
            sidebarMenu(
                menuItem(
                        "Home",
                        tabName = 'home_tab'
                ),
                menuItem(
                    "England",
                    tabName = "england",
                    icon = icon("futbol"),
                    menuItem('Premier League',
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
        ),
        body = dashboardBody(
            tabItems(
                    tabItem(tabName = 'main_tab_pl',
                            fluidRow(
                                 DT::dataTableOutput('premier_league_data')
                            )
                            ),
                    tabItem(tabName = "fixes_pl",
                            fluidRow(
                                    DT::dataTableOutput('premier_league_fixes')
                            )
                            ),
                    tabItem(tabName = "match_stats_pl",
                            fluidRow(
                                    div(paste0('In progress...')),
                                    DT::dataTableOutput('premier_league_stats')
                            )
                            ),
                    tabItem(tabName = "referees_pl",
                            fluidRow(
                              div(paste0('In progress...'))
                             
                            )
                    ),
                    tabItem(tabName = 'main_tab_pd',
                            fluidRow(
                              DT::dataTableOutput('premier_divison_data')
                            )
                    ),
                    tabItem(tabName = "fixes_pd",
                            fluidRow(
                              div(paste0('In progress...'))
                              #DT::dataTableOutput('x')
                            )
                    ),
                    tabItem(tabName = "match_stats_pd",
                            fluidRow(
                              div(paste0('In progress...')),
                              #DT::dataTableOutput('x2')
                            )
                    ),
                    tabItem(tabName = "referees_pd",
                            fluidRow(
                              div(paste0('In progress...'))
                              
                            )
                    ),
                    tabItem(tabName = 'main_tab_l1',
                            fluidRow(
                              DT::dataTableOutput('ligue_1_data')
                            )
                    ),
                    tabItem(tabName = "fixes_l1",
                            fluidRow(
                              div(paste0('In progress...'))
                              #DT::dataTableOutput('x')
                            )
                    ),
                    tabItem(tabName = "match_stats_l1",
                            fluidRow(
                              div(paste0('In progress...')),
                              #DT::dataTableOutput('x2')
                            )
                    ),
                    tabItem(tabName = "referees_l1",
                            fluidRow(
                              div(paste0('In progress...'))
                              
                            )
                    ),
                    tabItem(tabName = 'main_tab_bl',
                            fluidRow(
                              DT::dataTableOutput('bundesliga_data')
                            )
                    ),
                    tabItem(tabName = "fixes_bl",
                            fluidRow(
                              div(paste0('In progress...'))
                              #DT::dataTableOutput('x')
                            )
                    ),
                    tabItem(tabName = "match_stats_bl",
                            fluidRow(
                              div(paste0('In progress...')),
                              #DT::dataTableOutput('x2')
                            )
                    ),
                    tabItem(tabName = "referees_bl",
                            fluidRow(
                              div(paste0('In progress...'))
                              
                            )
                    )
            )
        ),
        controlbar = dashboardControlbar(
            collapsed = TRUE,
            div(class = "p-3", skinSelector()),
            pinned = FALSE
        ),
        title = "Skin Selector"
    )