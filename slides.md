---
# Titre & thème
theme: default
title: "RTK — des commandes plus courtes pour votre assistant IA"
info: |
  Présentation Slidev pour dévelopseurs débutants : ce que fait RTK,
  un exemple réel avant/après, l'installation (RHEL, Windows 11, WSL2)
  et les commandes du quotidien.
class: text-center
highlighter: shiki
drawings:
  persist: false
transition: slide-left
mdc: true
---

# RTK : des commandes plus courtes pour votre assistant IA

### Installez-le une fois — il raccourcit tout seul ce que lisent Claude, Copilot et les autres

<div class="abs-br m-6 text-sm opacity-60">
Pour développeurs débutants · 9 slides · ~5 minutes
</div>

<!--
Notes présentateur :

- Objectif : en 5 minutes, savoir ce que fait RTK, l'installer
  et l'utiliser au quotidien.
- RTK = un petit programme qui s'intercale entre vos commandes
  et l'assistant IA, pour lui transmettre des résultats plus courts.
- Sources : documentation officielle https://www.rtk-ai.app/docs/
  et README https://github.com/rtk-ai/rtk
-->

---
layout: default
---

# Le problème : l'IA lit trop

<div class="text-center text-lg mt-2">

Vous demandez : « <b>Vérifie les changements du projet.</b> »

</div>

<v-click>

<div class="grid grid-cols-2 gap-6 mt-6 items-center">

<div>

L'assistant lance <code>git status</code> et envoie le résultat à l'IA :

```text
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  modified:   src/app.py
  modified:   src/utils.py

Untracked files:
  notes.txt

no changes added to commit
```

</div>

<div>

<v-click>

<div class="p-4 border-l-4 border-red-500 bg-red-500/10 rounded-r-lg">

L'IA lit <b>toutes</b> ces lignes.

</div>

</v-click>

<v-click>

<div class="mt-4 p-4 border-l-4 border-red-500 bg-red-500/10 rounded-r-lg">

Or l'essentiel tient en 3 lignes : <b>2 fichiers modifiés, 1 fichier nouveau.</b>

</div>

</v-click>

</div>

</div>

</v-click>

<v-click>

<div class="mt-8 p-4 border-l-4 border-green-500 bg-green-500/10 rounded-r-lg text-center">
💡 C'est comme recevoir un rapport de 40 pages pour apprendre qu'une phrase a changé.
</div>

</v-click>

<!--
Notes présentateur :

- Le point clé : l'IA « paie » (en tokens) chaque ligne qu'elle lit.
- L'exemple officiel de la documentation : git status, 40 lignes
  lues contre 3 après filtrage.
- Tout le reste (aide de git, rappels de commandes) est du bruit
  pour l'IA.
-->

---
layout: default
---

# Ce que fait RTK, en une phrase

<div class="text-center text-lg mt-4">

RTK s'intercale entre vos commandes et l'IA, et renvoie une version raccourcie des résultats.

</div>

<div class="text-center mt-8">

<v-click>

```text
              SANS RTK
┌──────────┐          ┌──────────────┐          ┌──────┐
│ git status│ ───────▶ │ 40 lignes   │ ───────▶ │  IA  │
└──────────┘          └──────────────┘          └──────┘
```

</v-click>

<v-click>

```text
                            AVEC RTK
┌──────────┐   ┌──────┐   ┌──────────────┐   ┌──────┐
│ git status│──▶│ RTK  │──▶│  3 lignes   │──▶│  IA  │
└──────────┘   └──────┘   └──────────────┘   └──────┘
```

</v-click>

</div>

<v-click>

<div class="grid grid-cols-3 gap-4 mt-8 text-sm">

<div class="p-4 border rounded-lg">

**Votre demande**

Ne change pas d'un mot.

</div>

<div class="p-4 border rounded-lg">

**RTK travaille**

En silence, à chaque commande.

</div>

<div class="p-4 border rounded-lg border-green-500/50 bg-green-500/10">

**Le résultat**

L'IA lit l'essentiel, pas le bruit.

</div>

</div>

</v-click>

<v-click>

<div class="mt-6 text-center font-semibold">
Votre demande reste la même. C'est la réponse des commandes qui raccourcit.
</div>

</v-click>

<!--
Notes présentateur :

- Une seule idée à retenir : RTK raccourcit ce que les commandes
  renvoient, pas ce que vous écrivez.
- RTK intercepte les commandes shell et compresse leur sortie
  avant que l'assistant ne la lise.
- Source : README, https://github.com/rtk-ai/rtk
-->

---
layout: default
---

# Exemple réel : git status, avant / après

<div class="grid grid-cols-2 gap-8 mt-4">

<div>

### Avant (sans RTK)

```text
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  modified:   src/app.py
  modified:   src/utils.py

Untracked files:
  notes.txt

no changes added to commit
```

<div class="mt-3 flex items-center gap-3">

<div class="flex-1 h-6 bg-red-400/40 rounded-full overflow-hidden">

<div class="h-full bg-red-500 w-full"></div>

</div>

<b>11 lignes</b>

</div>

</div>

<div>

### Après (avec RTK)

<v-click>

```text
2 modifiés : src/app.py, src/utils.py
1 non suivi : notes.txt
```

<div class="mt-3 flex items-center gap-3">

<div class="flex-1 h-6 bg-green-400/40 rounded-full overflow-hidden">

<div class="h-full bg-green-500 w-[20%]"></div>

</div>

<b>2 lignes</b>

</div>

<div class="mt-6 text-sm opacity-70">

Même information utile : les fichiers et leur état. RTK regroupe par état et retire le reste.

</div>

</v-click>

</div>

</div>

<v-click>

<div class="mt-6 p-4 border-l-4 border-blue-500 bg-blue-500/10 rounded-r-lg text-sm">
📊 Exemple officiel de la documentation : 40 lignes → 3 lignes sur cet usage. Le gain exact dépend de votre projet. RTK filtre aussi <code>git diff</code>, <code>git log</code>, <code>npm test</code>, <code>pytest</code>, <code>docker ps</code> et 100+ commandes.
</div>

</v-click>

<!--
Notes présentateur :

- Montrer le contraste : même info utile, 8 fois moins de texte.
- RTK gère 100+ commandes : git, GitHub CLI, npm, pytest, ruff,
  cargo, docker, kubectl, terraform...
- Source : https://www.rtk-ai.app/docs/
-->

---
layout: default
---

# Installation : une commande par environnement

<div class="mt-2">

### RHEL / CentOS / Fedora

```bash
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh | sh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

### Windows 11 (PowerShell)

```powershell
winget install rtk-ai.rtk
rtk init -g   # dans un NOUVEAU terminal
```

### WSL2 (Ubuntu)

```bash
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh | sh
rtk init -g
```

</div>

<v-click>

<div class="mt-4 p-3 border-l-4 border-green-500 bg-green-500/10 rounded-r-lg text-sm">

✅ <b>Vérifiez</b> : <code>rtk --version</code> doit afficher une version, et <code>rtk gain</code> doit montrer le tableau des économies. Scripts prêts à l'emploi dans <code>scripts/</code> de ce dépôt.

</div>

</v-click>

<!--
Notes présentateur :

- Sur RHEL, le script officiel curl fonctionne directement ;
  seule la ligne PATH est spécifique.
- Sur Windows, winget puis rtk init -g dans un NOUVEAU terminal
  (pour que le PATH soit pris en compte).
- ripgrep est optionnel : winget install BurntSushi.ripgrep.MSVC
  (utile pour certains filtres).
- Source : https://www.rtk-ai.app/docs/getting-started/installation/
-->

---
layout: default
---

# Activer RTK dans votre assistant : une seule fois

<div class="text-center mt-2 text-lg">

Une seule commande, et le filtrage devient automatique. Rien à écrire « rtk » dans vos demandes.

</div>

<div class="mt-4 text-sm">

| Votre assistant | Commande d'activation |
| --- | --- |
| Claude Code | `rtk init -g` |
| GitHub Copilot (VS Code) | `rtk init -g --copilot` |
| Gemini CLI | `rtk init -g --gemini` |
| Codex (OpenAI) | `rtk init -g --codex` |
| Cursor | `rtk init -g --agent cursor` |

</div>

<v-click>

<div class="mt-6 p-4 border-l-4 border-green-500 bg-green-500/10 rounded-r-lg">

✅ Ensuite, quand l'assistant lance une commande shell, RTK la traite <b>en silence</b>. L'assistant reçoit la version courte, sans que vous n'ayez rien à faire.

</div>

</v-click>

<v-click>

<div class="mt-4 text-sm opacity-70 text-center">
Autres assistants pris en charge : Windsurf, Cline, OpenCode, Kilo Code, Kimi, Factory Droid, Trae… (liste complète dans le README de RTK)
</div>

</v-click>

<!--
Notes présentateur :

- « -g » = global : une seule fois pour tous vos projets.
- Sans -g : installation pour le projet en cours uniquement
  (rtk init), utile pour tester.
- Le mécanisme d'activation s'appelle un « hook » : un déclencheur
  automatique. Pas besoin d'en retenir le nom.
- Source : README, https://github.com/rtk-ai/rtk
-->

---
layout: default
---

# Les commandes RTK au quotidien

<div class="mt-2 text-sm">

| Vous voulez… | Commande |
| --- | --- |
| Voir vos économies depuis le début | `rtk gain` |
| Voir la tendance des 30 derniers jours | `rtk gain --graph` |
| Trouver les commandes filtrées trop rarement | `rtk discover` |
| Lancer une commande sans filtrage (rare) | `rtk bypass <commande>` |
| Filtrer un fichier à la main | `rtk read <fichier>` |
| Chercher dans le code, version compacte | `rtk grep <motif>` |

</div>

<v-click>

<div class="grid grid-cols-3 gap-4 mt-4 text-xs">

<div class="p-3 border rounded-lg">

**Lundi matin**

`rtk gain --graph` : un coup d'œil sur la semaine.

</div>

<div class="p-3 border rounded-lg">

**Avant un commit**

`rtk discover` : ai-je manqué des économies ?

</div>

<div class="p-3 border rounded-lg">

**Débogage précis**

`rtk bypass git diff` : la sortie complète, une fois.

</div>

</div>

</v-click>

<v-click>

<div class="mt-4 p-3 border-l-4 border-orange-500 bg-orange-500/10 rounded-r-lg text-sm">
⚠️ Au quotidien, vous n'utilisez <b>presque rien</b> : le filtrage est automatique. Ces commandes servent à regarder, pas à travailler.
</div>

</v-click>

<!--
Notes présentateur :

- Message principal : zéro effort au quotidien.
- rtk discover liste les commandes qui auraient mérité le filtrage.
- rtk gain --history : historique récent ; rtk gain --daily :
  jour par jour ; --all --format json : export pour dashboard.
- Source : README, https://github.com/rtk-ai/rtk
-->

---
layout: default
---

# Les bons réflexes (et les limites)

<div class="grid grid-cols-2 gap-8 mt-4">

<div>

### ✅ À retenir

<v-click>

- RTK filtre les commandes **shell** : `git`, `npm`, `pytest`, `docker`…
- Tout est **automatique** après `rtk init -g`.
- Les économies se suivent avec `rtk gain`.
- Un doute sur un résultat ? `rtk bypass <commande>` donne la version complète.

</v-click>

</div>

<div>

### ⚠️ À connaître

<v-click>

- Les outils intégrés des assistants (lecture de fichiers, recherche) ne passent pas par RTK. Pour les filtrer, demandez plutôt des commandes : `cat`, `rg`, `find`.

</v-click>

<v-click>

<div class="mt-4 p-4 border-l-4 border-orange-500 bg-orange-500/10 rounded-r-lg text-sm">

Les chiffres affichés par `rtk gain` sont des **estimations**.

Une sortie réduite de 90 % ne veut pas dire une facture réduite de 90 % : vos demandes et les réponses de l'IA comptent aussi.

</div>

</v-click>

</div>

</div>

<div class="mt-8 flex justify-center gap-6 text-xs opacity-60">

<div>Sources : <a href="https://www.rtk-ai.app/docs/">Documentation officielle RTK</a> · <a href="https://github.com/rtk-ai/rtk">README du projet</a></div>

</div>

<!--
Notes présentateur :

- Point technique le plus important : RTK n'agit que sur les
  commandes shell. Les outils intégrés (Read, Grep, Glob) ne
  passent pas par lui.
- Solution simple : demander à l'assistant d'utiliser cat / rg /
  find, ou appeler rtk read / rtk grep / rtk find directement.
- Rester honnête sur les économies : estimations, pas comptage
  exact.
-->

---
layout: center
class: text-center
---

# À vous de jouer

<div class="mt-4 text-lg opacity-80">

Une commande pour tout démarrer :

</div>

<div class="mt-4 font-mono text-2xl">

`rtk init -g`

</div>

<div class="mt-8 flex justify-center gap-8 text-sm opacity-70">

<div>📚 <a href="https://www.rtk-ai.app/docs/">Documentation officielle</a></div>
<div>🐙 <a href="https://github.com/rtk-ai/rtk">Code source</a></div>
<div>⚙️ <a href="https://github.com/sbilque/rtk-presentation">Scripts d'installation de ce dépôt</a></div>

</div>

<div class="abs-br m-6 text-xs opacity-40">
Présentation Slidev · Pour développeurs débutants
</div>

<!--
Notes présentateur :

- Conclusion : une commande, un essai, et on regarde rtk gain
  une semaine plus tard.
- Proposer un exercice : installer RTK, lancer un assistant sur
  un projet git, comparer rtk gain avant/après.
-->
