library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(tbl_summary)
View(df)

{r}
library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(readxl)
library(readxl)
library(readxl)
df <- read_excel("metastasis only-1.xlsx", 
                 na = "99")
df%>%select(AGE, `AGE _ CAT`, 'MARRITAL_STATUS') %>% 
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",
      all_continuous() ~ "{mean} ({sd})"
    ),
    label = list(
      MARRITAL_STATUS ~ "MARRITAL STATUS",
      `AGE _ CAT` ~ "AGE CATEGORY"
    ),
    missing_text = "Non Respondent"
  ) %>%
  bold_labels() %>%
  as_flex_table()   