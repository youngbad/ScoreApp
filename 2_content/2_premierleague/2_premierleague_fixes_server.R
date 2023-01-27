fixes_pl_tab <- DT::renderDataTable({
  
  output_table <- fix_pl_tab()
  output_table
},
escape = FALSE,

# turn off row selection otherwise you'll also select that row when you
# click on the actionButton 
selection = 'none'
)



selected_button_value_pl <- eventReactive(input$select_button, {
  # take the value of input$select_button, e.g. "button_1"
  # get the button number (1) and assign to selectedRow
  selectedRow <- as.numeric(strsplit(input$select_button_pl, "_")[[1]][2])
  
  # get the value of the "Name" column in the data.frame for that row
  paste('click on ',df()[selectedRow,"Name"])
})