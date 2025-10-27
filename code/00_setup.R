# Paquetes
library(tidyverse)
library(showtext)
library(ggtext)
library(flextable)
library(officer)
library(scales)
library(quarto)
library(glue)
library(lubridate)
library(ggiraph)
library(reactable)
library(htmltools)
library(readxl)

# Fuentes
font_add_google("Roboto", "roboto")
font_add_google("Roboto", "roboto-light", regular.wt = 300)
font_add_google("Roboto", "roboto-medium", regular.wt = 500)
showtext_auto()

ultimo_por_grupo <- function(data, grupo_var, tiempo_var) {
  data %>%
    group_by({{ grupo_var }}) %>%
    filter({{ tiempo_var }} == max({{ tiempo_var }}, na.rm = TRUE)) %>%
    ungroup()
}

niveles_idv_matriz <- c("PSOE", "PP", "Vox", "Sumar", "Podemos", "ERC", "SALF",
                        "Junts", "PNV", "Bildu", "CC", "OT+BL", "AB+NL", "Indecisos")

niveles_recuerdo_matriz <- c("PSOE", "PP", "Vox", "Sumar", "OT+BL", "AB+NL", "<18")
