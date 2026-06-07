# ============================================================
# 07_ic_proporciones.R — Puntos 11 y 12 (solo R base)
# ============================================================

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 11: IC 99% para proporcion de APARTAMENTOS remodelados y no remodelados")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

apartamentos <- datos[datos$Inmueble == "Apartamento", ]
n_total <- nrow(apartamentos)
n_remodelado    <- sum(apartamentos$Remodelado == "Si")
n_no_remodelado <- sum(apartamentos$Remodelado == "No")
p_remodelado    <- n_remodelado / n_total
p_no_remodelado <- n_no_remodelado / n_total

cat("Total apartamentos:", n_total, "\n")
cat("Remodelados (Si):", n_remodelado, "| Proporcion:", round(p_remodelado * 100, 2), "%\n")
cat("No remodelados (No):", n_no_remodelado, "| Proporcion:", round(p_no_remodelado * 100, 2), "%\n\n")

ic_99_si <- prop.test(n_remodelado, n_total, conf.level = 0.99)
ic_99_no <- prop.test(n_no_remodelado, n_total, conf.level = 0.99)

cat("---> IC 99% para proporcion de APARTAMENTOS REMODELADOS:\n")
cat("  Limite inferior:", round(ic_99_si$conf.int[1] * 100, 2), "%\n")
cat("  Limite superior:", round(ic_99_si$conf.int[2] * 100, 2), "%\n")
cat("  Proporcion estimada:", round(p_remodelado * 100, 2), "%\n\n")

cat("---> IC 99% para proporcion de APARTAMENTOS NO REMODELADOS:\n")
cat("  Limite inferior:", round(ic_99_no$conf.int[1] * 100, 2), "%\n")
cat("  Limite superior:", round(ic_99_no$conf.int[2] * 100, 2), "%\n")
cat("  Proporcion estimada:", round(p_no_remodelado * 100, 2), "%\n")

cat("\n---> Interpretacion:\n")
cat("Con 99% de confianza, la proporcion verdadera de apartamentos\n")
cat("remodelados se encuentra entre", round(ic_99_si$conf.int[1] * 100, 2),
    "% y", round(ic_99_si$conf.int[2] * 100, 2), "%.\n")
cat("Para los no remodelados, entre", round(ic_99_no$conf.int[1] * 100, 2),
    "% y", round(ic_99_no$conf.int[2] * 100, 2), "%.\n")

message("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
message("PUNTO 12: IC 95% para proporcion de inmuebles con MAS DE 1 bano")
message("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")

n_total_12 <- nrow(datos)
n_mas1bano <- sum(datos$Banos > 1)
p_mas1bano <- n_mas1bano / n_total_12

cat("Inmuebles con mas de 1 bano:", n_mas1bano,
    "| Proporcion:", round(p_mas1bano * 100, 2), "%\n")

ic_95 <- prop.test(n_mas1bano, n_total_12, conf.level = 0.95)

cat("---> IC 95% para proporcion de inmuebles con mas de 1 bano:\n")
cat("  Limite inferior:", round(ic_95$conf.int[1] * 100, 2), "%\n")
cat("  Limite superior:", round(ic_95$conf.int[2] * 100, 2), "%\n")
cat("  Proporcion estimada:", round(p_mas1bano * 100, 2), "%\n")

cat("\n---> Interpretacion:\n")
cat("Con 95% de confianza, la proporcion verdadera de inmuebles\n")
cat("con mas de 1 bano se encuentra entre",
    round(ic_95$conf.int[1] * 100, 2), "% y",
    round(ic_95$conf.int[2] * 100, 2), "%.\n")

jpeg(filename = "scripts/punto11_remodelados.jpg", width = 800, height = 600)
proporciones <- c(p_remodelado * 100, p_no_remodelado * 100)
li <- c(ic_99_si$conf.int[1] * 100, ic_99_no$conf.int[1] * 100)
ls <- c(ic_99_si$conf.int[2] * 100, ic_99_no$conf.int[2] * 100)
bp <- barplot(proporciones, beside = TRUE,
              col = c("lightgreen", "lightcoral"),
              border = c("darkgreen", "darkred"),
              main = "Proporcion de Apartamentos Remodelados (IC 99%)",
              ylab = "Proporcion (%)", xlab = "",
              names.arg = c("Remodelados", "No Remodelados"),
              ylim = c(0, 80),
              las = 1)
arrows(bp, li, bp, ls, angle = 90, code = 3,
       length = 0.15, lwd = 2, col = c("darkgreen", "darkred"))
text(bp, proporciones + 3, labels = paste0(round(proporciones, 1), "%"),
     col = "black", font = 2, cex = 1.1)
legend("topright", legend = c(
  paste0("Remodelados: ", round(p_remodelado*100,1), "% [", round(li[1],1), "% - ", round(ls[1],1), "%]"),
  paste0("No Remodelados: ", round(p_no_remodelado*100,1), "% [", round(li[2],1), "% - ", round(ls[2],1), "%]")
), bg = "white", cex = 0.9)
dev.off()
cat("\nGrafico guardado en: scripts/punto11_remodelados.jpg\n")

jpeg(filename = "scripts/punto12_mas1bano.jpg", width = 800, height = 600)
prop12 <- p_mas1bano * 100
li12 <- ic_95$conf.int[1] * 100
ls12 <- ic_95$conf.int[2] * 100
bp2 <- barplot(prop12, beside = TRUE,
              col = "steelblue", border = "darkblue",
              main = "Proporcion de Inmuebles con Mas de 1 Bano (IC 95%)",
              ylab = "Proporcion (%)", xlab = "",
              names.arg = "Mas de 1 bano",
              ylim = c(0, 80), las = 1)
arrows(bp2, li12, bp2, ls12, angle = 90, code = 3,
       length = 0.15, lwd = 2.5, col = "darkblue")
text(bp2, prop12 + 3, labels = paste0(round(prop12, 1), "%"),
     col = "black", font = 2, cex = 1.3)
text(bp2, li12 - 3, labels = paste0(round(li12, 1), "%"), col = "darkblue", cex = 0.85)
text(bp2, ls12 + 3, labels = paste0(round(ls12, 1), "%"), col = "darkblue", cex = 0.85)
dev.off()
cat("\nGrafico guardado en: scripts/punto12_mas1bano.jpg\n")