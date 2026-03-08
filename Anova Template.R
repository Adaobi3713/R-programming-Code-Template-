library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(readxl)
#Anova test
df %>% 
  select(duration_minutes, type_anaesthesia) %>% 
  tbl_summary(
    by = type_anaesthesia,
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous() ~ "{mean} ({sd})"
    ),
    label = list(
      duration_minutes ~ "Duration in minutes"
    ),
    missing = "no"  # <-- Add this line to ignore missing values
  ) %>%
  add_p() %>% 
  bold_labels() %>%
  as_flex_table()