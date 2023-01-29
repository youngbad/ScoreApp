#### READING DATA ####
### England Data ####
main_eng_data <- readRDS('data/main_eng_data.rds')
main_eng_data$Date <- as.Date(main_eng_data$Date, '%d/%m/%Y')
### France Data ####
main_france_data <- readRDS('data/main_france_data.rds')
main_france_data$Date <- as.Date(main_france_data$Date, '%d/%m/%Y')
### Germany Data ####
main_germany_data <- readRDS('data/main_germany_data.rds')
main_germany_data$Date <- as.Date(main_germany_data$Date, '%d/%m/%Y')
### Spain Data ####
main_spain_data <- readRDS('data/main_spain_data.rds')
main_spain_data$Date <- as.Date(main_spain_data$Date, '%d/%m/%Y')