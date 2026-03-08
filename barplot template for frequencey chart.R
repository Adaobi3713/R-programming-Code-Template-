library(gt)
library(tidyverse)
library(gtsummary)
library(flextable)
library(dplyr)
library(ggplot2)
library(sjPlot)
barplot(table(ds$PROCEDURE), 
        main = "Frequency Distribution of Procedure", 
        xlab = "", 
        ylab = "Frequency", 
        las = 2, 
        col = "darkblue", 
        border = "black", 
        cex.names = 0.5)

#bar plot template
barplot(table(df$PROCEDURE), 
        main = "Frequency Distribution of Procedure", 
        xlab = "", 
        ylab = "Frequency", 
        las = 2, 
        col = "darkblue", 
        border = "black", 
        cex.names = 0.4)
