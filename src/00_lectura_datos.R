library(readr)
library(dplyr)


holidays <- read_csv("data/raw/holidays.csv",
                     col_types = cols(
                       row_id = col_integer(),
                       Date = col_date(format = ""),
                       Holiday = col_character(),
                       site_id = col_character()
                       )
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

training_data <- read_csv("data/raw/training_data.csv",
                          col_types = cols(
                            row_id = col_integer(),
                            meter_id = col_character(),
                            Timestamp = col_datetime(format = ""),
                            Values = col_double()
                            )
                          )

weather <- read_csv("data/raw/weather.csv",
                    col_types = cols(
                      row_id = col_integer(),
                      Timestamp = col_datetime(format = ""),
                      Temperature = col_double(),
                      Distance = col_double(),
                      site_id = col_character()
                      )
                    )

save(list = c("holidays",
              "metadata",
              "submission_format",
              "training_data",
              "weather"),
     file = "data/data_sets.RData")


