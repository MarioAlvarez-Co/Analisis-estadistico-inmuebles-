# ============================================================
# 01_descriptiva.R — Puntos 1 a 4 (solo R base)
# ============================================================
source("scripts/utils.R")

# ============================================================
# PUNTO 1 — Tabla de frecuencias de ESTRATO
# ============================================================
message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 1: Tabla de frecuencias de ESTRATO")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

tf_estrato <- tabla_frec(datos$Estrato, "Frecuencia de Estrato")
names(tf_estrato)[1] <- "Estrato"
print(tf_estrato)

cat("\n---> Interpretacion:\n")
imax <- which.max(tf_estrato$fi)
imin <- which.min(tf_estrato$fi)
cat("El estrato", as.character(tf_estrato$Estrato[imax]),
    "es el mas frecuente con", tf_estrato$fi[imax], "inmuebles (",
    tf_estrato$hi[imax], "% del total).\n")
cat("El estrato", as.character(tf_estrato$Estrato[imin]),
    "es el menos frecuente con", tf_estrato$fi[imin], "inmuebles (",
    tf_estrato$hi[imin], "%).\n")

jpeg(filename = "scripts/punto1_estrato.jpg", width = 800, height = 600)
cols <- c("1" = "#E74C3C", "2" = "#3498DB", "3" = "#2ECC71",
          "4" = "#F39C12", "5" = "#9B59B6", "6" = "#1ABC9C")
barplot(tf_estrato$fi, names.arg = tf_estrato$Estrato, col = cols[tf_estrato$Estrato],
        border = "darkgray", main = "Frecuencia de Inmuebles por Estrato",
        xlab = "Estrato", ylab = "Frecuencia", ylim = c(0, max(tf_estrato$fi) * 1.15))
for (i in seq_along(tf_estrato$fi)) {
  text(i, tf_estrato$fi[i] + 3, labels = paste0(tf_estrato$hi[i], "%"),
       col = "darkred", cex = 0.85, font = 2)
}
dev.off()
cat("\nGrafico guardado en: scripts/punto1_estrato.jpg\n")

# ============================================================
# PUNTO 2 — Grafico de frecuencias de BANOS
# ============================================================
message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 2: Grafico de frecuencias de BANOS")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

tf_banos <- tabla_frec(datos$Banos, "Frecuencia de Banos")
names(tf_banos)[1] <- "Banos"
print(tf_banos)

jpeg(filename = "scripts/punto2_banos.jpg", width = 800, height = 600)
barplot(tf_banos$fi, names.arg = tf_banos$Banos, col = "lightblue",
        border = "darkblue", main = "Frecuencia de Numero de Banos",
        xlab = "Numero de banos", ylab = "Frecuencia")
dev.off()
cat("\nGrafico guardado en: scripts/punto2_banos.jpg\n")

cat("\n---> Interpretacion:\n")
imax_b <- which.max(tf_banos$fi)
cat("La cantidad de banos mas frecuente es", as.character(tf_banos$Banos[imax_b]),
    "con", tf_banos$fi[imax_b], "inmuebles (", tf_banos$hi[imax_b], "%).\n")

# ============================================================
# PUNTO 3 — Tabla de frecuencias agrupadas de ADMINISTRACION
# ============================================================
message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 3: Tabla de frecuencias agrupadas de ADMINISTRACION")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

tf_admin <- tabla_frec_agrupada(datos$Administracion, "Administracion", n_clases = 10)
print(tf_admin)

cat("\n---> Interpretacion:\n")
imax_a <- which.max(tf_admin$ni)
cat("El intervalo con mayor concentracion de datos es:", as.character(tf_admin$Intervalo[imax_a]),
    "con", tf_admin$ni[imax_a], "inmuebles (", tf_admin$hi[imax_a], "%).\n")
cat("La dispersion se observa en la variacion de las frecuencias relativas\n")
cat("a traves de los diferentes intervalos de administracion.\n")

jpeg(filename = "scripts/punto3_admin.jpg", width = 800, height = 600)
h <- hist(datos$Administracion, breaks = 10, col = "lightyellow", border = "darkblue",
          main = "Distribucion del Costo de Administracion",
          xlab = "Costo de Administracion ($)", ylab = "Frecuencia",
          xaxt = "n")
axis(1, at = h$mids, labels = paste0("$", formatC(h$mids, format = "d", big.mark = ",")))
abline(v = c(mean(datos$Administracion), median(datos$Administracion)),
       col = c("red", "darkgreen"), lwd = 2, lty = c(1, 2))
legend("topright", legend = c(paste0("Media: $", formatC(mean(datos$Administracion), format = "d", big.mark = ",")),
                              paste0("Mediana: $", formatC(median(datos$Administracion), format = "d", big.mark = ","))),
       col = c("red", "darkgreen"), lwd = 2, lty = c(1, 2))
dev.off()
cat("\nGrafico guardado en: scripts/punto3_admin.jpg\n")

# ============================================================
# PUNTO 4 — Medidas para ANTIGUEDAD
# ============================================================
message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 4: Analisis de ANTIGUEDAD")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

x <- datos$Antiguedad
n <- length(x)

# Asimetria y curtosis manuales
m2 <- sum((x - mean(x))^2) / n
m3 <- sum((x - mean(x))^3) / n
m4 <- sum((x - mean(x))^4) / n
s  <- sd(x)
asimetria <- m3 / (s^3)
curtosis   <- m4 / (s^4) - 3

medidas <- data.frame(
  Medida = c("Media", "Mediana", "Moda", "Desviacion Estandar",
             "Varianza", "Coef. Variacion (%)", "Min", "Max", "Rango",
             "Asimetria", "Curtosis"),
  Valor = round(c(
    mean(x, na.rm = TRUE),
    median(x, na.rm = TRUE),
    moda(x),
    s,
    var(x, na.rm = TRUE),
    (s / mean(x, na.rm = TRUE)) * 100,
    min(x, na.rm = TRUE),
    max(x, na.rm = TRUE),
    max(x, na.rm = TRUE) - min(x, na.rm = TRUE),
    asimetria,
    curtosis
  ), 2)
)

print(medidas)

cat("\n---> Interpretacion integral:\n")
media_ant   <- medidas$Valor[medidas$Medida == "Media"]
mediana_ant <- medidas$Valor[medidas$Medida == "Mediana"]
cv_val      <- medidas$Valor[medidas$Medida == "Coef. Variacion (%)"]

if (asimetria > 0.5) {
  cat("La distribucion es ASIMETRICA A LA DERECHA (g1 =", round(asimetria, 3), ").\n")
  cat("La media (", media_ant, ") es mayor que la mediana (", mediana_ant, "),\n")
  cat("indicando que valores extremos puxxlan la media hacia la derecha.\n")
} else if (asimetria < -0.5) {
  cat("La distribucion es ASIMETRICA A LA IZQUIERDA (g1 =", round(asimetria, 3), ").\n")
} else {
  cat("La distribucion es APROXIMADAMENTE SIMETRICA (g1 =", round(asimetria, 3), ").\n")
}

if (curtosis > 0) {
  cat("La curtosis =", round(curtosis, 3), "indica una distribucion LEPTOCURTICA\n")
  cat("(mas concentrada en el centro que la distribucion normal).\n")
} else if (curtosis < 0) {
  cat("La curtosis =", round(curtosis, 3), "indica una distribucion PLATICURTICA\n")
  cat("(menos concentrada en el centro que la distribucion normal).\n")
} else {
  cat("La curtosis =", round(curtosis, 3), "indica una distribucion MESOCURTICA.\n")
}

cat("El coeficiente de variacion =", round(cv_val, 2),
    "% indica una dispersion ",
    ifelse(cv_val < 30, "RELATIVAMENTE BAJA", "RELATIVAMENTE ALTA"),
    " respecto a la media.\n", sep = "")

jpeg(filename = "scripts/punto4_antiguedad.jpg", width = 800, height = 600)
hist(datos$Antiguedad, freq = FALSE, col = "lightgreen", border = "darkgreen",
     main = "Distribucion de Antiguedad de Inmuebles",
     xlab = "Anos de Antiguedad", ylab = "Densidad",
     xlim = c(-2, 42), ylim = c(0, 0.06))
curve(dnorm(x, mean = mean(datos$Antiguedad), sd = sd(datos$Antiguedad)),
      from = -2, to = 42, add = TRUE, col = "darkblue", lwd = 2)
abline(v = media_ant, col = "red", lwd = 2, lty = 1)
abline(v = mediana_ant, col = "orange", lwd = 2, lty = 2)
legend("topright", legend = c(paste0("Media: ", media_ant, " anos"),
                              paste0("Mediana: ", mediana_ant, " anos"),
                              "Curva normal teorica"),
       col = c("red", "orange", "darkblue"), lwd = 2, lty = c(1, 2, 1))
text(media_ant + 2, 0.05, expression(bar(x) > median), col = "red", cex = 1.1)
dev.off()
cat("\nGrafico guardado en: scripts/punto4_antiguedad.jpg\n")