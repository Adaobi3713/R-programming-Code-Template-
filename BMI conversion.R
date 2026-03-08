library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)
#code on how to calculate BMI
mutate(BMI = Weight / height^2)

#Renaming 
mutate(size = height > 1 & weight > 75, 
       size = if_else(size == TRUE, "big", "small"))