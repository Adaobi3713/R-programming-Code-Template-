library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)
#mutate with rename and recode a value
mutate(gender = recode(gender,
                       masculine = "M",
                       feminine = "F"))
