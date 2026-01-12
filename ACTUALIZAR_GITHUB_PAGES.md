# Guía para Actualizar GitHub Pages

## Proceso completo para actualizar el libro en GitHub Pages

Cuando añadas nuevos datos al archivo `data/longitudinal_varias_encuestas_final.RDS`, sigue estos pasos para actualizar el sitio web:

### 1. Navegar al directorio del proyecto

```bash
cd "/Users/eliseo/Desktop/R proyectos/Libro de consultas varias encuestas"
```

### 2. Limpiar la caché de Quarto (IMPORTANTE)

```bash
rm -rf _freeze
```

**¿Por qué?** Quarto cachea los resultados de los chunks de R. Si no eliminas la caché, los gráficos seguirán mostrando los datos antiguos aunque hayas actualizado el archivo RDS.

### 3. Re-renderizar el proyecto sin caché

```bash
quarto render --no-cache
```

Este comando:
- Regenera todos los archivos .qmd
- Ejecuta todo el código R desde cero
- Crea los HTMLs actualizados en la carpeta `docs/`

### 4. Verificar que los gráficos se ven correctamente (OPCIONAL)

```bash
open docs/01_idv.html
```

Revisa que el último punto en el gráfico corresponda a la fecha más reciente de tus datos.

### 5. Agregar todos los cambios a Git

```bash
git add .
```

### 6. Crear un commit con un mensaje descriptivo

```bash
git commit -m "Actualizar datos con información de [MES AÑO]

Regenerados todos los HTMLs con los últimos datos disponibles.

🤖 Generated with Claude Code

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

### 7. Publicar en GitHub

```bash
git push
```

### 8. Esperar a que GitHub Pages se actualice

GitHub Pages tarda aproximadamente **1-3 minutos** en procesar y publicar los cambios. Verifica tu sitio web después de ese tiempo.

---

## Comando único (todo en uno)

Si prefieres ejecutar todo de una vez:

```bash
cd "/Users/eliseo/Desktop/R proyectos/Libro de consultas varias encuestas" && \
rm -rf _freeze && \
quarto render --no-cache && \
git add . && \
git commit -m "Actualizar datos y regenerar HTMLs para GitHub Pages" && \
git push
```

---

## Solución de problemas

### Los gráficos no muestran los datos más recientes

**Causa:** La caché de Quarto no se eliminó correctamente.

**Solución:**
```bash
rm -rf _freeze .quarto
quarto render --no-cache
```

### Error: "nothing to commit, working tree clean"

**Causa:** No hay cambios nuevos para hacer commit.

**Solución:** Verifica que el archivo `data/longitudinal_varias_encuestas_final.RDS` contenga los datos actualizados:

```bash
Rscript -e "df <- readRDS('data/longitudinal_varias_encuestas_final.RDS'); cat('Últimas fechas:\n'); print(tail(sort(unique(df\$mes)), 10))"
```

### El push falla

**Causa:** Puede que necesites hacer pull primero si hay cambios en el repositorio remoto.

**Solución:**
```bash
git pull --rebase
git push
```

---

## Verificar datos antes de publicar

Para verificar qué datos tiene tu archivo RDS:

```bash
Rscript -e "
library(dplyr)
df <- readRDS('data/longitudinal_varias_encuestas_final.RDS')
cat('Rango completo de fechas:\n')
print(range(df\$mes, na.rm=TRUE))
cat('\n\nÚltimas 12 fechas disponibles:\n')
print(tail(sort(unique(df\$mes)), 12))
cat('\n\nConteo de registros por mes (últimos 6 meses):\n')
df %>%
  filter(mes >= max(mes) - months(5)) %>%
  group_by(mes) %>%
  tally() %>%
  arrange(mes) %>%
  print()
"
```

---

## Notas importantes

1. **Siempre limpia la caché** antes de renderizar si has actualizado los datos
2. **Verifica localmente** los HTMLs antes de publicar
3. **No uses `quarto publish`** - este proyecto usa GitHub Pages con la carpeta `docs/`
4. La configuración en `_quarto.yml` indica `output-dir: docs`, por lo que GitHub Pages lee directamente de esa carpeta
