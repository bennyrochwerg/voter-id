#### Preamble ####

# Purpose: Cleaning the data from the reproduction package for the paper "Who
# Do Voter ID Laws Keep from Voting?" (Fraga and Miller 2022).
# Author: Benny Rochwerg
# Date: February 13, 2024
# Contact: 4321benny@gmail.com
# Pre-requisites: Install the tidyverse (Wickham et al. 2019) package.
# Run the "01-download_data.R" file.

#### Loading Packages ####

# install.packages("tidyverse")
library(tidyverse)

#### Cleaning the Dataset ####

# Loading the reproduction package data
county_data_reproduction <- read_csv("data/replication/county_data_reproduction.csv")
reasons_data_reproduction <- read_csv("data/replication/reasons_data_reproduction.csv")

# Selecting only the necessary columns from the reproduction package data
reasons_data_cleaned <- reasons_data_reproduction |>
  select(county, transport, birthcert, work, lost, disability, family, applied, other,
         relocation, hardship, id_capable, race, black, latino, asian, other_race) |>
  mutate(white = if_else(!is.na(race) & race == "White", 1, 0))

#### Saving the Cleaned Dataset ####

write_csv(reasons_data_cleaned, "data/replication/reasons_data_cleaned.csv")