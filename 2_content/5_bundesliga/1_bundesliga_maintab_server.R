main_bl_tab <- DT::renderDataTable({
  
  main_bl_tab <- main_germany_data %>% filter(Div == "D1")
  
})