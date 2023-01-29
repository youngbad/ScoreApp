hometab_ui <- tabItem(tabName = 'home_tab',
                      fluidRow(align = 'center',
                               wellPanel(
                                 fluidRow(align="center",
                                          div("ScoreApp - footbal data for 2022", style = 'font-size: 160%; align:center;text-align:center;'))
                                         )
                               ),
                      fluidRow(
                        HTML("<h4>Choose league to see main stats: </h4>"),
                        br()
                       
                      ),
                      fluidRow(
                        column(width = 5,
                               #tags$head(tags$style(HTML(".small-box {height: 130px}"))),
                               verbatimTextOutput("print_select"),
                               box(title = "General summaries",
                                   status = "primary",
                                   collapsible = FALSE,
                                   solidHeader = TRUE,
                                   width = NULL,
                                   height = 300,
                                   pickerInput(
                                     inputId = "choice_league", 
                                     width = NULL,
                                     options = list(style = "btn-success", class="btn-sm"),
                                     multiple = FALSE,
                                     choices = c("Premier League",
                                                 "Premier Division",
                                                 "Ligue 1",
                                                 "Bundesliga"),
                                     selected = "Premier League"
                                   ),
                                   column(12,
                                     fluidRow(
                                       valueBoxOutput("scored_goals", width = 3),
                                       valueBoxOutput("yellow_cards", width = 3),
                                       valueBoxOutput("red_cards", width = 3),
                                       valueBoxOutput("something", width = 3)
                                              )
                                          )
                                      
                                   )
                                 
                               )
                        
                        )
 )
