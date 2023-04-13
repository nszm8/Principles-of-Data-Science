# Calculating 98th percentile of BMI for the population
population_percentile <- quantile(clean_diabetes_data$BMI, 0.98)

# Sample 50 patients from the data and calculate their 98th percentile of BMI
set.seed(125)
sample_data <- diabetes[sample(nrow(diabetes), 50), ]
sample_percentile <- quantile(sample$BMI, 0.98)

# Create a histogram of BMI for the population and highlight the 98th percentile
hist(diabetes$BMI, main="BMI Distribution in Population", xlab="BMI",col="yellow",border = "blue")
abline(v=population_percentile, col="brown",)
legend("topright", legend=c("98th percentile"), col="red", lty=2)

# Create a histogram of BMI for the sample and highlight the 98th percentile
hist(sample$BMI, main="BMI Distribution in Sample", xlab="BMI",col="skyblue",border = "red")
abline(v=sample_percentile, col="brown")
legend("topright", legend=c("98th percentile"), col="red", lty=2)


