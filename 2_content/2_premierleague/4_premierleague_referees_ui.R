pl_referees_ui <- tabItem(tabName = "referees_pl",
                          tabsetPanel(
                            tabPanel("Referees All Data",
                                     fluidRow(
                                       DT::dataTableOutput('pl_referees_tab')
                                            )
                                     ),
                            tabPanel("Referees summary",
                                     fluidRow(
                                       DT::dataTableOutput('pl_referees_summary')
                                     ))
                          )
        
)