library(tidyverse)
library(gtsummary)
library(ggplot2)
library(dplyr)
library(dlookr)
library(flextable)
#with category
hm <- read_excel("heavy metal data cleaned.xlsx") %>% 
  mutate(BMI_cat = case_when(
    BMI < 18.5 ~ "Underweight",
    BMI >= 18.5 & BMI <= 24.9 ~ "Normal weight",
    BMI >= 25.0 & BMI <= 29.9 ~ "Overweight",
    BMI > 30 ~ "Obese"
  ))
#mutate with rename
ir <- iris %>%
  mutate(Size = cut(Sepal.Length,
                    breaks = 3,
                    labels = c("Small", "Medium", "Large")))