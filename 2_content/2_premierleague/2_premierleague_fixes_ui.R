pl_fixes_ui <- tabItem(tabName = "fixes_pl",
        fluidRow(
          DT::dataTableOutput('premier_league_fixes')
        )
)