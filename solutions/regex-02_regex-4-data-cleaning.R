## %######################################################%##
#                                                          #
####        Regex for data cleaning - your turn         ####
#                                                          #
## %######################################################%##

# 1. Download CRAN package descriptions
# 2. Select Package name, author, description, and all variables that end in 'ports'
# 3. Filter rows for packages with names that:
#    - end in plot
#    - contain Bayes
#    - contain digits
#    - are all UPPER CASE


# load packages -----------------------------------------------------------
library(dplyr)
library(stringr)

# download package details ------------------------------------------------
p_db <- tools::CRAN_package_db()

# select variables of interest -------------------------------------------
p_db <- p_db %>% select(Package, Author, Description, matches("ports$"))

# filter rows for package names ------------------------------------------

# end in plot
p_db %>%
  filter(str_detect(Package, "plot$")) %>%
  pull(Package)

# contains Bayes
p_db %>%
  filter(str_detect(Package, "Bayes")) %>%
  pull(Package)

# contain digits
p_db %>%
  filter(str_detect(Package, "[0-9]")) %>%
  pull(Package)

# UPPER CASE pkg name
p_db %>%
  filter(str_detect(Package, "^[A-Z]+$")) %>%
  pull(Package)
