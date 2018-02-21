library(readr)
library(dplyr)


holidays <- read_csv("data/raw/holidays.csv",
                     
                     col_names = c("row_id",
                                   "date",
                                   "holiday",
                                   "site_id"),
                     
                     col_types = cols(
                       row_id = col_integer(),
                       date = col_date(format = ""),
                       holiday = col_character(),
                       site_id = col_character()
                       ),
                     skip = 1
                     )

metadata <- read_csv("data/raw/metadata.csv",
                     col_types = cols(
                       meter_id = col_character(),
                       site_id = col_character(),
                       meter_description = col_character(),
                       units = col_character(),
                       surface = col_double(),
                       activity = col_character()
                       )
                     )

submission_format <- read_csv("data/raw/submission_format.csv",
                              col_types = cols(
                                obs_id = col_integer(),
                                meter_id = col_character(),
                                Timestamp = col_datetime(format = ""),
                                is_abnormal = col_character()
                                )
                              )
names(submission_format) <- tolower(names(submission_format))

training_data <- read_csv("data/raw/training_data.csv",
                          col_types = cols(
                            X1 = col_integer(),
                            meter_id = col_character(),
                            Timestamp = col_datetime(format = ""),
                            Values = col_double()
                            )
                          )
names(training_data)[1] <- "obs_id"
names(training_data) <- tolower(names(training_data))

weather <- read_csv("data/raw/weather.csv",
                    col_types = cols(
                      X1 = col_integer(),
                      Timestamp = col_datetime(format = ""),
                      Temperature = col_double(),
                      Distance = col_double(),
                      site_id = col_character()
                      )
                    )

names(weather)[1] <- "row_id"
names(weather) <- tolower(names(weather))

save(list = c("holidays",
              "metadata",
              "submission_format",
              "training_data",
              "weather"),
     file = "data/data_sets_raw.RData")


