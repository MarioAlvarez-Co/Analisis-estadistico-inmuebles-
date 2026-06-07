# ============================================================
# 00_config.R — Carga de datos (solo R base)
# ============================================================

datos <- read.csv("grupo14.csv", header = TRUE, stringsAsFactors = FALSE)
names(datos) <- iconv(names(datos), from = "UTF-8", to = "ASCII//TRANSLIT")

datos$Administracion <- as.numeric(gsub("[^0-9]", "", as.character(datos$Administracion)))
datos$Estrato        <- as.factor(datos$Estrato)
datos$Antiguedad     <- as.numeric(datos$Antiguedad)
datos$Area           <- as.numeric(datos$Area)
datos$habitaciones   <- as.factor(datos$habitaciones)
datos$Banos          <- as.numeric(as.character(datos$Banos))
datos$Garajes        <- as.numeric(datos$Garajes)
datos$Elevadores     <- as.numeric(datos$Elevadores)
datos$Precio         <- as.numeric(gsub("[^0-9]", "", as.character(datos$Precio)))

message("=== Datos cargados: ", nrow(datos), " registros, ", ncol(datos), " columnas ===")
message("Columnas: ", paste(names(datos), collapse = ", "))