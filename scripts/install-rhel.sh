#!/usr/bin/env bash
# =============================================================================
# Installation de RTK sur RHEL / CentOS / Fedora / Rocky / AlmaLinux
#
# Basé sur la documentation officielle :
#   https://www.rtk-ai.app/docs/getting-started/installation/
#
# Usage :
#   ./install-rhel.sh               # installation + activation Claude Code (global)
#   ./install-rhel.sh --gemini      # installation + activation Gemini CLI
#   ./install-rhel.sh --codex       # installation + activation Codex (OpenAI)
#   ./install-rhel.sh --agent cursor # installation + activation Cursor
# =============================================================================
set -euo pipefail

RTK_BIN_DIR="$HOME/.local/bin"

log() { printf '\e[1;32m==> %s\e[0m\n' "$1"; }

# 1/4 Installation
log "1/4 Installation de RTK dans $RTK_BIN_DIR"
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh | sh

# 2/4 PATH
log "2/4 Ajout de $RTK_BIN_DIR au PATH (si absent)"
case ":$PATH:" in
  *":$RTK_BIN_DIR:"*) : ;;
  *)
    grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null || \
      echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    export PATH="$RTK_BIN_DIR:$PATH"
    echo "    (rechargez avec : source ~/.bashrc)"
    ;;
esac

# 3/4 Activation du filtrage pour l'assistant IA (global)
if ! command -v rtk >/dev/null 2>&1; then
  echo "Erreur : 'rtk' introuvable. Rechargez votre shell puis relancez ce script." >&2
  exit 1
fi
log "3/4 Activation du filtrage (global)"
if [[ $# -ge 1 ]]; then
  rtk init -g "$@"
else
  rtk init -g
fi

# 4/4 Vérification
log "4/4 Vérification"
rtk --version
echo
rtk gain || echo "Note : 'rtk gain' s'affichera après votre première session filtrée."
