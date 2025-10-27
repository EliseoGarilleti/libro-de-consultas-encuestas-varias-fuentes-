df <- readRDS("data/longitudinal_varias_encuestas_final.RDS") %>%
  filter(mes >= as.Date("2023-09-01"))

df %>% distinct(idv_group) %>% print(n=500)

df<-df %>% mutate(recuerdo_bloc = case_when(
  recuerdo_group %in% c("PSOE", "Sumar", "Podemos", "UP") ~ "Izquierda",
  recuerdo_group %in% c("Vox", "PP") ~ "Derecha",
  recuerdo_group %in% c("ERC", "Junts", "Bildu", "PNV", "BNG") ~ "Nacionalista",
  recuerdo_group %in% c("Abstención/Nulo", "No contesta", "Nulo") ~ "AB+NL",
  recuerdo_group %in% c("Otros/Blanco", "Otros", "CUP", "CC", "SALF", "AC") ~ "OT+BL"))

mapeo_recuerdo <- read_excel("data/mapeo_partidos_matriz.xlsx", sheet = "recuerdo")
mapeo_idv <- read_excel("data/mapeo_partidos_matriz.xlsx", sheet = "idv")
