# Chernobyl Radiation: Country-Level Exposure and Health Outcomes

This repository contains an analysis of radiation contamination levels (primarily Cesium-137) and associated health outcomes across European countries following the 1986 Chernobyl nuclear disaster.

---

## Generating the Final Report

### Step 1 — Restore the package environment

```bash
make install
```

This restores the required R packages using the `renv.lock` file.

### Step 2 — Build the report

From the **project root directory**, run:

```bash
make
```

This will automatically:
1. Clean and process the raw data (`code/00_clean_data.R`)
2. Generate the summary table (`code/01_make_table.R`)
3. Generate the figure (`code/02_make_figure.R`)
4. Render the final HTML report → `output/report.html`

### Optional: Run individual steps

```bash
make install  # Restore the required package environment
make data     # Clean raw data only
make table    # Generate Table 1 only
make figure   # Generate Figure 1 only
make report   # Render the full report
make clean    # Remove all generated files
```

---

## Repository Structure

```
finalproject4/
│
├── Makefile
├── README.md
│
├── data/
│   ├── raw/
│   │   └── chernobyl_radiation.csv
│   └── processed/
│
├── code/
│   ├── 00_clean_data.R
│   ├── 01_make_table.R
│   └── 02_make_figure.R
│
├── report/
│   └── report.Rmd
│
└── output/
    ├── report.html
    ├── tables/
    └── figures/
```

---

## Report Contents

The final report (`output/report.html`) includes:

- Background on the Chernobyl disaster and key radionuclides  
- Table 1 — Baseline radiation exposure and health outcomes by region  
- Figure 1 — Cesium-137 decay trends over time (1986–2016)  
- Key findings relating contamination, geography, and health outcomes  

---

## Data

The dataset (`data/raw/chernobyl_radiation.csv`) contains country-level measurements for:

| Variable | Description |
|---|---|
| `country` | Country name |
| `year` | Measurement year (1986–2016) |
| `cesium_137_bq_m2` | Cs-137 activity (Bq/m²) |
| `iodine_131_bq_m2` | I-131 activity (Bq/m²) |
| `strontium_90_bq_m2` | Sr-90 activity (Bq/m²) |
| `distance_from_chernobyl_km` | Distance from plant (km) |
| `population_exposed` | Estimated exposed population |
| `cancer_incidence_per_100k` | Total cancer rate per 100,000 |
| `thyroid_cancer_per_100k` | Thyroid cancer rate per 100,000 |
| `region` | Geographic region |

> **Note:** The data in this repository are a synthetic reconstruction with identical structure to the original Kaggle dataset, created for public sharing purposes.

---

## Package Setup

This project uses `renv` to manage package versions.

To restore the package environment, run:

```bash
make install
```

This will restore the required packages from the `renv.lock` file.