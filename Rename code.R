library(tidyverse)
library(ggplot2)
diamonds
d <- diamonds
d1 <- d %>%
  rename(colour = color)
d %>% mutate(lenth_cm = x*10)%>% view()


starwars
ar <- starwars
ar1 <- ar %>%
  rename(weight = mass)