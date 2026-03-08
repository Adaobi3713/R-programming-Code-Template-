library(sjPlot)
library(tidyverse)
library(gtsummary)
st
tab_xtab(var.row = st$gender,
         var.col = st$lunch,
         show.row.prc = T)
df%>% 
  select(group, BMI_cat) %>% 
 tbl_cross(row = group,#Independent for percent
          col = BMI_cat, #dependent
          percent = "row",
          margin = "column",
          missing = "no") %>% 
  add_p() %>% bold_labels() %>% 
  as_flex_table()
?sjplot
