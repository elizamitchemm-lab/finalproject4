# clean and prep the raw radiation data

library(readr)
library(dplyr)
library(here)

raw <- read_csv(here("data/raw/chernobyl_radiation.csv"), show_col_types = FALSE)

# add some useful columns
clean <- raw %>%
  mutate(
    years_since_accident = year - 1986,
    high_exposure = cesium_137_bq_m2 > 50000,
    region = factor(region),
    log_cesium = log1p(cesium_137_bq_m2),
    log_distance = log1p(distance_from_chernobyl_km)
  ) %>%
  filter(!is.na(country)) %>%
  arrange(country, year)

dir.create(here("data/processed"), recursive = TRUE, showWarnings = FALSE)
saveRDS(clean, here("data/processed/chernobyl_clean.rds"))
