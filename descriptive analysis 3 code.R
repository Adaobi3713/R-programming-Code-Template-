library(tidyverse)
library(ggplot2)
library(gt)
library(flextable)
library(gtsummary)
library(dlookr)
library(sjPlot)
View(StudentsPerformance_original)
st <- StudentsPerformance_original
names(st)
st3 <- st %>% select(`writing score`,`math score`, `reading score`, gender, lunch,
              `parental level of education`, `test preparation course`, `race/ethnicity`)
st3 %>%
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous() ~ "{mean} ({sd})")) %>%
  bold_labels() %>% 
  as_flex_table()   

