## %######################################################%##
#                                                          #
####         Useful dplyr functions - your turn         ####
#                                                          #
## %######################################################%##


# Load the mammal sleep data bundled with ggplot2
# Select "name" and "conservation" columns and those that include the string 'sleep' in their name
# Create a new column that contains the values of 'sleep_total' multiplied by 3
# Filter the data to remove domesticated mammals
# Use pipes to chain the operations


# load packages -----------------------------------------------------------
library(dplyr)
library(ggplot2)

# load data ---------------------------------------------------------------
data("msleep")

# transform data ----------------------------------------------------------
# Select "name" and "conservation" columns and those that include the string 'sleep' in their name
# explore variable names
names(msleep)
# Select columns
msleep %>% select(name, conservation, sleep_total, sleep_rem, sleep_cycle)

# Create a new column that contains the values of 'sleep_total' multiplied by 3
msleep %>%
  select(name, conservation, sleep_total, sleep_rem, sleep_cycle) %>%
  mutate(sleep3 = sleep_total * 3)

# Filter the data to remove domesticated mammals
msleep %>%
  select(name, conservation, sleep_total, sleep_rem, sleep_cycle) %>%
  mutate(sleep3 = sleep_total * 3) %>%
  filter(conservation != "domesticated")
