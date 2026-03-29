# summary table by region for 1986 baseline

library(dplyr)
library(here)

dat <- readRDS(here("data/processed/chernobyl_clean.rds"))

baseline <- dat %>%
  filter(year == 1986) %>%
  select(region, cesium_137_bq_m2, distance_from_chernobyl_km,
         population_exposed, thyroid_cancer_per_100k, cancer_incidence_per_100k)

tbl1 <- baseline %>%
  group_by(region) %>%
  summarise(
    n = n(),
    `Mean Cs-137 (Bq/m2)` = round(mean(cesium_137_bq_m2), 0),
    `Mean Distance (km)` = round(mean(distance_from_chernobyl_km), 0),
    `Mean Pop. Exposed` = round(mean(population_exposed), 0),
    `Mean Thyroid Ca/100k` = round(mean(thyroid_cancer_per_100k), 2),
    `Mean Cancer Inc./100k` = round(mean(cancer_incidence_per_100k), 2)
  ) %>%
  rename(Region = region)

dir.create(here("output/tables"), recursive = TRUE, showWarnings = FALSE)
saveRDS(tbl1, here("output/tables/table1_summary.rds"))
