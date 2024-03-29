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
county_data_reproduction <- read_csv("data/reproduction/county_data_reproduction.csv")
reasons_data_reproduction <- read_csv("data/reproduction/reasons_data_reproduction.csv")

# Selecting only the necessary columns from the reproduction package data
reasons_data_cleaned <- reasons_data_reproduction |>
  select(county, transport, birthcert, work, lost, disability, family, applied, other,
         relocation, hardship, id_capable, race, black, latino, asian, other_race) |>
  mutate(white = if_else(!is.na(race) & race == "White", 1, 0))

#### Saving the Cleaned Dataset ####

# Saving the Texas data
write_csv(reasons_data_cleaned, "data/reproduction/reasons_data_cleaned.csv")

# Filtering the data to only include Harris County
reasons_data_harris <- reasons_data_cleaned |>
  filter(county == "HARRIS")

# Saving the Harris County data
write_csv(reasons_data_harris, "data/reproduction/reasons_data_harris.csv")