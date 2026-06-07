# ============================================================
# 06_ic_media_admin.R — Puntos 9 y 10 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 9: Prueba de hipotesis - Media admin estrato 3 < $200.000 (90%)")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

admin_estrato3 <- datos$Administracion[datos$Estrato == 3]
cat("n =", length(admin_estrato3),
    " | Media =", round(mean(admin_estrato3), 2),
    " | Desv.Est =", round(sd(admin_estrato3), 2), "\n")

test9 <- t.test(admin_estrato3, mu = 200000, alternative = "less", conf.level = 0.90)
cat("\n---> Resultado:\n")
cat("t =", round(test9$statistic, 4), "\n")
cat("gl =", test9$parameter, "\n")
cat("p-valor =", format(test9$p.value, scientific = TRUE), "\n")
cat("IC 90% para la media: [", round(test9$conf.int[1], 2), ", ", round(test9$conf.int[2], 2), "]\n")
cat("Media muestral:", round(test9$estimate, 2), "\n")

cat("\n---> Interpretacion:\n")
if (test9$p.value < 0.10) {
  cat("Con p-valor =", format(test9$p.value, scientific = TRUE), "y alpha = 0.10,\n")
  cat("se RECHAZA H0. El precio medio de administracion del estrato 3\n")
  cat("es MENOR que $200.000.\n")
} else {
  cat("Con p-valor =", format(test9$p.value, scientific = TRUE), "y alpha = 0.10,\n")
  cat("NO se rechaza H0. No hay evidencia suficiente para afirmar que\n")
  cat("el precio medio de administracion del estrato 3 sea menor a $200.000.\n")
}

jpeg(filename = "scripts/punto9_admin_estrato3.jpg", width = 800, height = 600)
br <- seq(0, max(admin_estrato3) * 1.1, length.out = 25)
hist(admin_estrato3, breaks = br, col = "lightblue", border = "darkblue",
     main = "Distribucion de Administracion - Estrato 3",
     xlab = "Costo de Administracion ($)", ylab = "Frecuencia",
     xaxt = "n")
axis(1, at = seq(0, max(admin_estrato3) * 1.1, length.out = 7),
     labels = paste0("$", formatC(seq(0, max(admin_estrato3) * 1.1, length.out = 7),
                                 format = "d", big.mark = ",")))
abline(v = 200000, col = "red", lwd = 2.5, lty = 1)
abline(v = mean(admin_estrato3), col = "darkblue", lwd = 2.5, lty = 2)
legend("topright", legend = c(
  expression(H[0] * ": "* mu * " = $200,000"),
  expression(bar(x) * " = $" * phantom(0) ~ formatC(mean(admin_estrato3), format = "d", big.mark = ",")),
  paste0("IC 90%: hasta $", formatC(test9$conf.int[2], format = "d", big.mark = ","))
), col = c("red", "darkblue", "darkgreen"), lwd = 2.5, lty = c(1, 2, 3))
text(200000, max(h$counts) * 0.85, "$200,000\n(H0)", col = "red", cex = 0.9, font = 2)
dev.off()
cat("\nGrafico guardado en: scripts/punto9_admin_estrato3.jpg\n")

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 10: Prueba de hipotesis - Media admin = $250.000 (95%)")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

cat("n =", length(datos$Administracion),
    " | Media =", round(mean(datos$Administracion), 2),
    " | Desv.Est =", round(sd(datos$Administracion), 2), "\n")

test10 <- t.test(datos$Administracion, mu = 250000, conf.level = 0.95)
cat("\n---> Resultado:\n")
cat("t =", round(test10$statistic, 4), "\n")
cat("gl =", test10$parameter, "\n")
cat("p-valor =", format(test10$p.value, scientific = TRUE), "\n")
cat("IC 95% para la media: [", round(test10$conf.int[1], 2), ", ", round(test10$conf.int[2], 2), "]\n")
cat("Media muestral:", round(test10$estimate, 2), "\n")

cat("\n---> Interpretacion:\n")
if (test10$p.value < 0.05) {
  cat("Con p-valor =", format(test10$p.value, scientific = TRUE), "y alpha = 0.05,\n")
  cat("se RECHAZA H0. El precio medio de administracion es\n")
  cat("DIFERENTE de $250.000.\n")
} else {
  cat("Con p-valor =", format(test10$p.value, scientific = TRUE), "y alpha = 0.05,\n")
  cat("NO se rechaza H0. No hay evidencia suficiente para afirmar que\n")
  cat("el precio medio de administracion sea diferente de $250.000.\n")
}

jpeg(filename = "scripts/punto10_admin_todos.jpg", width = 800, height = 600)
br2 <- seq(0, max(datos$Administracion) * 1.1, length.out = 30)
h2 <- hist(datos$Administracion, breaks = br2, col = "lightyellow", border = "darkorange",
          main = "Distribucion de Administracion - Todos los Inmuebles",
          xlab = "Costo de Administracion ($)", ylab = "Frecuencia",
          xaxt = "n")
axis(1, at = seq(0, max(datos$Administracion) * 1.1, length.out = 8),
     labels = paste0("$", formatC(seq(0, max(datos$Administracion) * 1.1, length.out = 8),
                                 format = "d", big.mark = ",")))
abline(v = 250000, col = "red", lwd = 2.5, lty = 1)
abline(v = mean(datos$Administracion), col = "darkblue", lwd = 2.5, lty = 2)
polygon(c(rep(test10$conf.int[1], 2), rep(test10$conf.int[2], 2)),
        c(0, max(h2$counts) * 0.15, max(h2$counts) * 0.15, 0),
        col = rgb(0, 0.5, 0, 0.2), border = NA)
segments(test10$conf.int[1], max(h2$counts) * 0.075,
         test10$conf.int[2], max(h2$counts) * 0.075,
         col = "darkgreen", lwd = 3)
legend("topright", legend = c(
  expression(H[0] * ": "* mu * " = $250,000"),
  expression(bar(x) * " = $" ~ formatC(mean(datos$Administracion), format = "d", big.mark = ",")),
  "IC 95%"
), col = c("red", "darkblue", "darkgreen"), lwd = 2.5, lty = c(1, 2, 1))
text(250000, max(h2$counts) * 0.85, "$250,000\n(H0)", col = "red", cex = 0.9, font = 2)
dev.off()
cat("\nGrafico guardado en: scripts/punto10_admin_todos.jpg\n")