## %######################################################%##
#                                                          #
####            Putting everything together             ####
####        Chained data cleaning demonstration         ####
#                                                          #
## %######################################################%##


# Load the raw Age of Empires units dataset from csv (aoe_raw.csv)
# Identify and fix common issues that make these data unusable

# load packages -----------------------------------------------------------
library(readr)
library(dplyr)
library(unheadr)
library(stringr)
library(tidyr)

# load data ---------------------------------------------------------------
aoe_raw <- read_csv("data/aoe_raw.csv")

# cleanup -----------------------------------------------------------------
# fix names
aoer <- aoe_raw %>% mash_colnames(2)

# multi line values
aoer <-
  aoer %>%
  unbreak_vals(
    regex = "^\\(", ogcol = Name, newcol = Name_ub,
    sep = " "
  ) %>%
  rename(Name = Name_ub)
# tag subheaders
subhtags <- aoer %>%
  filter(across(Type:`Armor_(Melee/Pierce)`, is.na)) %>%
  select(Name) %>%
  mutate(nametag = paste0("Building-", Name))

# join labels and untangle embedded subheaders
aoerint <- left_join(aoer, subhtags) %>% # gets joined by name
  untangle2("^Building-", nametag, Building) %>%
  select(-nametag) %>%
  mutate(Building = stringr::str_remove(Building, "^Building-")) %>%
  relocate(Building, .after = Name)

# split costs
aoerint <-
  aoerint %>%
  mutate(
    cost_wood = stringr::str_extract(Cost, "(\\d+)(?=W)"),
    cost_food = stringr::str_extract(Cost, "(\\d+)(?=F)"),
    cost_gold = stringr::str_extract(Cost, "(\\d+)(?=G)")
  ) %>%
  relocate(starts_with("cost_"), .after = Cost) %>%
  select(-Cost)


# separate armor types
aoerint <-
  aoerint %>% separate(`Armor_(Melee/Pierce)`, into = c("melee_armor", "pierce_armor"), sep = "\\/")

# name for observational units
aoerint <- aoerint %>% rename(unit = Name)

# clean variable names
aoerintc <- aoerint %>% janitor::clean_names()

# fix accuracy column
aoerintc <- aoerintc %>%
  mutate(accuracy = str_remove(accuracy, "%")) %>%
  readr::type_convert() %>%
  mutate(accuracy = accuracy * .01)

# issue with text as numbers
# 'none' to 0
aoerintc <- aoerintc %>% mutate(min_range = str_replace(min_range, "none", "0"))

# remove whitespace
aoerintc <- aoerintc %>% mutate(across(everything(), str_squish))

# sort out NA vals
aoerintc <-
  aoerintc %>%
  mutate(across(everything(), na_if, "-")) %>%
  mutate(across(everything(), na_if, "Non-trainable")) %>%
  mutate(across(everything(), na_if, ""))


# re-parse and keep only distinct rows
aoerintt <-
  aoerintc %>%
  readr::type_convert() %>%
  distinct()

# informative object name
AOEunits <- aoerintt
AOEunits
summary(AOEunits)
