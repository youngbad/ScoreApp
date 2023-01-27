main_l1_tab <- DT::renderDataTable({
  
  main_l1_tab <- main_france_data %>% filter(Div == "F1")
  
})