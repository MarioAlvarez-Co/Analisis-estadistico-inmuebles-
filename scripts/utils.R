# ============================================================
# utils.R — Funciones auxiliares (solo R base)
# ============================================================

moda <- function(x) {
  x <- x[!is.na(x)]
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

tabla_frec <- function(x, nombre = "Variable") {
  freq <- table(x, useNA = "no")
  rel   <- prop.table(freq) * 100
  acum  <- cumsum(rel)
  data.frame(
    Categoria = names(freq),
    fi = as.integer(freq),
    hi = round(as.numeric(rel), 2),
    Hi = round(as.numeric(acum), 2)
  )
}

tabla_frec_agrupada <- function(x, nombre = "Variable", n_clases = 8) {
  min_x <- min(x, na.rm = TRUE)
  max_x <- max(x, na.rm = TRUE)
  cortes  <- seq(min_x, max_x, length.out = n_clases + 1)
  intervalos <- cut(x, breaks = cortes, right = FALSE)
  freq   <- table(intervalos, useNA = "no")
  rel    <- prop.table(freq) * 100
  acum   <- cumsum(rel)
  marcas <- (cortes[-1] + cortes[-length(cortes)]) / 2
  fmt <- function(v) format(round(v, 0), big.mark = ",", scientific = FALSE)
  nombres_limpios <- paste0("[", fmt(cortes[-length(cortes)]), " - ", fmt(cortes[-1]), ")")
  data.frame(
    Intervalo = nombres_limpios[seq_along(freq)],
    ni = as.integer(freq),
    hi = round(as.numeric(rel), 2),
    Ni = round(as.numeric(acum), 2),
    Marca = marcas[seq_along(freq)]
  )
}

tabla_frec_2var <- function(df, var1, var2) {
  t <- table(df[[var1]], df[[var2]])
  prop_r  <- round(prop.table(t, margin = 1) * 100, 2)
  prop_c  <- round(prop.table(t, margin = 2) * 100, 2)
  prop_t  <- round(prop.table(t) * 100, 2)
  list(tabla = t, prop_fila = prop_r, prop_col = prop_c, prop_total = prop_t)
}