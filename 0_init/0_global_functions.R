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

### Button in table function
shinyInput <- function(FUN, n, id, ...) {
  
  # for each of n, create a new input using the FUN function and convert
  # to a character
  vapply(seq_len(n), function(i){
    as.character(FUN(paste0(id, i), ...))
  }, character(1))
  
}