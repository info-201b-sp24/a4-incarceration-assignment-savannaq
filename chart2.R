library(ggplot2)
library(dplyr)


# Variable Comparison Chart
ggplot(jail_data, aes(x = total_pop, y = total_jail_pop)) +
  geom_point() +
  labs(
    title = "Relationship Between Total Population and Total Jail Population",
    x = "Total Population",
    y = "Total Jail Population"
  )
