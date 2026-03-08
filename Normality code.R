library(tidyverse)
library(ggplot2)
library(gt)
library(flextable)
library(gtsummary)
library(dlookr)
library(sjPlot)
View(StudentsPerformance_original)
#normality test: 

shapiro.test(st$`math score`)

df%>% 
  filter(gender == "male")
shapiro.test(genderm$`math score`)
df %>% 
  select(`writing score`, `reading score`, `math score`)
shapiro.test(st2$`writing score`)

shapiro.test(st2$`writing score`, st2$`reading score`, st2$`math score`)

#histogram
sjPlot::plot_frq(st, lunch, title = 'freq distribution of lunch',
                 sort.frq = 'desc',
                 geom.colors = 'blue')