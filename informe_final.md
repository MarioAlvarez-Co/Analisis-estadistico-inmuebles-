# Informe Final — Analisis de Inmuebles Bogota 2023

**Muestra:** 350 inmuebles | **Grupo:** 08 | **Fecha:** Junio 2026

---

## 1. Resultados por Punto

### Punto 1 — Tabla de frecuencias de ESTRATO

| Estrato | fi | hi (%) | Hi (%) |
|---------|----|--------|--------|
| 1 | 14 | 4.00 | 4.00 |
| 2 | 113 | 32.29 | 36.29 |
| 3 | 115 | 32.86 | 69.14 |
| 4 | 60 | 17.14 | 86.29 |
| 5 | 33 | 9.43 | 95.71 |
| 6 | 15 | 4.29 | 100.00 |

**Interpretacion:** Los estratos 2 y 3 concentran el 65.15% de los inmuebles. El estrato 1 tiene la menor participacion (4%).

---

### Punto 2 — Grafico de frecuencias de BANOS

**Imagen:** `scripts/punto2_banos.jpg`

| Banos | fi | hi (%) |
|-------|----|--------|
| 1 | 169 | 48.29 |
| 2 | 152 | 43.43 |
| 3 | 26 | 7.43 |
| 4 | 3 | 0.86 |

**Interpretacion:** El 91.7% de los inmuebles tienen 1 o 2 banos. Predominan los inmuebles de 1 bano (48.3%).

---

### Punto 3 — Tabla de frecuencias agrupadas de ADMINISTRACION

| Intervalo | ni | hi (%) | Ni (%) | Marca |
|-----------|----|--------|--------|-------|
| [ 41,001 - 180,201) | 228 | 65.33 | 65.33 | 110,601 |
| [ 180,201 - 319,401) | 44 | 12.61 | 77.94 | 249,801 |
| [ 319,401 - 458,601) | 40 | 11.46 | 89.40 | 389,001 |
| [ 458,601 - 597,801) | 22 | 6.30 | 95.70 | 528,201 |
| [ 597,801 - 737,000) | 10 | 2.87 | 98.57 | 667,401 |
| [ 876,200 - 1,015,400) | 5 | 1.43 | 100.00 | 945,800 |
| [ 737,000 - 876,200) y superiores | 0 | 0.00 | -- | -- |

**Interpretacion:** El 65.3% paga entre $41K y $180K de administracion. Solo el 4.3% supera los $597K.

---

### Punto 4 — Medidas de ANTIGUEDAD

| Medida | Valor |
|--------|-------|
| Media | 13.76 anos |
| Mediana | 12.50 anos |
| Moda | 5 anos |
| Desviacion Estandar | 9.21 |
| Varianza | 84.85 |
| Coef. Variacion | 66.94% |
| Minimo | 0 anos |
| Maximo | 40 anos |
| Asimetria (g1) | 0.831 |
| Curtosis (g2) | 0.123 |

**Interpretacion:** Distribucion asimetrica a la derecha (g1=0.83): la media (13.76) supera la mediana (12.5) por la presencia de inmuebles antiguos que jalan el promedio. Curtosis leptocurtica (g2=0.12): los datos estan mas concentrados en torno a la media que en una distribucion normal. El CV del 66.9% revela una **alta dispersion**, reflejando un mercado con inmuebles desde 0 hasta 40 anos de antiguedad.

---

### Punto 5 — Precios por TIPO DE INMUEBLE

**Imagen:** `scripts/punto5_precio_tipo.jpg` (boxplot comparativo)

| Tipo | n | Media ($) | Mediana ($) | Desv.Est ($) | CV (%) |
|------|---|-----------|-------------|---------------|--------|
| Apartamento | 331 | 255,751,167 | 195,000,000 | 151,657,083 | 59.30 |
| Casa con conjunto cerrado | 18 | 218,081,111 | 190,500,000 | 75,653,184 | 34.69 |
| Casa | 1 | 167,613,000 | 167,613,000 | NA | NA |

**Interpretacion:**
- **Mayor precio medio:** Apartamento ($255.7M), 17.3% mas que casa con conjunto cerrado.
- **Menor precio medio:** Casa ($167.6M), aunque n=1 limita la comparacion.
- **Mayor variabilidad:** Apartamento (CV=59.3%), casi el doble que casa con conjunto cerrado (34.7%).

---

### Punto 6 — Area: Estrato 5 vs Otros

**Imagen:** `scripts/punto6_area_estrato.jpg` (boxplot comparativo)

| Grupo | n | Media (m2) | Mediana (m2) |
|-------|---|------------|--------------|
| Estrato 5 | 33 | 82.15 | 76 |
| Otros estratos | 317 | 56.04 | 51 |

**Test:** Wilcoxon (Mann-Whitney), unilateral, alpha=0.05  
**W = 8751, p-valor = 9.67e-11**

**Conclusion:** SE RECHAZA H0. Existe evidencia estadistica contundente para afirmar que **el area de los inmuebles del estrato 5 es mayor que la de los demas estratos**. La diferencia en localizacion estimada es de 25 m2.

---

### Punto 7 — Habitaciones en inmuebles SIN parqueadero

**Imagen:** `scripts/punto7_hab_sin_parq.jpg`

| Habitaciones | fi | hi (%) |
|-------------|----|--------|
| 1 | 8 | 10.00 |
| 2 | 25 | 31.25 |
| 3 | 43 | 53.75 |
| 4 | 4 | 5.00 |

**Interpretacion:** En los 80 inmuebles sin parqueadero, la mayoria tiene 3 habitaciones (53.8%). Solo el 10% tiene 1 habitacion y el 5% tiene 4.

---

### Punto 8 — Tabla de contingencia: REMODELADO x ELEVADORES

| Remodelado | 0 | 1 | 2 | 3 | Total |
|------------|---|---|---|---|-------|
| No | 109 (63%) | 51 (29%) | 10 (6%) | 3 (2%) | 173 |
| Si | 70 (40%) | 83 (47%) | 15 (8%) | 9 (5%) | 177 |

**Test:** Chi-cuadrado de independencia  
**X-squared = 20.10, gl = 3, p-valor = 1.62e-04**

**Conclusion:** SE RECHAZA H0. Existe una **asociacion estadisticamente significativa** entre remodelado y numero de elevadores. Los inmuebles no remodelados tienden a tener 0 elevadores (63%), mientras que los remodelados se distribuyen mas entre 0 y 1 elevador (40% y 47% respectivamente).

---

### Punto 9 — Media de Administracion Estrato 3 < $200,000

| Parametro | Valor |
|-----------|-------|
| n | 115 |
| Media muestral | $149,362 |
| Desv.Est | $66,260 |
| Nivel de confianza | 90% |
| H1 | mu < $200,000 |

**Test:** t unilateral, t = -8.20, gl = 114, **p-valor = 2.06e-13**

**Conclusion:** SE RECHAZA H0. Con 90% de confianza, el **precio medio de administracion del estrato 3 es menor a $200,000**. El IC unilateral superior es $157,326, muy por debajo de $200,000.

---

### Punto 10 — Media de Administracion = $250,000

| Parametro | Valor |
|-----------|-------|
| n | 350 |
| Media muestral | $206,073 |
| Desv.Est | $189,968 |
| Nivel de confianza | 95% |
| IC 95% | [$186,102 , $226,045] |
| H1 | mu != $250,000 |

**Test:** t bilateral, t = -4.33, gl = 349, **p-valor = 1.99e-05**

**Conclusion:** SE RECHAZA H0. El **precio medio de administracion es estadisticamente diferente de $250,000**. El IC 95% [$186,102 , $226,045] no contiene el valor de referencia, confirmando que la media real esta por debajo.

---

### Punto 11 — IC 99% para Proporcion de Apartamentos Remodelados

| Categoria | n | Proporcion | IC 99% |
|-----------|----|-----------|--------|
| Remodelados (Si) | 170 / 331 | 51.36% | [44.18% , 58.49%] |
| No remodelados (No) | 161 / 331 | 48.64% | [41.51% , 55.82%] |

**Interpretacion:** Con 99% de confianza, entre el 44.2% y el 58.5% de los apartamentos en Bogota han sido remodelados. Los intervalos se solapan, lo que sugiere que las proporciones de remodelados y no remodelados no difieren significativamente en la poblacion de apartamentos.

---

### Punto 12 — IC 95% para Proporcion de Inmuebles con Mas de 1 Bano

| Parametro | Valor |
|-----------|-------|
| Inmuebles con >1 bano | 181 / 350 |
| Proporcion estimada | 51.71% |
| IC 95% | [46.35% , 57.04%] |

**Interpretacion:** Con 95% de confianza, entre el 46.4% y el 57.0% de los inmuebles en Bogota tienen mas de 1 bano. La proporcion estimada (51.7%) sugiere un mercado dividido equitativamente entre inmuebles de 1 bano y de 2 o mas.

---

### Punto 13 — Test de Varianza de Administracion vs $200,836

| Parametro | Valor |
|-----------|-------|
| s (desv. est. muestral) | $189,968 |
| sigma_0 (referencia) | $200,836 |
| chi-cuadrado | 312.25 |
| gl | 349 |
| p-valor | 0.9218 |
| IC 95% para desv. est. | [$176,860 , $205,190] |

**Test:** Chi-cuadrado unilateral (H1: sigma^2 > sigma_0^2), alpha=0.05

**Conclusion:** NO se rechaza H0. No hay evidencia de que la **desviacion estandar de la administracion haya aumentado** respecto al valor de referencia de $200,836. De hecho, la desviacion muestral ($189,968) es menor que la referencia.

---

### Punto 14 — Proporcion Estrato 2 > Proporcion Estrato 4

| Grupo | n | Proporcion |
|-------|---|-----------|
| Estrato 2 | 113 / 350 | 32.29% |
| Estrato 4 | 60 / 350 | 17.14% |

**Test:** prop.test unilateral, chi-cuadrado = 20.76, **p-valor = 2.60e-06**

**Conclusion:** SE RECHAZA H0. La **proporcion de inmuebles de estrato 2 es significativamente mayor** que la de inmuebles de estrato 4. El estrato 2 representa casi el doble de la muestra que el estrato 4 (32.3% vs 17.1%).

---

## 2. Imagenes por Punto

| Punto | Imagen | Que mostrar en el video |
|-------|--------|------------------------|
| 2 | `scripts/punto2_banos.jpg` | Grafico de barras: frecuencia de numero de banos |
| 5 | `scripts/punto5_precio_tipo.jpg` | Boxplot comparativo: distribucion de precios por tipo de inmueble |
| 6 | `scripts/punto6_area_estrato.jpg` | Boxplot: area estrato 5 vs otros estratos |
| 7 | `scripts/punto7_hab_sin_parq.jpg` | Grafico de barras: habitaciones en inmuebles sin parqueadero |

Los puntos **1, 3, 4, 8, 9, 10, 11, 12, 13, 14** se explican mostrando las **tablas impresas en consola** y los resultados de las pruebas estadisticas (p-valores, intervalos de confianza, estadisticos de prueba).

---

## 3. Conclusiones Finales

### 3.1 Hallazgos del Analisis Descriptivo

1. **Concentracion en estratos medios:** Los estratos 2 y 3 concentran el 65.2% de los inmuebles analizados. Los estratos extremos (1 y 6) representan menos del 9% combinado, reflejando una muestra sesgada hacia los segmentos medios del mercado bogotano.

2. **Predominio de apartamentos:** 331 de 350 inmuebles (94.6%) son apartamentos, lo que indica que la muestra captura principalmente el mercado de propiedad horizontal, consistente con la densidad urbana de Bogota.

3. **Distribucion de banos:** El 91.7% de los inmuebles tiene 1 o 2 banos, con una division casi equitativa (48.3% vs 43.4%). Los inmuebles con 3 o mas banos son escasos (8.3%), indicando un mercado orientado a viviendas de tamano moderado.

4. **Costos de administracion concentrados:** El 65.3% de los inmuebles paga entre $41K y $180K de administracion, consistente con los valores tipicos de conjuntos residenciales en Bogota. Solo un 4.3% supera los $597K, probablemente correspondiente a sectores de alto nivel.

5. **Antiguedad con alta dispersion:** La media de 13.76 anos con CV del 66.9% revela un mercado heterogeneo que incluye desde obra nueva (0 anos) hasta inmuebles de 40 anos. La asimetria positiva (g1=0.83) indica mayor presencia de inmuebles recientes con algunos muy antiguos que elevan el promedio.

6. **Brecha de area por estrato:** Los inmuebles de estrato 5 tienen en promedio 82.2 m2 frente a 56.0 m2 de los demas estratos — una diferencia de 26.2 m2 (46.7% mas), evidenciando la relacion directa entre nivel socioeconomico y espacio habitacional.

### 3.2 Conclusiones de la Inferencia Estadistica

1. **La creencia sobre estrato 5 se confirma (Punto 6):** Con un p-valor de 9.67e-11, la evidencia es abrumadora: los inmuebles de estrato 5 tienen areas significativamente mayores. La diferencia mediana es de 25 m2 (76 vs 51 m2).

2. **Asociacion remodelado-elevadores (Punto 8):** La relacion es estadisticamente significativa (p=0.00016). Los inmuebles no remodelados tienden a carecer de elevador (63% con 0 elevadores), mientras que los remodelados muestran una distribucion mas equilibrada, sugiriendo que los procesos de remodelacion frecuentemente incluyen o acompanan la instalacion de elevadores.

3. **El costo de administracion del estrato 3 es menor a $200K (Punto 9):** Confirmado con p=2.06e-13. La media de $149,362 y el IC superior de $157,326 estan muy por debajo del umbral, reflejando costos administrativos moderados para este segmento.

4. **La administracion promedio NO llega a $250K (Punto 10):** Rechazado con p=1.99e-05. El IC 95% [$186,102 , $226,045] situa la media poblacional consistentemente por debajo de $250,000.

5. **La variabilidad de la administracion NO aumento (Punto 13):** Con p=0.92, no hay evidencia de cambio en la dispersion respecto al valor historico de $200,836. La desviacion muestral ($189,968) es incluso menor, sugiriendo una posible estabilizacion o reduccion en la heterogeneidad de los costos administrativos.

6. **El estrato 2 duplica al estrato 4 en representacion (Punto 14):** Con p=2.60e-06, la proporcion de inmuebles de estrato 2 (32.3%) es significativamente mayor que la de estrato 4 (17.1%), consistente con la estructura socioeconomica de Bogota donde el estrato 2 es el mas poblado.

7. **Apartamentos remodelados vs no remodelados (Punto 11):** Los IC 99% se solapan ampliamente ([44.2%-58.5%] vs [41.5%-55.8%]), indicando que no hay una diferencia significativa entre ambas proporciones. Aproximadamente la mitad de los apartamentos han sido remodelados.

8. **Inmuebles con mas de 1 bano (Punto 12):** IC 95% [46.4%, 57.0%] indica que la proporcion poblacional de inmuebles con multiples banos esta alrededor del 50%, reflejando un mercado maduro donde contar con mas de un bano es una caracteristica comun pero no universal.

### 3.3 Relacion con el Mercado Inmobiliario de Bogota

1. **Estratificacion y oferta:** La muestra refleja fielmente la distribucion socioeconomica de Bogota, donde los estratos 2 y 3 representan la mayoria de los hogares (aproximadamente 70% segun el DANE). La baja representacion del estrato 1 (4%) es consistente con su menor participacion en el mercado formal de finca raiz.

2. **Apartamentizacion de Bogota:** El 94.6% de apartamentos en la muestra es reflejo de la tendencia de densificacion urbana que ha caracterizado a Bogota en las ultimas decadas. Las politicas de ordenamiento territorial (POT) han favorecido la construccion vertical, especialmente en estratos medios y altos.

3. **Relacion area-estrato como indicador de inequidad:** La brecha de 26 m2 entre estrato 5 y los demas (82 vs 56 m2) cuantifica estadisticamente la desigualdad espacial. Cada escalon en la estratificacion socioeconomica se traduce en metros cuadrados adicionales de vivienda, un patron consistente con la segregacion residencial documentada en Bogota.

4. **Costos de administracion como proxy de nivel socioeconomico:** El gradiente observado — estrato 3 paga en promedio $149K, significativamente menos que el promedio general ($206K) — refleja como los costos de administracion varian con el nivel del inmueble. Los inmuebles de mayor estrato suelen estar en conjuntos con mas amenidades (elevadores, zonas comunes, vigilancia), elevando la cuota.

5. **Remodelacion y valorizacion:** La asociacion significativa entre remodelado y presencia de elevadores sugiere que las remodelaciones en Bogota frecuentemente implican mejoras estructurales mayores. Los inmuebles remodelados tienden a incorporar o modernizar elevadores, lo cual incrementa el valor del activo y es una estrategia comun de valorizacion en zonas consolidadas.

6. **Estabilidad en dispersion de costos:** El hecho de que la desviacion estandar de administracion no haya aumentado (punto 13) es una senal positiva de estabilidad en el mercado. A pesar de la inflacion y el aumento general de precios en Bogota durante 2023, la heterogeneidad en los costos administrativos se ha mantenido relativamente constante.

7. **Inventario de vivienda usada:** La antiguedad media de 13.8 anos, con un CV del 66.9%, indica que la muestra captura predominantemente vivienda usada (no nueva), consistente con un mercado secundario activo. La moda de 5 anos sugiere un subsegmento importante de inmuebles relativamente nuevos, posiblemente entregados en los ultimos 5 anos.

---

*Informe generado con R base — sin dependencias externas.*
*Ejecutar con: `Rscript main.R`*
