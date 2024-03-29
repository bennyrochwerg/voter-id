#### Preamble ####

# Purpose: Replication of graphs from the paper "Who Do Voter ID Laws
# Keep from Voting?" (Fraga and Miller 2022).
# Author: Benny Rochwerg
# Date: February 13, 2024
# Contact: 4321benny@gmail.com
# Pre-requisites: Install the tidyverse (Wickham et al. 2019) and patchwork
# (Pedersen 2024) packages. Run the "01-download_data.R" and "02-data_cleaning.R"
# files.

# Some of this code was adapted from Alexander (2023).

#### Loading Packages ####

# install.packages("tidyverse")
# install.packages("patchwork")
library(tidyverse)
library(patchwork)

#### Replicating the Graphs ####

# Loading the cleaned data
reasons_data_cleaned <- read_csv("data/reproduction/reasons_data_cleaned.csv")

# Replication of Figure 2 from the paper (Fraga and Miller 2022)

# Creating a table containing the relevant voter ID reasons and percentages
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

# Creating data labels to be shown on the graph
figure_2_data_labels <- paste(
  figure_2_data$percent, "%", sep = "")

# Adding the data labels to the data table
figure_2_data <- figure_2_data |>
  mutate(label = figure_2_data_labels)

# Creating the replicated graph
figure_2_replication <-
  ggplot(mapping = aes(x = reorder(figure_2_data$reason, figure_2_data$percent,
                                   decreasing = TRUE),
                       y = figure_2_data$percent)) +
  geom_col(fill = "turquoise") +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage",
       title = "Figure 2. Impediments cited by Texas voters in 2016") +
  coord_flip() +
  # The geom_text function used to add the labels to the graph was acquired from
  # R Graphics Cookbook:
  # https://r-graphics.org/recipe-bar-graph-labels
  # The hjust argument used to align the labels was acquired from
  # Cédric Scherer's website:
  # https://www.cedricscherer.com/2021/07/05/a-quick-how-to-on-labelling-bar-graphs-in-ggplot2/
  geom_text(aes(label = figure_2_data$label),
            hjust = c(0, 0, 0, 0, 0, 0, 0, 0),
            colour = "red",
            size = 3) +
  # The expand_limits function used to change the upper limit of the percent
  # axis's scale was acquired from the tidyverse ggplot2 website:
  # https://ggplot2.tidyverse.org/reference/expand_limits.html
  expand_limits(y = 40)

# Displaying the replicated graph
figure_2_replication

# Replication of Figure 3 from the paper (Fraga and Miller 2022)

# Creating a table containing the relevant voter ID reasons and percentages
figure_3_data <- tibble(
  reason = c("Relocation", "Hardship", "ID-Capable"),
  percent = round((100 * c(mean(reasons_data_cleaned$relocation),
                           mean(reasons_data_cleaned$hardship),
                           mean(reasons_data_cleaned$id_capable))), 2))

# Creating data labels to be shown on the graph
figure_3_data_labels <- paste(
  figure_3_data$percent, "%", sep = "")

# Adding the data labels to the data table
figure_3_data <- figure_3_data |>
  mutate(label = figure_3_data_labels)

# Creating the replicated graph
figure_3_replication <-
  ggplot(mapping = aes(x = reorder(figure_3_data$reason, figure_3_data$percent,
                                   decreasing = TRUE),
                       y = figure_3_data$percent)) +
  geom_col(fill = "orange") +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage",
       title = "Figure 3. Binned impediments cited") +
  coord_flip() +
  # The geom_text function used to add the labels to the graph was acquired from
  # R Graphics Cookbook:
  # https://r-graphics.org/recipe-bar-graph-labels
  # The hjust argument used to align the labels was acquired from
  # Cédric Scherer's website:
  # https://www.cedricscherer.com/2021/07/05/a-quick-how-to-on-labelling-bar-graphs-in-ggplot2/
  geom_text(aes(label = figure_3_data$label),
            hjust = c(0, 0, 0),
            colour = "red",
            size = 3) +
  # The expand_limits function used to change the upper limit of the percent
  # axis's scale was acquired from the tidyverse ggplot2 website:
  # https://ggplot2.tidyverse.org/reference/expand_limits.html
  expand_limits(y = 40)

# Displaying the replicated graph
figure_3_replication

# Replication of Figure A2 from the paper (Fraga and Miller 2022)

# Filtering the cleaned dataset to only include entries with the race "White"
reasons_data_cleaned_white <- reasons_data_cleaned |>
  filter(race == "White")

# Creating a table containing the relevant voter ID reasons and percentages
# for the race "White"
figure_a2_data_white <- tibble(
  reason = c("Relocation", "Hardship", "ID-Capable"),
  percent = round((100 * c(mean(reasons_data_cleaned_white$relocation),
                           mean(reasons_data_cleaned_white$hardship),
                           mean(reasons_data_cleaned_white$id_capable))), 2))

# Creating data labels to be shown on the graph for the race "White"
figure_a2_data_white_labels <- paste(
  figure_a2_data_white$percent, "%", sep = "")

# Adding the data labels to the data table for the race "White"
figure_a2_data_white <- figure_a2_data_white |>
  mutate(label = figure_a2_data_white_labels)

# Creating the replicated graph for the race "White"
figure_a2_white_replication <-
  ggplot(mapping = aes(x = figure_a2_data_white$reason,
                       y = figure_a2_data_white$percent)) +
  geom_col(fill = "darkgreen") +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage") +
  scale_x_discrete(limits = c("ID-Capable", "Hardship", "Relocation")) +
  coord_flip() +
  # The geom_text function used to add the labels to the graph was acquired from
  # R Graphics Cookbook:
  # https://r-graphics.org/recipe-bar-graph-labels
  # The hjust argument used to align the labels was acquired from
  # Cédric Scherer's website:
  # https://www.cedricscherer.com/2021/07/05/a-quick-how-to-on-labelling-bar-graphs-in-ggplot2/
  geom_text(aes(label = figure_a2_data_white$label),
            hjust = c(0, 0, 0),
            colour = "red",
            size = 2) +
  ggtitle("White") +
  # The expand_limits function used to change the upper limit of the percent
  # axis's scale was acquired from the tidyverse ggplot2 website:
  # https://ggplot2.tidyverse.org/reference/expand_limits.html
  expand_limits(y = 45)

# Filtering the cleaned dataset to only include entries with the race "Black"
reasons_data_cleaned_black <- reasons_data_cleaned |>
  filter(race == "Black")

# Creating a table containing the relevant voter ID reasons and percentages
# for the race "Black"
figure_a2_data_black <- tibble(
  reason = c("Relocation", "Hardship", "ID-Capable"),
  percent = round((100 * c(mean(reasons_data_cleaned_black$relocation),
                           mean(reasons_data_cleaned_black$hardship),
                           mean(reasons_data_cleaned_black$id_capable))), 2))

# Creating data labels to be shown on the graph for the race "Black"
figure_a2_data_black_labels <- paste(
  figure_a2_data_black$percent, "%", sep = "")

# Adding the data labels to the data table for the race "Black"
figure_a2_data_black <- figure_a2_data_black |>
  mutate(label = figure_a2_data_black_labels)

# Creating the replicated graph for the race "Black"
figure_a2_black_replication <-
  ggplot(mapping = aes(x = figure_a2_data_black$reason,
                       y = figure_a2_data_black$percent)) +
  geom_col() +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage") +
  scale_x_discrete(limits = c("ID-Capable", "Hardship", "Relocation")) +
  coord_flip() +
  # The geom_text function used to add the labels to the graph was acquired from
  # R Graphics Cookbook:
  # https://r-graphics.org/recipe-bar-graph-labels
  # The hjust argument used to align the labels was acquired from
  # Cédric Scherer's website:
  # https://www.cedricscherer.com/2021/07/05/a-quick-how-to-on-labelling-bar-graphs-in-ggplot2/
  geom_text(aes(label = figure_a2_data_black$label),
            hjust = c(0, 0, 0),
            colour = "red",
            size = 2) +
  ggtitle("Black") +
  # The expand_limits function used to change the upper limit of the percent
  # axis's scale was acquired from the tidyverse ggplot2 website:
  # https://ggplot2.tidyverse.org/reference/expand_limits.html
  expand_limits(y = 45)

# Filtering the cleaned dataset to only include entries with the race "Latinx"
reasons_data_cleaned_latinx <- reasons_data_cleaned |>
  filter(race == "Latinx")

# Creating a table containing the relevant voter ID reasons and percentages
# for the race "Latinx"
figure_a2_data_latinx <- tibble(
  reason = c("Relocation", "Hardship", "ID-Capable"),
  percent = round((100 * c(mean(reasons_data_cleaned_latinx$relocation),
                           mean(reasons_data_cleaned_latinx$hardship),
                           mean(reasons_data_cleaned_latinx$id_capable))), 2))

# Creating data labels to be shown on the graph for the race "Latinx"
figure_a2_data_latinx_labels <- paste(
  figure_a2_data_latinx$percent, "%", sep = "")

# Adding the data labels to the data table for the race "Latinx"
figure_a2_data_latinx <- figure_a2_data_latinx |>
  mutate(label = figure_a2_data_latinx_labels)

# Creating the replicated graph for the race "Latinx"
figure_a2_latinx_replication <-
  ggplot(mapping = aes(x = figure_a2_data_latinx$reason,
                       y = figure_a2_data_latinx$percent)) +
  geom_col(fill = "salmon") +
  theme_classic() +
  labs(x = "Impediment to voter ID", y = "Percentage") +
  scale_x_discrete(limits = c("ID-Capable", "Hardship", "Relocation")) +
  coord_flip() +
  # The geom_text function used to add the labels to the graph was acquired from
  # R Graphics Cookbook:
  # https://r-graphics.org/recipe-bar-graph-labels
  # The hjust argument used to align the labels was acquired from
  # Cédric Scherer's website:
  # https://www.cedricscherer.com/2021/07/05/a-quick-how-to-on-labelling-bar-graphs-in-ggplot2/
  geom_text(aes(label = figure_a2_data_latinx$label),
            hjust = c(0, 0, 0),
            colour = "red",
            size = 2) +
  ggtitle("Latinx") +
  # The expand_limits function used to change the upper limit of the percent
  # axis's scale was acquired from the tidyverse ggplot2 website:
  # https://ggplot2.tidyverse.org/reference/expand_limits.html
  expand_limits(y = 45)

# Combining the graphs for the three races into one graph
figure_a2_replication <- (figure_a2_white_replication) / (figure_a2_black_replication) / (figure_a2_latinx_replication)

# Adding a title to the combined graph
figure_a2_replication <- figure_a2_replication +
  plot_annotation(title = "Figure A2. Impediments cited by Texas voters in 2016, by race")

# Combining the axis labels on the combined graph
figure_a2_replication <- figure_a2_replication +
  plot_layout(axes = "collect")

# Displaying the replicated graph
figure_a2_replication