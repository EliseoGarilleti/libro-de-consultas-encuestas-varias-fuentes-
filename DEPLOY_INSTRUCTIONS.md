# Instrucciones para Desplegar el Libro

## Opción 1: Quarto Pub (Más fácil)

```bash
quarto publish quarto-pub
```

Esto publicará el libro en https://[tu-usuario].quarto.pub/libro-consultas-electorales

## Opción 2: Netlify

```bash
quarto publish netlify
```

## Opción 3: GitHub Pages

Ya configurado con GitHub Actions en `.github/workflows/publish.yml`

1. Ve a tu repositorio en GitHub
2. Settings > Pages > Source > selecciona "GitHub Actions"
3. El sitio estará disponible en: https://[tu-usuario].github.io/libro-de-consultas-encuestas-varias-fuentes-/

## Opción 4: Servidor propio

Simplemente copia la carpeta `docs/` a tu servidor web.

