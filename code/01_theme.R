# Paleta de colores por partido
colores_partidos <- c(
  "PSOE"   = "#E3001B",
  "PP"     = "#1d4184",
  "Vox"    = "#5BC035",
  "Sumar"  = "#F57BA4",
  "Podemos"= "#662D91"
)

# Theme general (puedes hacer variantes: theme_general, theme_facet, etc.)
theme_1 <- theme(
  panel.spacing.y = unit(1, "lines"),
  panel.spacing.x = unit(2, "lines"),
  legend.position = "None",
  strip.text = element_text(family = "roboto", size = 13, lineheight = 0.4),
  axis.title = element_blank(),
  axis.text.x = element_text(family = "roboto", size = 13, face = "plain", lineheight = 0.4),
  axis.text.y = element_text(family = "roboto", size = 13, face = "plain", lineheight = 0.4),
  panel.grid.minor = element_blank(),
  panel.grid.major.y = element_line(linewidth = 0.2, color = "grey80"),
  plot.title = element_text(family = "roboto-medium", size = 18, face = "bold"),
  plot.subtitle = element_markdown(family = "roboto-light", size = 14, color = "gray10", lineheight = 1.2),
  plot.caption = element_text(family = "roboto-light", size = 30, color = "gray10"),
  plot.margin = margin(t = 10, r = 5, b = 10, l = 5)
)

theme_2 <- theme(
  panel.spacing.y = unit(1.5, "lines"),
  panel.spacing.x = unit(2, "lines"),
  legend.position = "None",
  strip.text = element_text(family = "roboto", size = 13, lineheight = 0.4),
  axis.title = element_blank(),
  axis.text.x = element_text(family = "roboto", size = 12, face = "plain", lineheight = 0.4),
  axis.text.y = element_text(family = "roboto", size = 12, face = "plain", lineheight = 0.4),
  panel.grid.minor = element_blank(),
  panel.grid.major.y = element_line(linewidth = 0.2, color = "grey80"),
  plot.title = element_text(family = "roboto-medium", size = 18, face = "bold"),
  plot.subtitle = element_markdown(family = "roboto-light", size = 14, color = "gray10", lineheight = 1.2),
  plot.caption = element_text(family = "roboto-light", size = 30, color = "gray10"),
  plot.margin = margin(t = 10, r = 5, b = 10, l = 5)
)

theme_3 <- theme(
  panel.spacing.y = unit(1, "lines"),
  panel.spacing.x = unit(1, "lines"),
  legend.position = "None",
  strip.text = element_text(family = "roboto", size = 12, lineheight = 0.4),
  axis.title = element_blank(),
  axis.text.x = element_text(family = "roboto", size = 10, face = "plain", lineheight = 0.4),
  axis.text.y = element_text(family = "roboto", size = 11, face = "plain", lineheight = 0.4),
  panel.grid.minor = element_blank(),
  panel.grid.major.y = element_line(linewidth = 0.2, color = "grey80"),
  plot.title = element_text(family = "roboto-medium", size = 18, face = "bold"),
  plot.subtitle = element_markdown(family = "roboto-light", size = 14, color = "gray10", lineheight = 1.2),
  plot.caption = element_text(family = "roboto-light", size = 30, color = "gray10"),
  plot.margin = margin(t = 10, r = 5, b = 10, l = 5)
)

theme_tablas_1 <- reactableTheme(
  # === Estilo general de la tabla ===
  style = list(
    fontFamily = "Roboto, Helvetica, Arial, sans-serif",
    fontSize = "14px",
    color = "#111",
    backgroundColor = "white"
  ),

  # === Encabezados ===
  headerStyle = list(
    backgroundColor = "#0f3754",
    color = "white",
    fontWeight = 400,        # Roboto Regular
    textAlign = "center",
    verticalAlign = "middle",
    fontSize = "18px"
  ),

  # === Celdas ===
  cellStyle = list(
    fontWeight = 300,        # Roboto Light
    textAlign = "center",
    verticalAlign = "middle",
    fontSize = "17px"
  ),

  # === Filas alternas ===
  stripedColor = "#f8f9fa"
)

# ===============================
#   FUNCIÓN PARA TÍTULOS DE TABLAS
# ===============================
titulo_tabla <- function(texto) {
  htmltools::tags$h3(texto, class = "titulo-tabla")
}

columns = list(
  Fecha = colDef(
    align = "center",
    headerStyle = list(textAlign = "center"),
    html = TRUE,
  ),
  PSOE = colDef(align = "center", headerStyle = list(textAlign = "center")),
  PP = colDef(align = "center", headerStyle = list(textAlign = "center")),
  Vox = colDef(align = "center", headerStyle = list(textAlign = "center")),
  Sumar = colDef(align = "center", headerStyle = list(textAlign = "center")),
  Podemos = colDef(align = "center", headerStyle = list(textAlign = "center"))
)


# ===============================================
#   CONFIGURACIÓN DE COLUMNAS CENTRADAS
# ===============================================

columnas_centradas <- function(df) {
  cols <- names(df)
  col_defs <- setNames(
    lapply(cols, function(x) {
      colDef(
        align = "center",
        headerStyle = list(textAlign = "center")
      )
    }),
    cols
  )
  return(col_defs)
}
