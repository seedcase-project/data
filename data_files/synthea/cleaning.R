library(tidyverse)
library(here)

# We rarely encounter data that has such personally identifying information.
# Drop them so we mimic what researchers actually encounter.
read_csv(here("synthea/patients.csv")) |>
  select(Id, BIRTHDATE, DEATHDATE, MARITAL, ETHNICITY, GENDER, HEALTHCARE_EXPENSES, INCOME) |>
  write_csv(here("synthea/patients.csv"))
