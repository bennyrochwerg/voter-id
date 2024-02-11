#### Preamble ####

# Purpose: Downloading and saving of data from the reproduction package
# for the paper "Who Do Voter ID Laws Keep from Voting?" (Fraga and Miller 2022).
# Author: Benny Rochwerg
# Date: February 13, 2024
# Contact: 4321benny@gmail.com
# Pre-requisites: Install the tidyverse (Wickham et al. 2019),
# haven (Wickham, Miller, and Smith 2023), and labelled (Larmarange 2023)
# packages.

#### Loading Packages ####

# install.packages("tidyverse")
# install.packages("haven")
# install.packages("labelled")
library(tidyverse)
library(haven)
library(labelled)

#### Downloading the Dataset ####

# Since the data from the reproduction package could not be downloaded directly
# from the source into this script, it was necessary to download the data
# manually. This was done by first visiting this website:
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/X5ALUA
# Then, the "Access File" option beside the "fraga_miller_county_replication.tab"
# file was clicked on, and the "Stata 14 Binary (Original File Format)" option
# was clicked on. This process was repeated for the
# "fraga_miller_reasons_replication.tab" file on the same website.
# The two resulting files were then uploaded to GitHub and downloaded from
# GitHub into this script (see below).
county_data_reproduction <- read_dta(file = "data/replication/fraga_miller_county_replication.dta")
reasons_data_reproduction <- read_dta(file = "data/replication/fraga_miller_reasons_replication.dta")

# Combining the data labels
county_data_reproduction <- to_factor(county_data_reproduction)
reasons_data_reproduction <- to_factor(reasons_data_reproduction)

#### Saving the Dataset ####

write_csv(county_data_reproduction, "data/replication/county_data_reproduction.csv")
write_csv(reasons_data_reproduction, "data/replication/reasons_data_reproduction.csv")