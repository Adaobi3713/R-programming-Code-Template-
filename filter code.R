library(gt)
library(tidyverse)
library(gtsummary)
library(labeling)
library(flextable)
library(dplyr)
library(dlookr)
ot %>% filter(MULTIPLE_METS == "Present") %>% select(OUTCOME) %>%
  tbl_summary(missing_text = "Data not available") %>%
  as_flex_table() # filter code