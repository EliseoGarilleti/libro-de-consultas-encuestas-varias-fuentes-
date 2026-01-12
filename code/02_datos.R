# Usar ruta local si existe, sino usar ruta externa
if (file.exists("data/longitudinal_varias_encuestas_final.RDS")) {
  df <- readRDS("data/longitudinal_varias_encuestas_final.RDS") %>%
    filter(mes >= as.Date("2023-09-01"))
} else {
  df <- readRDS("../Acumulacion de encuestas/data/00_longitudinal/longitudinal_varias_encuestas_final.RDS") %>%
    filter(mes >= as.Date("2023-09-01"))
}

df %>% distinct(idv_group) %>% print(n=500)

df<-df %>% mutate(recuerdo_bloc = case_when(
  recuerdo_group %in% c("PSOE", "Sumar", "Podemos", "UP") ~ "Izquierda",
  recuerdo_group %in% c("Vox", "PP") ~ "Derecha",
  recuerdo_group %in% c("ERC", "Junts", "Bildu", "PNV", "BNG") ~ "Nacionalista",
  recuerdo_group %in% c("Abstención/Nulo", "No contesta", "Nulo") ~ "AB+NL",
  recuerdo_group %in% c("Otros/Blanco", "Otros", "CUP", "CC", "SALF", "AC") ~ "OT+BL"))

# Usar ruta local si existe, sino usar ruta externa para mapeos
if (file.exists("data/mapeo_partidos_matriz.xlsx")) {
  mapeo_recuerdo <- read_excel("data/mapeo_partidos_matriz.xlsx", sheet = "recuerdo")
  mapeo_idv <- read_excel("data/mapeo_partidos_matriz.xlsx", sheet = "idv")
} else {
  mapeo_recuerdo <- read_excel("../Acumulacion de encuestas/data/01_mapeo/mapeo_partidos_matriz.xlsx", sheet = "recuerdo")
  mapeo_idv <- read_excel("../Acumulacion de encuestas/data/01_mapeo/mapeo_partidos_matriz.xlsx", sheet = "idv")
}

