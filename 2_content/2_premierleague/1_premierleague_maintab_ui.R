pl_maintab_ui <-tabItem(tabName = 'main_tab_pl',
        fluidRow(
          DT::dataTableOutput('premier_league_data')
        )
)
