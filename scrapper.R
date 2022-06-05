library(rvest)
library(stringr)
library(Hmisc)




### England ###

page <- read_html("https://www.football-data.co.uk/")
league_sites <- tibble()


league_sites <- page %>%
  html_nodes("a") %>%       # find all links
  html_attr("href") %>%     # get the url
  str_subset("\\.php") #%>% # find those that end in php

league_sites <- as.data.frame(league_sites) %>% distinct()
league_sites <- league_sites[c(39:49,52:69), ]

X <- read.csv(url("https://www.football-data.co.uk/mmz4281/2122/E0.csv"))
eng_fb_data <- data_frame(c(colnames_eng_fb_data))    

eng_fb_data <-tibble()
eng_fb_data <- X[0, ]
rm(X)

for (file_name in eng_fb){
  
  link <- paste0("https://www.football-data.co.uk/", file_name)  
  X <- read.csv(url(link))
 
  eng_fb_data <- bind_rows(eng_fb_data, X)

}


saveRDS(eng_fb_data, "data/eng_fb_data.rds")


    
  

                
                