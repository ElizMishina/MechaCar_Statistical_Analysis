# segment 1
library(dplyr)
mechafile <- read.csv('MechaCar_mpg.csv')
View(mechafile)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechafile)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechafile))

# segment 2
suspenstionfile <- read.csv('Suspension_Coil.csv')
View(suspenstionfile)
total_summary <- suspenstionfile %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI),.groups = 'keep')
lot_summary <- suspenstionfile %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI, na.rm = TRUE),.group ='keep')

# segment 3
test_table <- suspenstionfile %>% sample_n(50)

t.test((test_table$PSI), mu=mean(suspenstionfile$PSI))

t.test(subset(suspenstionfile$PSI, suspenstionfile$Manufacturing_Lot == "Lot1"),suspenstionfile$PSI)

t.test(subset(suspenstionfile$PSI, suspenstionfile$Manufacturing_Lot == "Lot2"),suspenstionfile$PSI)

t.test(subset(suspenstionfile$PSI, suspenstionfile$Manufacturing_Lot == "Lot3"),suspenstionfile$PSI)
