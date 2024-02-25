library(rvest)
library(stringr)
library(Hmisc)
library(fresh)
library(dplyr)
library(tidyverse)
library(lubridate)
library(DT)
library(tibble)

### Very basic web scrapping method for football data from https://www.football-data.co.uk/
### Version date as of: 27/01/2023

page <- read_html("https://www.football-data.co.uk/")
league_sites <- tibble()


league_sites <- page %>%
  html_nodes("a") %>%       # find all links
  html_attr("href") %>%     # get the url
  str_subset("\\.php") #%>% # find those that end in php

league_sites <- league_sites[c(41:62,65:96)]

csv_links <- tibble()
league_sites <- unique(league_sites)


for(link in league_sites){
  
  page_csv <- read_html(link)
  
  csv <- page_csv %>%
    html_nodes("a") %>%       # find all links
    html_attr("href") %>%     # get the url
    str_subset("\\.csv") #%>% # find those that end in csv
  
  
  csv <- tibble(csv, link)
  csv_links <- bind_rows(csv_links, csv)
}

eng_links <- csv_links[grepl('england', csv_links$link), 'csv']
germany_links <- csv_links[grepl('germany', csv_links$link), 'csv']
spain_links <- csv_links[grepl('spain', csv_links$link), 'csv']
italy_links <- csv_links[grepl('italy', csv_links$link), 'csv']
france_links <-  csv_links[grepl('france', csv_links$link), 'csv']


### ENGLAND ###
main_eng_data <-tibble()

for(link in eng_links$csv){
  print(link)
  link_to_read <- link
  X <- read.csv2(paste0('https://www.football-data.co.uk/',link_to_read), sep = ',', fileEncoding="latin1")
 
  main_eng_data_t <- bind_rows(main_eng_data, a)
  
}
### GERMANY ###
main_germany_data <- tibble()
for(link in germany_links$csv){
  
  link_to_read <- link
  X <- read.csv(paste0('https://www.football-data.co.uk/',link_to_read))
  
  main_germany_data <- bind_rows(main_germany_data, X)
}
### SPAIN ###
#check the error while combine X, and dataset
#Error: Can't combine `..1$BbAHh` <double> and `..2$BbAHh` <character>.
main_spain_data <- tibble()
for(link in spain_links$csv){
  
  link_to_read <- link
  X <- read.csv(paste0('https://www.football-data.co.uk/',link_to_read))
  
  main_spain_data <- bind_rows(main_spain_data, X)
}
### FRANCE ###
main_france_data <- tibble()
for(link in france_links$csv){
  
  link_to_read <- link
  X <- read.csv(paste0('https://www.football-data.co.uk/',link_to_read))
  
  main_france_data <- bind_rows(main_france_data, X)
}

### Additional columns
main_eng_data <- main_eng_data %>% mutate(`FT / HT` =
                                             if_else(`FTR` == "H" & `HTR` == "H", "1/1", if_else(
                                               `FTR` == "H" & `HTR` == "A", "2/1", if_else(
                                                 `FTR` == "A" & `HTR` == "A"," 2/2", if_else(
                                                   `FTR` == "A" & `HTR` == "H", "1/2", if_else(
                                                     `FTR` == "D" & `HTR` == "H", '1/x', if_else(
                                                       `FTR` == "D" & `HTR` == "A", "2/x", if_else(
                                                         `FTR` == "D" & `HTR` == "D", "x/x", if_else(
                                                           `FTR` == "H" & `HTR` =="D", "x/1", if_else(
                                                             `FTR` == "A" & `HTR` == "D", "x/2", NA
                                                           )
                                                         )
                                                       )
                                                     )
                                                   )
                                                 )
                                               )
                                             ),
                                           )
)

main_france_data <- main_france_data %>% mutate(`FT / HT` =
                                          if_else(`FTR` == "H" & `HTR` == "H", "1/1", if_else(
                                            `FTR` == "H" & `HTR` == "A", "2/1", if_else(
                                              `FTR` == "A" & `HTR` == "A"," 2/2", if_else(
                                                `FTR` == "A" & `HTR` == "H", "1/2", if_else(
                                                  `FTR` == "D" & `HTR` == "H", '1/x', if_else(
                                                    `FTR` == "D" & `HTR` == "A", "2/x", if_else(
                                                      `FTR` == "D" & `HTR` == "D", "x/x", if_else(
                                                        `FTR` == "H" & `HTR` =="D", "x/1", if_else(
                                                          `FTR` == "A" & `HTR` == "D", "x/2", NA
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          ) )
                                        
                                        
)

main_germany_data <- main_germany_data %>% mutate(`FT / HT` =
                                                  if_else(`FTR` == "H" & `HTR` == "H", "1/1", if_else(
                                                    `FTR` == "H" & `HTR` == "A", "2/1", if_else(
                                                      `FTR` == "A" & `HTR` == "A"," 2/2", if_else(
                                                        `FTR` == "A" & `HTR` == "H", "1/2", if_else(
                                                          `FTR` == "D" & `HTR` == "H", '1/x', if_else(
                                                            `FTR` == "D" & `HTR` == "A", "2/x", if_else(
                                                              `FTR` == "D" & `HTR` == "D", "x/x", if_else(
                                                                `FTR` == "H" & `HTR` =="D", "x/1", if_else(
                                                                  `FTR` == "A" & `HTR` == "D", "x/2", NA
                                                                )
                                                              )
                                                            )
                                                          )
                                                        )
                                                      )
                                                    )
                                                  ) )
                                                
                                                
)

main_spain_data <- main_spain_data %>% mutate(`FT / HT` =
                                                    if_else(`FTR` == "H" & `HTR` == "H", "1/1", if_else(
                                                      `FTR` == "H" & `HTR` == "A", "2/1", if_else(
                                                        `FTR` == "A" & `HTR` == "A"," 2/2", if_else(
                                                          `FTR` == "A" & `HTR` == "H", "1/2", if_else(
                                                            `FTR` == "D" & `HTR` == "H", '1/x', if_else(
                                                              `FTR` == "D" & `HTR` == "A", "2/x", if_else(
                                                                `FTR` == "D" & `HTR` == "D", "x/x", if_else(
                                                                  `FTR` == "H" & `HTR` =="D", "x/1", if_else(
                                                                    `FTR` == "A" & `HTR` == "D", "x/2", NA
                                                                  )
                                                                )
                                                              )
                                                            )
                                                          )
                                                        )
                                                      )
                                                    ) )
                                                  
                                                  
)



main_eng_data$Date <- as.Date(main_eng_data$Date, "%d/%m/%Y")
main_france_data$Date <- as.Date(main_france_data$Date, "%d/%m/%Y")
main_germany_data$Date <- as.Date(main_germany_data$Date, "%d/%m/%Y")
main_spain_data$Date <- as.Date(main_spain_data$Date, "%d/%m/%Y")

### Save uploaded data
saveRDS(unique(main_eng_data), "data/main_eng_data.rds")
saveRDS(unique(main_france_data), "data/main_france_data.rds")
saveRDS(unique(main_germany_data), "data/main_germany_data.rds")
saveRDS(unique(main_spain_data), "data/main_spain_data.rds")
