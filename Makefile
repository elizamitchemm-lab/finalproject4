# =============================================================================
# Makefile — Chernobyl Radiation Analysis
# Run `make` from the project root to build the full report.
# Run `make install` first if packages are not yet installed.
# =============================================================================

.PHONY: all clean report data table figure install

# Default target: build everything
all: report

# --- Install R packages (run once) -------------------------------------------
install:
		Rscript -e "renv::restore(prompt = FALSE)"

# --- Final report ------------------------------------------------------------
report: output/report.html

output/report.html: report/report.Rmd \
                    output/tables/table1_summary.rds \
                    output/figures/fig1_cesium_decay.png
	Rscript -e "rmarkdown::render('report/report.Rmd', output_file = here::here('output/report.html'))"

# --- Data cleaning -----------------------------------------------------------
data: data/processed/chernobyl_clean.rds

data/processed/chernobyl_clean.rds: data/raw/chernobyl_radiation.csv \
                                     code/00_clean_data.R
	Rscript code/00_clean_data.R

# --- Table -------------------------------------------------------------------
table: output/tables/table1_summary.rds

output/tables/table1_summary.rds: data/processed/chernobyl_clean.rds \
                                   code/01_make_table.R
	Rscript code/01_make_table.R

# --- Figure ------------------------------------------------------------------
figure: output/figures/fig1_cesium_decay.png

output/figures/fig1_cesium_decay.png: data/processed/chernobyl_clean.rds \
                                       code/02_make_figure.R
	Rscript code/02_make_figure.R

# --- Clean all generated outputs ---------------------------------------------
clean:
	rm -rf data/processed/
	rm -rf output/tables/
	rm -rf output/figures/
	rm -f  output/report.html
