# ============================================================
# main.R — Script maestro: Análisis de Inmuebles Bogotá 2023
# ============================================================

rm(list = ls())
options(scipen = 999, stringsAsFactors = FALSE)

message("========================================")
message("  ANALISIS DE INMUEBLES BOGOTA 2023")
message("========================================\n")

source("scripts/00_config.R")
source("scripts/01_descriptiva.R")
source("scripts/02_precios_tipo.R")
source("scripts/03_estrato_area.R")
source("scripts/04_hab_sin_parq.R")
source("scripts/05_contingencia.R")
source("scripts/06_ic_media_admin.R")
source("scripts/07_ic_proporciones.R")
source("scripts/08_test_varianza.R")
source("scripts/09_test_proporcion.R")

message("\n========================================")
message("  ANALISIS COMPLETO")
message("========================================")
