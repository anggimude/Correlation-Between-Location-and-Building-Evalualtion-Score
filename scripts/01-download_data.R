#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto to input
# Author: Hyuk Jang
# Date: 23 Jan 2024
# Contact: hyuk.jang@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(utils)

#### Download data ####

# get package
package <- show_package("4ef82789-e038-44ef-a478-a8f3590c3eb1")
package

# get all resources for this package
resources <- list_package_resources("4ef82789-e038-44ef-a478-a8f3590c3eb1")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
Pre_2023_Apartment_Building_Evaluations <- as_tibble(data)
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(Pre_2023_Apartment_Building_Evaluations, "Pre_2023_Apartment_Building_Evaluation.csv")

