# RTK — Présentation pour développeurs débutants (Slidev)

Présentation de 11 slides (~5 minutes) expliquant **RTK** ([Rust Token Killer](https://github.com/rtk-ai/rtk)) :
l'outil qui raccourcit ce que les commandes renvoient à votre assistant IA (Claude Code,
Copilot, Cursor…), pour économiser des tokens.

Ton : direct, concret, orienté usage — pour développeurs débutants.

## Contenu des slides

1. **Titre** — RTK : des commandes plus courtes pour votre assistant IA
2. **Le problème** — l'IA lit trop (exemple : git status)
3. **Ce que fait RTK** — en une phrase, avec schéma animé
4. **Exemple réel** — git status avant/après (11 lignes → 2 lignes)
5. **Installation** — RHEL, Windows 11, WSL2 (Ubuntu)
6. **Activation** — une commande par assistant (`rtk init -g`, `--copilot`, `--gemini`…)
7. **Commandes du quotidien** — `rtk gain`, `rtk discover`, `rtk bypass`… avec cas d'usage
8. **Les bons réflexes** — ce qui est filtré, ce qui ne l'est pas, limites des estimations
9. **Pour les plus curieux (1/2)** — le voyage d'une commande : pipeline PARSE → ROUTE → EXECUTE → FILTER → PRINT → TRACK, exemple chiffré 500 → 20 caractères (−96 %)
10. **Pour les plus curieux (2/2)** — recettes de filtrage, suivi des économies (SQLite, 90 jours), fail-safe et performances
11. **À vous de jouer** — démarrer avec `rtk init -g`

Les slides « Pour les plus curieux » s'appuient sur la
[documentation d'architecture du projet](https://github.com/rtk-ai/rtk/blob/master/docs/contributing/ARCHITECTURE.md).

Chaque slide contient des notes présentateur (mode présentation : touche `P`).
Animations : révélations progressives à chaque slide (`v-click`).

## Scripts d'installation

Le dossier `scripts/` contient trois scripts prêts à l'emploi, basés sur la
[documentation officielle](https://www.rtk-ai.app/docs/getting-started/installation/) :

| Environnement | Script | Usage |
| --- | --- | --- |
| RHEL / CentOS / Fedora | `scripts/install-rhel.sh` | `./install-rhel.sh` (options : `--gemini`, `--codex`, `--agent cursor`…) |
| Windows 11 | `scripts/install-windows11.ps1` | `powershell -ExecutionPolicy Bypass -File .\install-windows11.ps1` |
| WSL2 (Ubuntu) | `scripts/install-wsl2-ubuntu.sh` | `./install-wsl2-ubuntu.sh` (mêmes options) |

Chaque script : installe RTK, configure le PATH si besoin, active le filtrage
pour votre assistant (Claude Code par défaut) et vérifie l'installation
(`rtk --version` + `rtk gain`).

## Utilisation

```bash
# Installation des dépendances
npm install

# Générer la version statique (dossier dist/)
npm run build

# Exporter en PDF
npm run export
```

En mode développement : `npm run dev` puis ouvrir <http://localhost:3030>.

## Raccourcis utiles en mode présentation

| Touche | Action |
| --- | --- |
| `Espace` / `→` | Slide suivante |
| `←` | Slide précédente |
| `P` | Mode présentateur (avec notes) |
| `O` | Vue d'ensemble des slides |

## Sources

- Documentation officielle RTK : <https://www.rtk-ai.app/docs/>
- Installation : <https://www.rtk-ai.app/docs/getting-started/installation/>
- Code source : <https://github.com/rtk-ai/rtk>

## Stack

- [Slidev](https://sli.dev) — présentations à partir de Markdown
- Thème par défaut, transitions `slide-left`, animations `v-click`
