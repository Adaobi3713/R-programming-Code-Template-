library(tidyverse)
library(gtsummary)
library(ggplot2)
library(dplyr)
library(dlookr)
library(flextable)
#with category
ds1 <-ds %>% 
  mutate(Age_cat = case_when(
   AGE <= 20 ~ "<20 years",
   AGE >= 21 & AGE <= 30 ~ "21-30 years",
   AGE >= 31 & AGE <= 40 ~ "31-40",
   AGE >= 41 & AGE <= 50 ~ "41-50",
   AGE >= 51 ~ ">51 years",
  )) %>% view()
write.csv(ds1, file = "ds1.csv")


