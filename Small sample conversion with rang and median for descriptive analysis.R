library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)
library(readxl)
df <- read_excel("Copy of DISSERTATION-UPDATED-1.xlsx", 
                 sheet = "updated Dataset", na = "99")
#median and Range with how to handle small sample data
df %>%
  filter(`GROUP CODE` %in% c("MD", "D")) %>%
  select(ambulation, `APGAR 1`, APGAR5, `maternal respiratory rate`) %>%
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous()  ~ "{median} ({min} - {max})"
    ),
    type = list(
      `APGAR 1` ~ "continuous",
      APGAR5 ~ "continuous",
      `maternal respiratory rate` ~ "continuous"
    ),
    missing = "no"
  ) %>%
  bold_labels() %>%
  as_flex_table()


#mean and SD

df %>%
  filter(`GROUP CODE` %in% c("MD", "D")) %>%
  select(ambulation, `APGAR 1`, APGAR5, `maternal respiratory rate`) %>%
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous()  ~ "{mean} ({sd})"   # Mean (SD) with 1 decimal place
    ),
    type = list(
      `APGAR 1` ~ "continuous",
      APGAR5 ~ "continuous",
      `maternal respiratory rate` ~ "continuous"
    ),
    missing = "no"
  ) %>%
  bold_labels() %>%
  as_flex_table()


ggplot(df, aes(x = `VAS-2`, y = `VAS-4`, color = `GROUP CODE`, group = `GROUP CODE`)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Zinc (Zn) Levels by Copper",
    x = "",
    y = "Zn Level",
    color = "Group"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1),
    plot.title = element_text(face = "bold")
  )