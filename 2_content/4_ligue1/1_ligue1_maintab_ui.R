l1_maintab_ui <- tabItem(tabName = 'main_tab_l1',
        fluidRow(
          DT::dataTableOutput('ligue_1_data')
        )
)