# Setting the random seed for reproducibility
set.seed(25)
n_samples <- 500
n_samples_size <- 150
for (i in 1:n_samples_size) {
  sample_indices <- sample(nrow(diabetes), size = n_samples, replace = TRUE)
  sample_data <- diabetes[sample_indices, ]
}
# Calculating the mean,sd&percentile of blood pressure from sample data
BloodPressure_Mean_Sample <- mean(sample$BloodPressure)
BloodPressure_Mean_Sample

BloodPressure_Sd_Sample <- sd(sample$BloodPressure)
BloodPressure_Sd_Sample

BloodPressure_Percentile_Sample <- quantile(sample$BloodPressure, 0.98)
BloodPressure_Percentile_Sample

# Calculating the mean,sd&percentile of blood pressure from sample data
BloodPressure_Mean_Population <- mean(diabetes$BloodPressure)
BloodPressure_Mean_Population

BloodPressure_Sd_Population <- sd(diabetes$BloodPressure)
BloodPressure_Sd_Population

BloodPressure_Percentile_Population <- quantile(diabetes$BloodPressure, 0.98)
BloodPressure_Percentile_Population

#comparisons of statistics between mean of BloodPressure sample and population data

count_value <- c(BloodPressure_Mean_Sample, BloodPressure_Mean_Population)
count_value
label_value <- c("Sample", "Population")
barplot(count_value, names.arg = label_value, main="Comparision of Mean of Blood Pressure",
        xlab="Average", ylab = "Count", col=c("red","green"))
legend("topright", legend = labels, cex = 0.8, fill = c("red","green"))

#It is observed that mean of BloodPressure of population is higher than mean of Blood Pressure of Sample

count_value <- c(BloodPressure_Sd_Sample, BloodPressure_Mean_Population)
count_value
library (formattable)
library(scales)
percentages <- percent(counts/sum(counts))
pie(count_value, labels = label_value, main = "Comparision of Mean of Blood Pressure", col=c("red","green"))
legend("topright", legend = labels, cex = 0.8, fill = c("red","green"))

#comparisons of statistics between sd of BloodPressure sample and population data

count_value <- c(BloodPressure_Sd_Sample, BloodPressure_Sd_Population)
count_value
labels <- c("Sample", "Population")
barplot(count_value, names.arg = label_value, main="Comparision of Standard Deviation of Blood Pressure",
        xlab="Standard Deviation", ylab = "Count", col=c("pink","blue"))
legend("topright", legend = labels, cex = 0.8, fill = c("pink","blue"))

#It is observed that Sd of Blood Pressure of population is higher than sd of Blood Pressure of Sample

count_value <- c(BloodPressure_Sd_Sample, BloodPressure_Sd_Population)
count_value
percentages <- percent(counts/sum(counts))
pie(count_value, labels = label_value, main = "Comparision of Standard Deviation of Blood Pressure", col=c("pink","blue"))
legend("topright", legend = labels, cex = 0.8, fill = c("pink","blue"))

#comparisons of statistics between percentile of BloodPressure sample and population data

count_value <- c(BloodPressure_Percentile_Sample, BloodPressure_Percentile_Population)
count_value
label_value <- c("Sample", "Population")
barplot(count_value, names.arg = label_value, main="Comparision of Percentile of Blood Pressure",
        xlab="Percentile", ylab = "Count", col=c("yellow","brown"))
legend("topright", legend = labels, cex = 0.8, fill = c("yellow","brown"))

#It is observed that percentile of Blood Pressure of population is higher than percentile of Blood Pressure of Sample

count_value <- c(BloodPressure_Percentile_Sample, BloodPressure_Percentile_Population)
count_value
percentages <- percent(counts/sum(counts))
pie(count_value, labels = label_value, main = "Comparision of Percentile of Blood Pressure", col=c("yellow","brown"))
legend("topright", legend = labels, cex = 0.8, fill = c("yellow","brown"))





