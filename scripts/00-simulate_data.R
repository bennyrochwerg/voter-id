#### Preamble ####

# Purpose: Simulating Harris County, Texas data based on the reproduction package
# for the paper "Who Do Voter ID Laws Keep from Voting?" (Fraga and Miller 2022).
# Author: Benny Rochwerg
# Date: February 13, 2024
# Contact: 4321benny@gmail.com
# Pre-requisites: Install the janitor (Firke 2023) and tidyverse
# (Wickham et al. 2019) packages.

#### Loading Packages ####

# install.packages("janitor")
# install.packages("tidyverse")
library(janitor)
library(tidyverse)

#### Data Simulation ####

# Some of this code was adapted from Alexander (2023).

# Setting a seed for reproducibility
set.seed(2)

simulated_harris_data <- tibble(
  # Simulating 500 data entries
  county = rep("HARRIS", 500),
  # Simulating 500 reasons to be converted into binary variables afterward
  reason = sample(x = c("transport", "birthcert", "work", "lost", "disability",
                        "family", "applied", "other"),
                  size = 500,
                  replace = TRUE)
)

simulated_harris_data <- simulated_harris_data |>
  # Converting the reasons to binary variables
  mutate(transport = if_else(reason == "transport", 1, 0),
         birthcert = if_else(reason == "birthcert", 1, 0),
         work = if_else(reason == "work", 1, 0),
         lost = if_else(reason == "lost", 1, 0),
         disability = if_else(reason == "disability", 1, 0),
         family = if_else(reason == "family", 1, 0),
         applied = if_else(reason == "applied", 1, 0),
         other = if_else(reason == "other", 1, 0)) |>
  # Selecting every column except for the reason column
  select(county, transport, birthcert, work, lost, disability, family, applied,
         other)

simulated_harris_data <- simulated_harris_data |>
  # Creating columns for combined impediments based on Fraga and Miller (2022)
  mutate(relocation = applied,
         hardship = transport + birthcert + work + disability + family + other,
         id_capable = lost)

simulated_harris_data <- simulated_harris_data |>
  # Simulating the race of each entry
  mutate(race = sample(x = c("White", "Black", "Latinx", "Asian", "Other"),
                size = 500,
                replace = TRUE))

simulated_harris_data <- simulated_harris_data |>
  # Adding columns where the races are converted to binary variables
  mutate(black = if_else(race == "Black", 1, 0),
         latino = if_else(race == "Latinx", 1, 0),
         asian = if_else(race == "Asian", 1, 0),
         other_race = if_else(race == "Other", 1, 0),
         white = if_else(race == "White", 1, 0))

#### Testing the Simulated Data ####

# Some of this code was adapted from Alexander (2023).

# Checking the column classes
simulated_harris_data$county |> class() == "character"
simulated_harris_data$transport |> class() == "numeric"
simulated_harris_data$birthcert |> class() == "numeric"
simulated_harris_data$work |> class() == "numeric"
simulated_harris_data$lost |> class() == "numeric"
simulated_harris_data$disability |> class() == "numeric"
simulated_harris_data$family |> class() == "numeric"
simulated_harris_data$applied |> class() == "numeric"
simulated_harris_data$other |> class() == "numeric"
simulated_harris_data$relocation |> class() == "numeric"
simulated_harris_data$hardship |> class() == "numeric"
simulated_harris_data$id_capable |> class() == "numeric"
simulated_harris_data$race |> class() == "character"
simulated_harris_data$black |> class() == "numeric"
simulated_harris_data$latino |> class() == "numeric"
simulated_harris_data$asian |> class() == "numeric"
simulated_harris_data$other_race |> class() == "numeric"
simulated_harris_data$white |> class() == "numeric"

# Checking the column contents
sort(unique(simulated_harris_data$county |> na.omit())) == sort(c("HARRIS"))
sort(unique(simulated_harris_data$transport |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$birthcert |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$work |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$lost |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$disability |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$family |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$applied |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$other |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$relocation |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$hardship |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$id_capable |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$race |> na.omit())) == sort(c("White", "Black",
                                                                "Latinx", "Asian",
                                                                "Other"))
sort(unique(simulated_harris_data$black |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$latino |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$asian |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$other_race |> na.omit())) == sort(c(0, 1))
sort(unique(simulated_harris_data$white |> na.omit())) == sort(c(0, 1))