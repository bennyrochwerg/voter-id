#### Preamble ####

# Purpose: Testing the Harris County, Texas data based on the reproduction package
# for the paper "Who Do Voter ID Laws Keep from Voting?" (Fraga and Miller 2022).
# Author: Benny Rochwerg
# Date: February 13, 2024
# Contact: 4321benny@gmail.com
# Pre-requisites: Install the tidyverse (Wickham et al. 2019) package. Run
# the "01-download_data.R" and "02-data_cleaning.R" files.

#### Loading Packages ####

# install.packages("tidyverse")
library(tidyverse)

#### Testing the Data ####

# Some of this code was adapted from Alexander (2023).
# These tests were written in the "00-simulate_data.R" file.

# Loading the Harris County data
reasons_data_harris <- read_csv("data/reproduction/reasons_data_harris.csv")

# Checking the column classes
reasons_data_harris$county |> class() == "character"
reasons_data_harris$transport |> class() == "numeric"
reasons_data_harris$birthcert |> class() == "numeric"
reasons_data_harris$work |> class() == "numeric"
reasons_data_harris$lost |> class() == "numeric"
reasons_data_harris$disability |> class() == "numeric"
reasons_data_harris$family |> class() == "numeric"
reasons_data_harris$applied |> class() == "numeric"
reasons_data_harris$other |> class() == "numeric"
reasons_data_harris$relocation |> class() == "numeric"
reasons_data_harris$hardship |> class() == "numeric"
reasons_data_harris$id_capable |> class() == "numeric"
reasons_data_harris$race |> class() == "character"
reasons_data_harris$black |> class() == "numeric"
reasons_data_harris$latino |> class() == "numeric"
reasons_data_harris$asian |> class() == "numeric"
reasons_data_harris$other_race |> class() == "numeric"
reasons_data_harris$white |> class() == "numeric"

# Checking the column contents
sort(unique(reasons_data_harris$county |> na.omit())) == sort(c("HARRIS"))
sort(unique(reasons_data_harris$transport |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$birthcert |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$work |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$lost |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$disability |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$family |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$applied |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$other |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$relocation |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$hardship |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$id_capable |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$race |> na.omit())) == sort(c("White", "Black",
                                                                "Latinx", "Asian",
                                                                "Other"))
sort(unique(reasons_data_harris$black |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$latino |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$asian |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$other_race |> na.omit())) == sort(c(0, 1))
sort(unique(reasons_data_harris$white |> na.omit())) == sort(c(0, 1))