source("1_layout/1_dashboardheader_ui.R")
source("1_layout/1_dashboardsidebar_ui.R")
source("1_layout/1_dashboardbody_ui.R")
source("1_layout/1_dashboardcontrolbar_ui.R")

ui = dashboardPage(
        header = header,
        sidebar = sidebar,
        body = body,
        controlbar = controlbar,
        title = "ScoreApp"
    )