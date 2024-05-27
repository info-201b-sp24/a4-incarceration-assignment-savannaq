library(tidyverse)


# Trend over time plot
jail_data %>%
  filter(black_jail_pop > 0 | white_jail_pop > 0) %>%  # Filtering to include only rows where either black or white jail population is present
  group_by(year) %>%
  summarize(
    black_avg_rate = mean(black_jail_pop, na.rm = TRUE),
    white_avg_rate = mean(white_jail_pop, na.rm = TRUE)
  ) %>%
  pivot_longer(cols = c(black_avg_rate, white_avg_rate), names_to = "race_category", values_to = "average_rate") %>%
  ggplot(aes(x = year, y = average_rate, color = race_category)) +
  geom_line() +
  labs(title = "Incarceration Rates Over Time by Race", x = "Year", y = "Incarceration Rate per 100,000 People", color = "Race")
