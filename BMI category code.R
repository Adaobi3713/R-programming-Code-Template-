library(tidyverse)
library(gtsummary)
library(ggplot2)
library(dplyr)
library(dlookr)
library(flextable)
names(d)
hm <- read_excel("heavy metal data cleaned.xlsx") %>% 
  mutate(BMI_cat = case_when(
    BMI < 18.5 ~ "Underweight",
    BMI >= 18.5 & BMI <= 24.9 ~ "Normal weight",
    BMI >= 25.0 & BMI <= 29.9 ~ "Overweight",
    BMI > 30 ~ "Obese"
  )) %>% 
  view()

ds1 %>% select(Age_cat, group) %>% 
  tbl_cross(row = Age_cat, 
            col = group,
            percent = "row",
            margin = "column",
            missing = "no"
  ) %>% 
  add_p() %>% 
  bold_labels() %>% 
  bold_levels() %>% as_flex_table()
write.csv(hm,file = "hm.csv")
