library(rvest)
library(stringr)
library(Hmisc)




### England ###

page <- read_html("https://www.football-data.co.uk/englandm.php")
league_sites <- tibble()


league_sites <- page %>%
  html_nodes("a") %>%       # find all links
  html_attr("href") %>%     # get the url
  str_subset("\\.php") #%>% # find those that end in php

league_sites <- as.data.frame(league_sites) %>% distinct()
league_sites <- league_sites[c(39:49,52:69), ]

csv_links <- tibble()

for(link in league_sites){
  
  page_csv <- read_html(link)
  
  csv <- page_csv %>%
    html_nodes("a") %>%       # find all links
    html_attr("href") %>%     # get the url
    str_subset("\\.csv") #%>% # find those that end in csv
  
  
  csv <- tibble(csv)
  csv_links <- bind_rows(csv_links, csv)
}


### add part for each country read find CSV

# X <- read.csv(url("https://www.football-data.co.uk/mmz4281/2122/E0.csv"))
# eng_fb_data <- data_frame(c(colnames_eng_fb_data))    

main_eng_data <-tibble()

# eng_fb_data <- X[0, ]
# rm(X)
# csv_links <- as.data.frame(csv_links)

csv_links <- csv_links[1:635, ]

for (i in length(csv_links$csv)){
  
  link_to_read <- csv_links[i,]
  X <- read.csv(paste0('https://www.football-data.co.uk/',link_to_read))
 
  main_eng_data <- bind_rows(main_eng_data, X)

}

main_eng_data <- eng_fb_data %>% mutate(`FT / HT` =
                                             if_else(`FTR` == "H" & `HTR` == "H", "1/1", if_else(
                                               `FTR` == "H" & `HTR` == "A", "2/1", if_else(
                                                 `FTR` == "A" & `HTR` == "A"," 2/2", if_else(
                                                   `FTR` == "A" & `HTR` == "H", "1/2", if_else(
                                                     `FTR` == "D" & `HTR` == "H", '1/x', if_else(
                                                       `FTR` == "D" & `HTR` == "A", "2/x", if_else(
                                                         `FTR` == "D" & `HTR` == "D", "x/x", if_else(
                                                           `FTR` == "H" & `HTR` =="D", "x/1", if_else(
                                                             `FTR` == "A" & `HTR` == "D", "x/2", NULL
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

saveRDS(main_eng_data, "data/main_eng_data.rds")


    
  

                
                