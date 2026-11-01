# =============================================================================
# Installation de RTK sur Windows 11 (PowerShell)
#
# Basé sur la documentation officielle :
#   https://www.rtk-ai.app/docs/getting-started/installation/
#
# Usage :
#   powershell -ExecutionPolicy Bypass -File .\install-windows11.ps1
#   powershell -ExecutionPolicy Bypass -File .\install-windows11.ps1 -Gemini   # Gemini CLI
#   powershell -ExecutionPolicy Bypass -File .\install-windows11.ps1 -Agent cursor
#
# Note : lancez ce script dans PowerShell, pas en double-cliquant dessus.
# =============================================================================
[CmdletBinding()]
param(
    [switch]$Gemini,          # rtk init -g --gemini
    [switch]$Codex,           # rtk init -g --codex
    [string]$Agent = ""       # rtk init -g --agent <nom>
)

$ErrorActionPreference = "Stop"

function Write-Step([string]$Message) {
    Write-Host "==> $Message" -ForegroundColor Green
}

# 1/4 Installation via winget
Write-Step "1/4 Installation de RTK via winget"
winget install rtk-ai.rtk

# 2/4 (Optionnel) ripgrep, utile pour certains filtres
Write-Step "2/4 (Optionnel) ripgrep pour les filtres de recherche"
Write-Host "    Si certains filtres en ont besoin :" -ForegroundColor DarkGray
Write-Host "    winget install BurntSushi.ripgrep.MSVC" -ForegroundColor DarkGray

# 3/4 Activation du filtrage pour l'assistant IA (global)
# Important : ouvre un NOUVEAU terminal apres l'installation pour que le PATH
# soit pris en compte, ou utilisez le chemin complet ci-dessous.
Write-Step "3/4 Activation du filtrage (global)"
$rtk = Join-Path $env:USERPROFILE ".local\bin\rtk.exe"
if (-not (Test-Path $rtk)) { $rtk = "rtk" }

$initArgs = @("init", "-g")
if ($Gemini) { $initArgs += "--gemini" }
if ($Codex)  { $initArgs += "--codex" }
if ($Agent -ne "") { $initArgs += @("--agent", $Agent) }

& $rtk @initArgs

# 4/4 Verification
Write-Step "4/4 Verification"
& $rtk --version
Write-Host ""
& $rtk gain
if (-not $?) {
    Write-Host "Note : 'rtk gain' s'affichera apres votre premiere session filtree." -ForegroundColor Yellow
}
