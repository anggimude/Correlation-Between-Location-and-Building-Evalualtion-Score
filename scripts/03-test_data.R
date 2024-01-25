#### Preamble ####
# Purpose: Tests the quality of the cleaned data
# Author: Hyuk Jang
# Date: 23 Jan, 2024
# Contact: hyuk.jang@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? 


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(utils)

#### Test data ####
clean_evaluation_data$Ward_numeric |> min == 1
clean_evaluation_data$Ward_numeric |> max == 25

clean_evaluation_data$Average_Score |> max() <= 100
clean_evaluation_data$Average_Score |> min() >= 0
clean_evaluation_data$Average_Score |> class() == "numeric"

write_csv(clean_evaluation_data, "clean_evaluation_data.csv")

