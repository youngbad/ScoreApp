main_pd_tab <- DT::renderDataTable({
  
  main_pd_tab <- main_spain_data %>% filter(Div == "SP1")
  
})