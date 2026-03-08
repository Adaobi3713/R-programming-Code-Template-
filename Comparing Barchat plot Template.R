#comapring Code with ggplot

df %>%
  group_by(group) %>%
  summarise(mean_Zn = round(mean(Zn, na.rm = TRUE), 2)) %>%
  ggplot(aes(x = group, y = mean_Zn, fill = group)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  geom_text(aes(label = mean_Zn), vjust = -0.5) +
  labs(title = "Mean Zinc (Zn) Across Groups", y = "Zn", x = "Group") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) #OR

df %>%
  group_by(group) %>%
  summarise(
    mean_Zn = round(mean(Zn, na.rm = TRUE), 2),
    sd_Zn = round(sd(Zn, na.rm = TRUE), 2)
  ) %>%
  mutate(label = paste0(mean_Zn, " ± ", sd_Zn)) %>%
  ggplot(aes(x = group, y = mean_Zn, fill = group)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  geom_text(aes(label = label), vjust = 0.5, color = "black", fontface = "bold") +
  labs(title = "Mean Zinc (Zn) Across Groups with SD", y = "Zinc Level", x = "Group") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#with Sjplot
sjPlot::plot_grpfrq(df$Zn, df$group,
                    title = "Zinc (Zn) Distribution Across Groups",
                    type = "box",
                    geom.colors = "blue") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#pieChart Code
ggplot(df, aes(x = "", fill = BMI_cat)) +
  geom_bar(width = 1) +
  coord_polar("y") +
  geom_text(
    stat = "count",
    aes(label = paste0(round((..count..) / sum(..count..) * 100, 1), "%")),
    position = position_stack(vjust = 0.5),
    color = "black",
    size = 4,
    fontface = "bold"
  ) +
  labs(title = "Distribution of Participants by BMI category") +
  theme_void() +
  theme(legend.position = "right")


#line Chart
library(tidyverse)
library(gtsummary)
library(flextable)
library(sjPlot)
library(dplyr)
library(ggplot2)
library(dlookr)
ggplot(df, aes(x = `VAS-2`, y = `VAS-4`, color = `GROUP CODE`, group = `GROUP CODE`)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Zinc (Zn) Levels by Copper",
    x = "VAS-2mins",
    y = "VAS-4mins",
    color = "Group"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1),
    plot.title = element_text(face = "bold")
  )
# data extrapolation
df_long1 <- df %>%
  filter(`GROUP CODE` %in% c("MD", "D")) %>%
  pivot_longer(
    cols = starts_with("VAS-"), #Turns your wide dataset (many columns like VAS-2,VAS-4, VAS-6) into a long format with two columns:
    names_to = "TimeLabel",
    values_to = "VAS"
  ) %>%
  mutate(
    # Extract numeric part
    TimeNum = as.numeric(str_remove(TimeLabel, "VAS-")),
    # Create label with "mins"
    TimeLabel = paste0(TimeNum, " mins"),
    # Keep in correct order
    TimeLabel = factor(TimeLabel, levels = paste0(sort(unique(TimeNum)), " mins"))
  )

# Line chart
ggplot(df_long, aes(x = TimeLabel, y = VAS, color = `GROUP CODE`, group = `GROUP CODE`)) +
  stat_summary(fun = mean, geom = "line", linewidth = 1) +
  stat_summary(fun = mean, geom = "point", size = 2) +
  labs(
    title = "VAS Over Time by Group",
    x = "Time (minutes)",
    y = "VAS Score",
    color = "Group Code"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1) # Rotate labels vertically
  )

write.csv(df_long1, file = "Dis(MDvsD).csv")

