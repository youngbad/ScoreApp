library(dplyr)
library(tidyverse)
library(lubridate)


pl_2019_2020 <- read_csv("C:/Users/jakub/OneDrive/Pulpit/łamapka/lamapka/data/england/premier_league/pl_2019_2020.csv", na = "NA")
pl_2020_2021 <- read_csv("C:/Users/jakub/OneDrive/Pulpit/łamapka/lamapka/data/england/premier_league/pl_2020_2021.csv", na = "NA")
pl_2021_2022 <- read_csv("C:/Users/jakub/OneDrive/Pulpit/łamapka/lamapka/data/england/premier_league/pl_2021_2022.csv", na = "NA")

pl_2019_2022 <- rbind(pl_2019_2020, pl_2020_2021, pl_2021_2022)

main_pl_tab <- pl_2019_2022 %>% select(
  "Data" = Date,"Gospodarze" = HomeTeam, "Goście" = AwayTeam, "Rezultat FT" = FTR,
  "Rezultat HT" = HTR, "Sędzia" =  Referee, "Rezultat" = FTR
)




main_pl_tab <- main_pl_tab %>% mutate(`FT / HT` =
                                        if_else(`Rezultat FT` == "H" & `Rezultat HT` == "H", "1/1", if_else(
                                          `Rezultat FT` == "H" & `Rezultat HT` == "A", "2/1", if_else(
                                            `Rezultat FT` == "A" & `Rezultat HT` == "A"," 2/2", if_else(
                                              `Rezultat FT` == "A" & `Rezultat HT` == "H", "1/2", if_else(
                                                `Rezultat FT` == "D" & `Rezultat HT` == "H", '1/x', if_else(
                                                  `Rezultat FT` == "D" & `Rezultat HT` == "A", "2/x", if_else(
                                                    `Rezultat FT` == "D" & `Rezultat HT` == "D", "x/x", if_else(
                                                      `Rezultat FT` == "H" & `Rezultat HT` =="D", "x/1", if_else(
                                                        `Rezultat FT` == "A" & `Rezultat HT` == "D", "x/2", NULL
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        ) ) 
)

main_pl_tab$Rezultat <- if_else(main_pl_tab$Rezultat == "H", main_pl_tab$Gospodarze, if_else(
  main_pl_tab$Rezultat == "A", main_pl_tab$Goście, 'Remis'
)
)

main_pl_tab$`Rezultat HT` <- if_else(main_pl_tab$`Rezultat HT` == "H", main_pl_tab$Gospodarze, if_else(
  main_pl_tab$`Rezultat HT` == "A", main_pl_tab$Goście, 'Remis'
)
)

main_pl_tab$`Rezultat FT` <- if_else(main_pl_tab$`Rezultat FT` == "H", main_pl_tab$Gospodarze, if_else(
  main_pl_tab$`Rezultat FT` == "A", main_pl_tab$Goście, 'Remis'
)
)

saveRDS(main_pl_tab, file = 'data/main_pl_tab.rds')
