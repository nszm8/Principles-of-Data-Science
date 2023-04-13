library(tidyverse)
library(boot)
#clean data
raw_diabetes_data <- read.csv("/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment2/raw_data/diabetes.csv")
diabetes <- na.omit(raw_diabetes_data)
write.csv(clean_data, "/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment2/clean_data/diabetes.csv")

set.seed(125)
sample <- diabetes[sample(nrow(diabetes), 25, replace = FALSE), ]
sample_mean_glucose <- mean(sample$Glucose)
sample_highest_glucose <- max(sample$Glucose)
population_mean_glucose <- mean(diabetes$Glucose)
population_highest_glucose <- max(diabetes$Glucose)

#Comparison using barplot
stat_comp <- c(population_mean_glucose, sample_mean_glucose, population_highest_glucose, sample_highest_glucose)
names(stat_comp) <- c("P.Mean", "S.Mean", "P.High", "S.High")
barplot(stat_comp, main="Glucose Statistics", ylab="Glucose", col=c("Red", "Green", "Red", "Green"), ylim=c(0, 200))




