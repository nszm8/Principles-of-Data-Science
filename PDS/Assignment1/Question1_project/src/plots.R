library(readr)
library(magrittr)
library(ggplot2)

clean_yield_data <- read_csv("Desktop/Spring'23/PDS/Assignment1/Question1_project/data_clean/clean_yield_data.csv")
attach(clean_yield_data)

plot(Age,BMI,xlab="Age",ylab="BMI",main = "Age vs BMI", type = "o")
plot(BMI,type = "o",ylab = "BMI")

lbl <- c(0,18.5,24.9,39.9,Inf)
cols <- c("darkred","darkgreen","red","green")[findInterval(clean_yield_data$BMI, vec=lbl)]
barplot(BMI,col = cols)
barplot(Frailty.binary,col = "lightblue")

pairs(~Age+`Grip Strength`,data = clean_yield_data, col = "darkred")
pairs(~BMI+`Grip Strength`,data = clean_yield_data, col = "darkred")

ggplot(clean_yield_data,aes(x = factor(Age), y = `Grip Strength`)) + geom_bar(stat = "identity")
ggplot(clean_yield_data, aes(x = factor(Age), y = BMI)) + geom_bar(stat = "identity")
ggplot(clean_yield_data, aes(x = BMI, y = Frailty.binary)) + geom_bar(stat = "identity")
ggplot(clean_yield_data, aes(x = factor(Age), y = Frailty.binary)) + geom_bar(stat = "identity")

clean_yield_data %>% 
  ggplot2::ggplot(aes(x = factor(Age), y = BMI,fill=BMI > 18.5)) +
  geom_bar(position = "dodge",
           stat = "identity")+
  scale_fill_manual(values = c("#C00000","#004C99"),
                    labels=c('TRUE'='>18.5','FALSE'='<18.5'))+
  labs(fill='BMI')

clean_yield_data %>% 
  ggplot2::ggplot(aes(x = factor(`Grip Strength`), y = BMI,fill=BMI > 18.5)) +
  geom_bar(position = "dodge",
           stat = "identity")+
  scale_fill_manual(values = c("#C00000","#004C99"),
                    labels=c('TRUE'='Good','FALSE'='Underweight'))+
  labs(fill='BMI')

