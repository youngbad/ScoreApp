ui = dashboardPage(
        header = dashboardHeader(
            title = dashboardBrand(
                title = "Łamapka",
                color = "primary",
                image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
            ),
            leftUi = dropdownMenu(
                type = "messages",
                badgeStatus = "success",
                messageItem(
                    from = "Admin",
                    message = "Siemka, własnie ruszamy z apką, jeśli masz jakieś sugestie to pisz: mail@mail.com.",
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
                        "Strona główna",
                        tabName = 'home_tab'
                ),
                menuItem(
                    "Premier League",
                    tabName = "premier_league",
                    icon = icon("futbol"),
                    menuSubItem("Tabela głowna",
                                tabName = "main_tab"),
                    menuSubItem("Łamaki",
                                tabName = "lamaki_pl"),
                    menuSubItem("Statystyki meczy",
                                tabName = 'statystyki_meczy_pl')
                    
                ),
                menuItem(
                    "inna liga"
                )
            )
        ),
        body = dashboardBody(
            tabItems(
                    tabItem(tabName = 'main_tab',
                            fluidRow(
                                 DT::dataTableOutput('premier_league_data')
                            )
                            ),
                    tabItem(tabName = "lamaki_pl",
                            fluidRow(
                                    textInput("druzyna", "Drużyna: ", placeholder = "podaj nazwe drużyny"),
                                    DT::dataTableOutput('premier_league_lamaki')
                            ))
            )
        ),
        controlbar = dashboardControlbar(
            collapsed = TRUE,
            div(class = "p-3", skinSelector()),
            pinned = FALSE
        ),
        title = "Skin Selector"
    )