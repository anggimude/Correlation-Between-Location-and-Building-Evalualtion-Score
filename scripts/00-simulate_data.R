#### Preamble ####
# Purpose: Simulate the Pre 2023 Apartment Building Evaluations
# Date: Jan 23, 2024
# Contact: hyuk.jang@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(knitr)
library(opendatatoronto)
library(utils)

#### Simulate data ####
set.seed(123)
num_wards <- 25
score_per_ward <- 100

simulated_data <- tibble(
  Ward = rep(1:num_wards, each = score_per_ward),
  Score = runif(num_wards * score_per_ward, min = 0, max = 100)
) %>%
  group_by(Ward) %>%
  summarise(
    Sum_Score = sum(Score),
    Average_Score = mean(Score)
  ) %>%
  ungroup() 

