# ============================================================
# 05_contingencia.R — Punto 8 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 8: Tabla de contingencia REMODELADO x ELEVADORES")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

tabla_cont <- table(datos$Remodelado, datos$Elevadores, dnn = c("Remodelado", "Elevadores"))
cat("Tabla de frecuencias observadas:\n")
print(tabla_cont)

r <- tabla_frec_2var(datos, "Remodelado", "Elevadores")

cat("\nProporciones por fila (Remodelado):\n")
print(r$prop_fila)

cat("\nProporciones del total:\n")
print(r$prop_total)

chi <- chisq.test(tabla_cont)
cat("\n---> Test de chi-cuadrado:\n")
cat("Estadistico X-squared:", round(chi$statistic, 4), "\n")
cat("p-valor:", format(chi$p.value, scientific = TRUE), "\n")
cat("Grados de libertad:", chi$parameter, "\n")

if (any(chi$expected < 5)) {
  cat("\n(Algunas celdas tienen frecuencia esperada < 5. Se usa Fisher exacto)\n")
  fisher <- fisher.test(tabla_cont)
  cat("\n---> Test exacto de Fisher:\n")
  cat("p-valor:", format(fisher$p.value, scientific = TRUE), "\n")
  test_inf <- fisher
} else {
  test_inf <- chi
}

cat("\n---> Interpretacion:\n")
if (test_inf$p.value < 0.05) {
  cat("Con p-valor =", format(test_inf$p.value, scientific = TRUE),
      "se rechaza H0 al 5%.\n")
  cat("Existe asociacion estadisticamente significativa entre\n")
  cat("remodelado y numero de elevadores.\n")
} else {
  cat("Con p-valor =", format(test_inf$p.value, scientific = TRUE),
      "no se rechaza H0 al 5%.\n")
  cat("NO existe evidencia de asociacion significativa entre\n")
  cat("remodelado y numero de elevadores.\n")
}

jpeg(filename = "scripts/punto8_contingencia.jpg", width = 800, height = 600)
tabla_t <- table(datos$Remodelado, datos$Elevadores)
barplot(tabla_t, beside = TRUE, col = c("lightcoral", "lightgreen"),
        border = c("darkred", "darkgreen"),
        main = "Remodelado vs Numero de Elevadores",
        xlab = "Numero de Elevadores", ylab = "Frecuencia",
        legend = c("No Remodelado", "Remodelado"), args.legend = list(x = "topright"))
dev.off()
cat("\nGrafico guardado en: scripts/punto8_contingencia.jpg\n")