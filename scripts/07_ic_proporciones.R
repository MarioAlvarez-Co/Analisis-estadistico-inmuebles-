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