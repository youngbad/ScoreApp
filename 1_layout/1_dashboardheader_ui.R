header <- dashboardHeader(
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
)