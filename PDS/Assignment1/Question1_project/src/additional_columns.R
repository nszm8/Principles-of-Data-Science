library(readr)
raw_yield_data <- read_csv("Desktop/Spring'23/PDS/Assignment1/Question1_project/data_raw/raw_yield_data.csv")
clean_yield_data <- na.omit(raw_yield_data)
write_csv(clean_yield_data,"Desktop/Spring'23/PDS/Assignment1/Question1_project/data_clean/clean_yield_data.csv")
BMI <- clean_yield_data$`Weight (Pounds)`/(clean_yield_data$`Height(inches)`^2)
View(BMI)
BMI <- BMI*703
clean_yield_data$BMI <- BMI
View(clean_yield_data)
Frailty.binary <- as.integer(clean_yield_data$Frailty=="Y")
View(Frailty.binary)
clean_yield_data$Frailty.binary <- Frailty.binary
View(clean_yield_data)
write_csv(clean_yield_data,"Desktop/Spring'23/PDS/Assignment1/Question1_project/data_clean/clean_yield_data.csv")
View(clean_yield_data)
sort_data <- clean_yield_data[order(clean_yield_data$`Height(inches)`),]
write.csv(sort_data, "Desktop/Spring'23/PDS/Assignment1/Question1_project/data_clean/sort_clean_data.csv")
View(sort_data)
