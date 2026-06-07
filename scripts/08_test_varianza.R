# ============================================================
# 08_test_varianza.R — Punto 13 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 13: La desviacion estandar de administracion aumento vs $200.836")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

sigma_0 <- 200836
var_0   <- sigma_0^2
admin   <- datos$Administracion
n       <- length(admin)
s2      <- var(admin)
s       <- sd(admin)

cat("n =", n, "\n")
cat("Varianza muestral (s2) =", round(s2, 2), "\n")
cat("Varianza de referencia (sigma0^2) =", round(var_0, 2), "\n")
cat("Desv.Est. muestral (s) =", round(s, 2), "\n")
cat("Desv.Est. de referencia (sigma0) =", sigma_0, "\n\n")

cat("---> Planteamiento de hipotesis:\n")
cat("H0: sigma^2 =", var_0, "(la varianza NO aumento)\n")
cat("H1: sigma^2 >", var_0, "(la varianza AUMENTO)\n")
cat("Nivel de significancia: alpha = 0.05\n\n")

chi_stat <- (n - 1) * s2 / var_0
gl <- n - 1
p_val <- 1 - pchisq(chi_stat, gl)

cat("---> Resultado (test chi-cuadrado):\n")
cat("Estadistico chi-cuadrado =", round(chi_stat, 4), "\n")
cat("Grados de libertad =", gl, "\n")
cat("p-valor =", format(p_val, scientific = TRUE), "\n\n")

cat("---> Intervalo de confianza para la varianza:\n")
alpha_ic <- 0.05
chi_low  <- qchisq(alpha_ic / 2, gl)
chi_up   <- qchisq(1 - alpha_ic / 2, gl)
ic_var_low  <- (n - 1) * s2 / chi_up
ic_var_high <- (n - 1) * s2 / chi_low
cat("IC 95% para varianza: [", round(ic_var_low, 2), ", ", round(ic_var_high, 2), "]\n")
cat("IC 95% para desv.est: [", round(sqrt(ic_var_low), 2), ", ", round(sqrt(ic_var_high), 2), "]\n")

cat("\n---> Interpretacion:\n")
if (p_val < 0.05) {
  cat("Con p-valor =", format(p_val, scientific = TRUE),
      "y alpha = 0.05, se RECHAZA H0.\n")
  cat("La desviacion estandar de la administracion HA AUMENTADO\n")
  cat("respecto al valor de referencia $200.836.\n")
} else {
  cat("Con p-valor =", format(p_val, scientific = TRUE),
      "y alpha = 0.05, NO se rechaza H0.\n")
  cat("NO hay evidencia suficiente para afirmar que la desviacion estandar\n")
  cat("de la administracion haya aumentado respecto a $200.836.\n")
}

jpeg(filename = "scripts/punto13_varianza.jpg", width = 800, height = 600)
mu <- mean(admin)
curve(dnorm(x, mean = mu, sd = sigma_0), from = mu - 4 * sigma_0,
      to = mu + 4 * sigma_0, lwd = 2.5, col = "red",
      main = "Comparacion de Dispersion: Desv.Est. Referencia vs Muestral",
      xlab = "Costo de Administracion ($)", ylab = "Densidad")
curve(dnorm(x, mean = mu, sd = s), from = mu - 4 * sigma_0,
      to = mu + 4 * sigma_0, lwd = 2.5, col = "darkblue", add = TRUE)
legend("topright", legend = c(
  expression(sigma[0] * " = $200,836 (referencia)"),
  expression(s~" = $" ~ formatC(s, format = "d", big.mark = ",") * " (muestral)")
), col = c("red", "darkblue"), lwd = 2.5)
text(mu + 3.5 * sigma_0, dnorm(mu + 3.5 * sigma_0, mu, sigma_0) * 0.7,
     "La curva azul (muestral)\nes menos dispersa:\nla varianza NO aumento",
     col = "darkblue", cex = 0.85, font = 2)
dev.off()
cat("\nGrafico guardado en: scripts/punto13_varianza.jpg\n")