
# ini ---------------------------------------------------------------------

library(lubridate)


# training_data -----------------------------------------------------------

training_data <- training_data %>% 
  mutate(day = as.integer(yday(timestamp)),
         year = as.integer(year(timestamp)))

train_day <- training_data %>% 
  filter(between(values, 0, 1e+6)) %>% 
  group_by(meter_id, day, year) %>% 
  summarise(values = sum(values))

train_day %>% 
  ungroup() %>% 
  select(meter_id, year) %>% 
  distinct()

train_day %>% 
  ggplot(aes(x = day, 
             y = values,
             group = paste(year, meter_id))) + 
  geom_line()

train_day_cluster <- train_day %>% 
  spread(day, values)

train_day_cluster[is.na(train_day_cluster)] <- 0

train_day_cluster %>% 
  select(meter_id, year)

train_day_cluster$res_clust <- kmeans(train_day_cluster[, 3:ncol(train_day_cluster)], 20)$cluster

train_day <- train_day_cluster %>% 
  select(meter_id, year, res_clust) %>% 
  right_join(train_day)

train_day %>% 
  ggplot(aes(x = day, 
             y = values,
             group = paste(year, meter_id))) + 
  geom_line() + 
  facet_wrap(~res_clust)

