## %######################################################%##
#                                                          #
####            Compound values - your turn             ####
#                                                          #
## %######################################################%##

# Import the Marine Protected Areas dataset (MPAS-your.csv)
# Separate the country codes variable (ISO3 and UN scheme)
# Unnest the Reference variable
# > Keep an eye on the separators
# Optional: Arrange the data by ISO3 country code


# load packages -----------------------------------------------------------
library(readr)
library(dplyr)
library(tidyr)
library(unheadr)
library(janitor)
library(stringr)

# import data -------------------------------------------------------------
MPAs <- read_csv("data/MPAS-your.csv") %>%
  mash_colnames(1) %>%
  clean_names()


# separate columns --------------------------------------------------------
# separate the country codes variable (ISO3 and UN scheme)
MPAs <- MPAs %>% separate(
  col = country_code_iso_un,
  into = c("country_code_ISO3", "country_code_UN"),
  sep = "  "
) # two spaces


# unnest rows -------------------------------------------------------------
# unnest the 'reference' variable
MPAs <- MPAs %>%
  mutate(reference = str_split(reference, "\\|")) %>%
  unnest(cols = reference)


# arrange by ISO3 country codes ---------------------------------------------
MPAs <- MPAs %>% arrange(country_code_ISO3)
