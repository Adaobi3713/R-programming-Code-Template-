library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)

#bar chart with ggplot
df %>% 
  ggplot(aes(x = MARRITAL_STATUS)) + 
  geom_bar(stat = "count", color = "black", fill = "darkblue") + 
  labs(title = "Distribution of Marrital Status", x = "Marrital Status", y = "Count") + 
  geom_text(aes(label = paste0(round((..count.. / sum(..count..)) * 100), "%")), stat = "count", vjust = -0.5) + 
  theme_classic()



#bar with sjplot
df %>% 
  sjPlot::plot_frq(TIME_CATEGORY, title = 'freq distribution of
Time category', 
                   sort.frq = 'desc', 
                   geom.colors = 'blue'
  )
