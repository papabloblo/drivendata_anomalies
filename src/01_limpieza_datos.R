
# ini ---------------------------------------------------------------------
library(tidyverse)
load("data/data_sets_raw.RData")

# holidays ----------------------------------------------------------------
holidays
holidays$row_id <- NULL
table(holidays$site_id)
table(holidays$date)

# metadata ----------------------------------------------------------------

metadata
table(metadata$site_id)
table(metadata$meter_description)

metadata <- metadata %>% 
  mutate(meter_description = tolower(meter_description))

table(metadata$meter_description)

table(metadata$units) # Distintas medidas

summary(metadata)
table(metadata$surface)
which(metadata$surface == 2000)
metadata[19:30,]

table(metadata$units,
      metadata$surface,
      useNA = "always")

table(metadata$activity)
table(metadata$activity,
      metadata$surface,
      useNA = "always")

# weather -----------------------------------------------------------------

weather$row_id <- NULL

summary(weather)
hist(weather$distance)
weather %>% 
  ggplot(aes(x = distance)) + 
  geom_density()

hist(weather$temperature)
weather %>% 
  ggplot(aes(x = temperature)) + 
  geom_density()


# training_data -----------------------------------------------------------
pryr::object_size(training_data)
# training_data$obs_id <- NULL
# pryr::object_size(training_data)

summary(training_data)
hist(training_data$values)
boxplot(training_data$values)
mean(is.na(training_data$values))
dim(training_data)

length(unique(training_data$meter_id))
length(unique(training_data$timestamp))
length(unique(training_data$timestamp))
day(training_data$timestamp[1:10])
