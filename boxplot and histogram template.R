library(tidyverse)
library(gtsummary)
library(gt)
library(flextable)
library(forcats)
library(gapminder)
library(dplyr)
library(dlookr)
library(stats)
library(ggplot2)
#Create anova model to compare (for post-hoc)
ir %>% aov(Sepal.Length ~ Species, data = .) %>% TukeyHSD()

#create boxplot
boxplot(Sepal.Length ~ ir$Species, data = ir)
?geom_histogram

#histogram to isolate data from a qualitative variable 
setosa_data <- ir %>% filter(Species == "setosa")
ggplot(data = setosa_data,mapping =  aes(x = Sepal.Length)) + 
  geom_histogram(fill = "grey65", color = "black") +
  ggtitle("Sepal length by species") + facet_grid(rows = vars(Species))

#Histogram
ggplot(data = ir,mapping =  aes(x = Sepal.Length)) + 
  geom_histogram(fill = "grey65", color = "black") +
  ggtitle("Sepal length by species") + facet_grid(rows = vars(Species))
 



