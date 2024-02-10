#### Preamble ####
# Purpose: Replication of graphs and tables from the paper "Who Do Voter ID Laws
# Keep from Voting?" (Fraga and Miller 2022)
# Author: Benny Rochwerg
# Date: February 13, 2024
# Contact: 4321benny@gmail.com
# Pre-requisites: Install the tidyverse package (Wickham et al. 2019).

#### Loading Packages ####
# install.packages("tidyverse")
library(tidyverse)

# Replication of Figure 2 from the paper (Fraga and Miller 2022)

figure_2_data <- tibble(
  reason = c("Family Obligations", "Applied, Has Not Received",
             "Lack of Transportation", "Lacks Necessary Documents",
             "Disability/Illness", "Work Obligations",
             "ID was Lost or Stolen", "Other Reason"),
  percent = round((100 * c(mean(reasons_data_cleaned$family),
                    mean(reasons_data_cleaned$applied),
                    mean(reasons_data_cleaned$transport),
                    mean(reasons_data_cleaned$birthcert),
                    mean(reasons_data_cleaned$disability),
                    mean(reasons_data_cleaned$work),
                    mean(reasons_data_cleaned$lost),
                    mean(reasons_data_cleaned$other))), 2))

figure_2_data_labels <- paste(
  figure_2_data$percent, "%", sep = "")

figure_2_data <- figure_2_data |>
  mutate(label = figure_2_data_labels)

figure_2_replication <-
  ggplot(mapping = aes(x = reorder(figure_2_data$reason, figure_2_data$percent,
                                   decreasing = TRUE),
                       y = figure_2_data$percent)) +
  geom_col() +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage") +
  coord_flip() +
  geom_text(aes(label = figure_2_data$label),
            hjust = c(1, 1, 1, 1, 1, 1, 1, 1),
            colour = "orange")

figure_2_replication

# Replication of Figure 3 from the paper (Fraga and Miller 2022)

figure_3_data <- tibble(
  reason = c("Relocation", "Hardship", "ID-Capable"),
  percent = round((100 * c(mean(reasons_data_cleaned$relocation),
                           mean(reasons_data_cleaned$hardship),
                           mean(reasons_data_cleaned$id_capable))), 2))

figure_3_data_labels <- paste(
  figure_3_data$percent, "%", sep = "")

figure_3_data <- figure_3_data |>
  mutate(label = figure_3_data_labels)

figure_3_replication <-
  ggplot(mapping = aes(x = reorder(figure_3_data$reason, figure_3_data$percent,
                                   decreasing = TRUE),
                       y = figure_3_data$percent)) +
  geom_col() +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage") +
  coord_flip() +
  geom_text(aes(label = figure_3_data$label),
            hjust = c(1, 1, 1),
            colour = "orange")

figure_3_replication