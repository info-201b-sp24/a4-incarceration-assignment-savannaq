library(maps)
library(mapproj)
library(ggplot2)
library(dplyr)


# Map
data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-jail-pop.csv?raw=true")

data <- data %>%
  mutate(state = tolower(state),
         county_name = tolower(county_name))

county_map <- map_data("county")

county_map <- county_map %>%
  rename(state = region, county_name = subregion)

map_data <- county_map %>%
  left_join(data, by = c("state" = "state", "county_name" = "county_name"))

ggplot(map_data, aes(long, lat, group = group, fill = total_jail_pop)) +
  geom_polygon(color = "white") +
  scale_fill_viridis_c(name = "Total Jail Population", na.value = "grey50") +
  labs(title = "Geographical Distribution of Total Jail Population",
       caption = "Data Source: Your Data") +
  theme_minimal() +
  coord_map()

ggsave("map_chart.png", width = 10, height = 7)
