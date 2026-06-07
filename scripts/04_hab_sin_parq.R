# ============================================================
# 04_hab_sin_parq.R — Punto 7 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 7: Frecuencia de habitaciones en inmuebles SIN parqueadero")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

sin_parq <- datos[datos$Parqueadero == "No", ]
tf_hab <- tabla_frec(sin_parq$habitaciones, "Habitaciones sin Parqueadero")
names(tf_hab)[1] <- "Habitaciones"

print(tf_hab)

imax_h <- which.max(tf_hab$fi)
imin_h <- which.min(tf_hab$fi)

cat("\n---> Interpretacion:\n")
cat("La cantidad de habitaciones con MAYOR proporcion entre los inmuebles\n")
cat("sin parqueadero es:", as.character(tf_hab$Habitaciones[imax_h]),
    "con", tf_hab$fi[imax_h], "inmuebles (", tf_hab$hi[imax_h], "%).\n")
cat("La cantidad de habitaciones con MENOR proporcion es:",
    as.character(tf_hab$Habitaciones[imin_h]),
    "con", tf_hab$fi[imin_h], "inmuebles (", tf_hab$hi[imin_h], "%).\n")

jpeg(filename = "scripts/punto7_hab_sin_parq.jpg", width = 800, height = 600)
barplot(table(sin_parq$habitaciones), col = "coral", border = "darkred",
        main = "Habitaciones en inmuebles SIN parqueadero",
        xlab = "Numero de habitaciones", ylab = "Frecuencia")
dev.off()
cat("\nGrafico guardado en: scripts/punto7_hab_sin_parq.jpg\n")