library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)
View(df)
#Renaming a value
df %>% rename(serial_Number = sn)

#filtering a value 

df %>% filter(cut == "Good") #single filter

#Multiple filter
df %>% filter(cut %in% c("Good", "Very Good", "Ideal"))
df %>% filter(cut %in% c("Good", "Very Good"))

#Recoding a value (changing the of a values)
df %>% mutate(Level_of_Education = recode(Level_of_Education, SECONDARY = "S", 
              TERTIARY = "T"))

#adding a new column into you data set like age category or BMI category
df %>% 
  mutate(BMI_cat = case_when(
    BMI < 18.5 ~ "Underweight",
    BMI >= 18.5 & BMI <= 24.9 ~ "Normal weight",
    BMI >= 25.0 & BMI <= 29.9 ~ "Overweight",
    BMI > 30 ~ "Obese"
  ))


#changing a logical factor (false and true)