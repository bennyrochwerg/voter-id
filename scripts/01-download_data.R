#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("haven")
# install.packages("labelled")
library(tidyverse)
library(haven)
library(labelled)
# [...UPDATE THIS...]

#### Download data ####
county_data_raw <- read_dta(file = "https://github.com/bennyrochwerg/voter-id/raw/main/data/replication/fraga_miller_county_replication.dta")
reasons_data_raw <- read_dta(file = "https://github.com/bennyrochwerg/voter-id/raw/main/data/replication/fraga_miller_reasons_replication.dta")

# Combining the data labels
county_data_raw <- to_factor(county_data_raw)
reasons_data_raw <- to_factor(reasons_data_raw)

# [...ADD CODE HERE TO DOWNLOAD...]



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
