t_test_BMI_Frailty <- with(clean_yield_data, t.test(clean_yield_data$BMI  ~ clean_yield_data$Frailty))
capture.output(t_test_BMI_Frailty, file = "Desktop/Spring'23/PDS/Assignment1/Question1_project/results/test_results_BMI_Frailty.txt")

t_test_Age_Frailty <- with(clean_yield_data, t.test(clean_yield_data$Age ~ clean_yield_data$Frailty))
capture.output(t_test_Age_Frailty, file = "Desktop/Spring'23/PDS/Assignment1/Question1_project/results/test_results_Age_Frailty.txt")

t_test_GripStrength_Age <- with(clean_yield_data, t.test(clean_yield_data$`Grip Strength`, clean_yield_data$Age))
capture.output(t_test_GripStrength_Age, file = "Desktop/Spring'23/PDS/Assignment1/Question1_project/results/test_results_GripStrength_Age.txt")

t_test_BMI_Age <- with(clean_yield_data, t.test(clean_yield_data$BMI, clean_yield_data$Age))
capture.output(t_test_BMI_Age, file = "Desktop/Spring'23/PDS/Assignment1/Question1_project/results/test_results_BMI_Age.txt")
