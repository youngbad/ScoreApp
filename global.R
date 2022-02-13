library(shiny)
library(bs4Dash)
library(fresh)
library(dplyr)
library(tidyverse)
library(lubridate)
library(DT)

# create the theme with a cyberpunk color palette
theme <- create_theme(
  bs4dash_vars(
    navbar_light_color = "#bec5cb",
    navbar_light_active_color = "#FFF",
    navbar_light_hover_color = "#FFF"
  ),
  bs4dash_yiq(
    contrasted_threshold = 10,
    text_dark = "#FFF",
    text_light = "#272c30"
  ),
  bs4dash_layout(
    main_bg = "#353c42"
  ),
  bs4dash_sidebar_light(
    bg = "#272c30",
    color = "#bec5cb",
    hover_color = "#FFF",
    submenu_bg = "#272c30",
    submenu_color = "#FFF",
    submenu_hover_color = "#FFF"
  ),
  bs4dash_status(
    primary = "#5E81AC", danger = "#BF616A", light = "#272c30"
  ),
  bs4dash_color(
    gray_900 = "#FFF", white = "#272c30"
  )
)

# create tribble for box global config
box_config <- tibble::tribble(
  ~background, ~labelStatus,
  "danger", "warning",
  "purple", "success",
  "success", "primary",
  "warning", "danger",
  "fuchsia", "info"
)

# box factory function
box_factory <- function(background, labelStatus) {
  box(
    title = "Cyberpunk Box",
    collapsible = TRUE,
    background = background,
    height = "200px",
    label = boxLabel(1, labelStatus)
  )
}

# pmap magic
boxes <- purrr::pmap(box_config, box_factory)


# READ DATA
main_pl_tab <- readRDS('data/main_pl_tab.rds')
