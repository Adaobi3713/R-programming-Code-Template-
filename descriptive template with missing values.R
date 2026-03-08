library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)

#MISSING VALUES
df %>% select(BMI, Residence) %>% 
  tbl_summary( by = Residence,
               statistic = list(
                 all_categorical() ~ "{n} ({p}%)",
                 all_continuous() ~ "{mean} ({sd})"
               ),
               missing_text = "Non-responders"
  ) %>%
  add_p() %>% 
  bold_labels() %>%
  as_flex_table()

#LABELING 
DF <- read_excel("metastasis only (1).xlsx", 
                 na = "99")
DF %>% select(AGE, AGE_CATEGORY) %>% 
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous() ~ "{mean} ({sd})"
    ),
    label = list(
      AGE_CATEGORY ~ "AGE CATEGORY"
    ),
    missing_text = "Non-responders"
  ) %>%
  bold_labels() %>%
  as_flex_table() 


#WITH DECIMAL PLACES 
df %>%
  select(AGE, 'agecat', 'MARRITAL_STATUS') %>%
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous() ~ "{mean} ({sd})"
    ),
    digits = list(
      all_categorical() ~ 1,
      all_continuous() ~ 2
    ),
    label = list(
      MARRITAL_STATUS ~ "MARRITAL STATUS",
      agecat ~ "AGE CATEGORY"
    ),
    missing_text = "Non-responders"
  ) %>%
  bold_labels() %>%
  as_flex_table()
