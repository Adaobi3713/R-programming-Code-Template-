library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)

#Recoding a value (changing the of a values)
df %>% mutate(Level_of_Education = recode(Level_of_Education, 
                                          SECONDARY = "S", 
                                          TERTIARY = "T"))