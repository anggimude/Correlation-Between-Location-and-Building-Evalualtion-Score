#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Hyuk Jang
# Date: Jan 23, 2024
# Contact: hyuk.jang@mail.utoronto.ca
# License: MIT
# Pre-requisites:NA
# Any other information needed? 

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(stringr)   
library(janitor)
library(utils)
library(knitr)
library(kableExtra)

#### Clean data ####
clean_evaluation_data <-
  simulated_data |>
  mutate(Ward_numeric = as.numeric(gsub("\\D","", Ward))) |>
  drop_na(Sum_Score, Ward_numeric) |>
  group_by(Ward_numeric)
summarize(simulated_data, .by = Average_Score)

clean_evaluation_data |>
  kable(
    col.names = c("Average_Score"), 
    digits = 1
  )

#### Save data ####
write_csv(clean_evaluation_data, "inputs/data/clean_evaluation_data.csv")

