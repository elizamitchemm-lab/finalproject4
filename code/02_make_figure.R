# figure 1 - cesium 137 levels over time by country

library(dplyr)
library(ggplot2)
library(scales)
library(here)

dat <- readRDS(here("data/processed/chernobyl_clean.rds"))

# keep only countries that have data at multiple time points
longitudinal <- dat %>%
  group_by(country) %>%
  filter(n() >= 3) %>%
  ungroup()

fig1 <- ggplot(longitudinal, aes(x = year, y = cesium_137_bq_m2,
                                  color = country, group = country)) +
  geom_line(linewidth = 0.9) +
  geom_point(size = 2.5) +
  scale_y_continuous(labels = comma) +
  scale_x_continuous(breaks = c(1986, 1990, 1996, 2006, 2016)) +
  scale_color_brewer(palette = "Set2") +
  labs(
    title = "Cesium-137 Contamination Levels Over Time",
    subtitle = "Selected countries, 1986-2016",
    x = "Year",
    y = "Cs-137 Activity (Bq/m2)",
    color = "Country",
    caption = "Source: Chernobyl radiation dataset (Kaggle)"
  ) +
  theme_bw(base_size = 13) +
  theme(plot.title = element_text(face = "bold"))

dir.create(here("output/figures"), recursive = TRUE, showWarnings = FALSE)
ggsave(here("output/figures/fig1_cesium_decay.png"),
       plot = fig1, width = 8, height = 5, dpi = 300)
