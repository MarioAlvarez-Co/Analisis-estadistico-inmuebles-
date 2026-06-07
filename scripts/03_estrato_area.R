# ============================================================
# 03_estrato_area.R — Punto 6 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 6: Comparacion de AREA entre estrato 5 y demas")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

estrato_5 <- datos$Area[datos$Estrato == 5]
otros      <- datos$Area[datos$Estrato != 5]

cat("Estrato 5: n =", length(estrato_5),
    " | Media =", round(mean(estrato_5), 2),
    " | Mediana =", round(median(estrato_5), 2), "\n")
cat("Otros estratos: n =", length(otros),
    " | Media =", round(mean(otros), 2),
    " | Mediana =", round(median(otros), 2), "\n")

jpeg(filename = "scripts/punto6_area_estrato.jpg", width = 800, height = 600)
datos$grupo <- ifelse(datos$Estrato == 5, "Estrato 5", "Otros")
boxplot(Area ~ grupo, data = datos, col = c("gold", "lightgreen"), border = c("darkorange", "darkgreen"),
        main = "Area: Estrato 5 vs Otros", xlab = "Grupo", ylab = "Area (m2)")
dev.off()
cat("Grafico guardado en: scripts/punto6_area_estrato.jpg\n")

cat("\n---> Test de hipotesis (alpha = 0.05):\n")
cat("H0: Area estrato 5 <= Area otros estratos\n")
cat("H1: Area estrato 5 > Area otros estratos\n\n")

cat("Nota: Shapiro-Wilks para estrato 5 indica no normalidad (p<0.05),\n")
cat("por lo que se usa test de Wilcoxon (Mann-Whitney) como prueba principal.\n\n")

test <- wilcox.test(estrato_5, otros, alternative = "greater", conf.int = TRUE)
print(test)

cat("\n---> Conclusion:\n")
if (test$p.value < 0.05) {
  cat("Con un p-valor de", round(test$p.value, 4),
      "y alpha = 0.05, SE RECHAZA H0.\n")
  cat("Existe evidencia estadistica para afirmar que el area del estrato 5\n")
  cat("es MAYOR que la de los demas estratos.\n")
} else {
  cat("Con un p-valor de", round(test$p.value, 4),
      "y alpha = 0.05, NO se rechaza H0.\n")
  cat("NO existe evidencia suficiente para afirmar que el area del estrato 5\n")
  cat("es mayor que la de los demas estratos.\n")
}