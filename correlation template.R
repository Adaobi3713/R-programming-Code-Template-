library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)

#correlation code
cor.test(My_data$Sepal.Length, My_data$Petal.Length, method = "spearman")