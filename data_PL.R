library(dplyr)
library(tidyverse)
library(lubridate)


### Everythig below to add server file 
eng_fb_data <- eng_fb_data %>%  select(Date, HomeTeam, AwayTeam, FTR,
                                     HTR, Referee, FTR) %>% 
                               mutate(`FT / HT` =
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


