library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(readxl)
df %>% select(Zn, group) %>% 
  tbl_summary( by = group,
               statistic = list(
                 all_categorical() ~ "{n} ({p}%)",
                 all_continuous() ~ "{mean} ({sd})"
               ),
               missing_text = "Non-responders"
  ) %>%
  add_p() %>% 
  bold_labels() %>%
  as_flex_table()
