library(readr)
StudentsPerformance <- read_csv("Desktop/StudentsPerformance.csv")
View(StudentsPerformance)
attach(StudentsPerformance)
boxplot(`writing score`,main="box plot for Writing Score",col="blue")
       