# ============================================================
# 09_test_proporcion.R — Punto 14 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 14: Proporcion estrato 2 > proporcion estrato 4")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

n_total <- nrow(datos)
n_estrato2 <- sum(datos$Estrato == 2)
n_estrato4 <- sum(datos$Estrato == 4)
p_estrato2 <- n_estrato2 / n_total
p_estrato4 <- n_estrato4 / n_total

cat("n total =", n_total, "\n")
cat("Estrato 2: n =", n_estrato2, "| Proporcion =", round(p_estrato2 * 100, 2), "%\n")
cat("Estrato 4: n =", n_estrato4, "| Proporcion =", round(p_estrato4 * 100, 2), "%\n\n")

cat("---> Planteamiento de hipotesis:\n")
cat("H0: p2 <= p4 (proporcion estrato 2 <= proporcion estrato 4)\n")
cat("H1: p2 > p4 (proporcion estrato 2 > proporcion estrato 4)\n")
cat("Nivel de significancia: alpha = 0.05\n\n")

test_prop <- prop.test(c(n_estrato2, n_estrato4),
                       c(n_total, n_total),
                       alternative = "greater", conf.level = 0.95)

cat("---> Resultado:\n")
cat("Estadistico chi-cuadrado =", round(test_prop$statistic, 4), "\n")
cat("p-valor =", format(test_prop$p.value, scientific = TRUE), "\n")
cat("gl = 1\n")

cat("\n---> Interpretacion:\n")
if (test_prop$p.value < 0.05) {
  cat("Con p-valor =", format(test_prop$p.value, scientific = TRUE),
      "y alpha = 0.05, se RECHAZA H0.\n")
  cat("La proporcion de inmuebles estrato 2 es MAYOR que la de estrato 4.\n")
} else {
  cat("Con p-valor =", format(test_prop$p.value, scientific = TRUE),
      "y alpha = 0.05, NO se rechaza H0.\n")
  cat("NO hay evidencia suficiente para afirmar que la proporcion\n")
  cat("de inmuebles estrato 2 sea mayor que la de estrato 4.\n")
}

jpeg(filename = "scripts/punto14_estrato2vs4.jpg", width = 800, height = 600)
props <- c(p_estrato2 * 100, p_estrato4 * 100)
bp3 <- barplot(props, beside = TRUE,
               col = c("lightblue", "lightyellow"),
               border = c("darkblue", "orange"),
               main = "Proporcion de Inmuebles: Estrato 2 vs Estrato 4",
               ylab = "Proporcion (%)", xlab = "",
               names.arg = c("Estrato 2", "Estrato 4"),
               ylim = c(0, 45), las = 1)
text(bp3, props + 2, labels = paste0(round(props, 1), "%"),
     col = "black", font = 2, cex = 1.2)
text(bp3[1], props[1] / 2, paste0("n=", n_estrato2), col = "white", font = 2, cex = 1)
text(bp3[2], props[2] / 2, paste0("n=", n_estrato4), col = "black", font = 2, cex = 1)
pval_str <- if (test_prop$p.value < 0.001) "< 0.001" else paste0("= ", round(test_prop$p.value, 4))
text(mean(bp3), max(props) + 4,
     paste0("p-valor ", pval_str, " (H1: p2 > p4)"),
     col = "darkred", font = 2, cex = 1)
dev.off()
cat("\nGrafico guardado en: scripts/punto14_estrato2vs4.jpg\n")