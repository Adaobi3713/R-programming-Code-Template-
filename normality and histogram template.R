library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)
df %>% select(PSA) %>% normality() %>% as_flextable()
mean(df$PSA)

sjPlot::plot_frq(df$PSA, type = 'h',
                 show.mean = TRUE,
                 normal.curve = TRUE,
                 normal.curve.color = 'red',
                 normal.curve.size = 1,
                 normal.curve.alpha = 0.99,
                 show.sd = TRUE,
                 show.mean.val = TRUE)