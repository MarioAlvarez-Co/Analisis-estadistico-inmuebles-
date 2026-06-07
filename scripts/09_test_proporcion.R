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