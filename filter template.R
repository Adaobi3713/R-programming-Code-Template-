library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)

diamonds
names(diamonds)
di <- diamonds



#single filter
df %>% filter(cut == "Good")

#Double filter
df1 <- df %>% filter(cut %in% c("Good", "Very Good", "Ideal"))
df2 <- df %>% filter(cut %in% c("Good", "Very Good", "Ideal"))

ot%>% filter(MULTIPLE_METS == "Absent") %>% select(OUTCOME) %>%
  tbl_summary(missing_text = "Data not available") %>%
  bold_labels() %>% as_flex_table()