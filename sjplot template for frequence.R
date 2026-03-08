library(tidyverse)
library(gtsummary)
library(ggplot2)
library(dplyr)
library(dlookr)
library(flextable)
# sjplot for frequency
ds1 %>% 
  sjPlot::plot_frq(Age_cat, 
                   title = 'Frequency Distribution of Age', 
                   sort.frq = 'desc', 
                   geom.colors = 'dark blue') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ds1 %>% 
  sjPlot::plot_frq(TIME_CATEGORY, 
                   title = 'Frequency Distribution of group', 
                   sort.frq = 'desc', 
                   geom.colors = 'dark blue') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
