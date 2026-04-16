setwd("C:/Users/praxi/OneDrive/Desktop/DSC-502/DATA")

df <- read.csv("G:\\My Drive\\League_of_Legends_Data - Sheet1 (2).csv")

table(df$champion)

library(dbplyr)
library(dplyr)

# Filter data set to include only champions that appear at least twice
df_filtered <- df %>%
  group_by(champion) %>%
  filter(n() >= 2) %>%
  ungroup()

install.packages("ggplot2")
library(ggplot2)

# Bar Plot: Damage per Champion (Ended up not being included or useful)
team_colors <- c("#0088FF", "#FF2200")

ggplot(df_filtered, aes(x = champion, y = damage, fill = team)) +
  geom_col() + scale_fill_manual(values = team_colors) +
  labs(
    x = "Champion",
    y = "Damage",
    title = "Damage per Champion (Played at Least Twice)"
  ) +
  theme_minimal() + theme(axis.text.x = element_text(angle = 45, hjust = 1))