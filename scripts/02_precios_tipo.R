# ============================================================
# 02_precios_tipo.R — Punto 5 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 5: Analisis de PRECIOS segun TIPO DE INMUEBLE")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

resumen <- aggregate(Precio ~ Inmueble, data = datos,
                     FUN = function(x) c(n = length(x),
                                          media = mean(x),
                                          mediana = median(x),
                                          desvest = sd(x),
                                          min = min(x),
                                          max = max(x)))
resumen <- do.call(data.frame, resumen)
resumen$cv <- round((resumen$Precio.desvest / resumen$Precio.media) * 100, 2)
resumen$Precio.media   <- round(resumen$Precio.media, 0)
resumen$Precio.mediana <- round(resumen$Precio.mediana, 0)
resumen$Precio.desvest <- round(resumen$Precio.desvest, 0)
resumen$Precio.min     <- round(resumen$Precio.min, 0)
resumen$Precio.max     <- round(resumen$Precio.max, 0)
colnames(resumen) <- c("Inmueble", "n", "Media", "Mediana", "DesvEst", "Min", "Max", "CV(%)")
print(resumen)

cat("\n---> Interpretacion:\n")
imax_p <- which.max(resumen$Media)
imin_p <- which.min(resumen$Media)
imax_cv <- which.max(resumen$CV)

cat("El tipo de inmueble con MAYOR precio medio es:", as.character(resumen$Inmueble[imax_p]),
    "($", format(resumen$Media[imax_p], big.mark = ","), ")\n", sep = "")
cat("El tipo de inmueble con MENOR precio medio es:", as.character(resumen$Inmueble[imin_p]),
    "($", format(resumen$Media[imin_p], big.mark = ","), ")\n", sep = "")
cat("El tipo de inmueble con MAYOR VARIABILIDAD (CV) es:", as.character(resumen$Inmueble[imax_cv]),
    "con un CV del", resumen$CV[imax_cv], "%\n")

jpeg(filename = "scripts/punto5_precio_tipo.jpg", width = 800, height = 600)
boxplot(Precio ~ Inmueble, data = datos, col = "lightblue", border = "darkblue",
        main = "Distribucion de Precios por Tipo de Inmueble",
        xlab = "Tipo de Inmueble", ylab = "Precio",
        las = 2)
dev.off()
cat("\nGrafico guardado en: scripts/punto5_precio_tipo.jpg\n")