#!/bin/bash
# ══════════════════════════════════════════════════
# DAG SF — Script de actualización automática
# Uso: ./actualizar.sh "descripción del cambio"
# ══════════════════════════════════════════════════

set -e

MENSAJE="${1:-actualización de presentación}"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "┌─────────────────────────────────────────┐"
echo "│  DAG SF — Deploy automático             │"
echo "└─────────────────────────────────────────┘"
echo ""

# Verificar que estamos en el repo correcto
if [ ! -f "$REPO_DIR/index.html" ]; then
  echo "✗ Error: no se encontró index.html en $REPO_DIR"
  exit 1
fi

# Copiar el HTML actualizado si existe en Downloads
if [ -f "$HOME/Downloads/dag-sf-presentacion-v4.html" ]; then
  echo "→ Copiando HTML actualizado desde Downloads..."
  cp "$HOME/Downloads/dag-sf-presentacion-v4.html" "$REPO_DIR/index.html"
  echo "  ✓ index.html actualizado"
fi

# Git: agregar, commit y push
echo "→ Subiendo a GitHub..."
cd "$REPO_DIR"
git add -A
git commit -m "deploy: $MENSAJE — $(date '+%Y-%m-%d %H:%M')"
git push origin main

echo ""
echo "✓ ¡Listo! Cambios en GitHub."
echo "  Render redespliega automáticamente en ~30 segundos."
echo ""
echo "  Repositorio: https://github.com/Developmentart1/dag-sf-presentacion"
echo ""
