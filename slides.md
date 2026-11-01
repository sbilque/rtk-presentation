---
# Titre & thème
theme: default
title: "RTK — moins de texte à faire lire à l'IA"
info: |
  Présentation de vulgarisation (5 slides, ~3 minutes) de RTK,
  l'outil qui réduit le volume de texte que les commandes
  transmettent à l'assistant IA — et donc les tokens consommés.
  Public : grands débutants et non-techniciens.
class: text-center
highlighter: shiki
drawings:
  persist: false
transition: slide-left
mdc: true
---

# RTK : moins de texte à faire lire à l'IA

### L'outil qui économise les tokens, simplement expliqué

<div class="abs-br m-6 text-sm opacity-60">
Présentation grand public · 5 slides · ~3 minutes
</div>

<!--
Notes présentateur :

- Accueil. Objectif : comprendre en 3 minutes ce que fait RTK,
  comment il se déclenche, et où sont les économies.
- Fil conducteur : RTK optimise le **contexte** fourni à l'IA en
  filtrant les résultats de commandes ; il ne se contente pas de
  raccourcir votre demande.
- Sources principales : documentation officielle RTK
  (https://www.rtk-ai.app/docs/) et README du projet
  (https://github.com/rtk-ai/rtk).
-->

---
layout: default
---

# Comment ça marche ? Le filtre entre les outils et l'assistant

<v-click>

L'IA lit du texte sous forme de petites unités : les **tokens**.
RTK réduit le volume des résultats de commandes qu'elle reçoit.

</v-click>

<div class="grid grid-cols-2 gap-6 mt-8">

<div>

### Sans RTK

```text
┌─────────────┐   ┌─────────────┐   ┌──────┐
│    Outil    │──▶│   Rapport   │──▶│  IA  │
│  (ex: git)  │   │  détaillé   │   │      │
└─────────────┘   └─────────────┘   └──────┘
```

<div class="text-sm opacity-70 mt-2">
L'IA doit tout lire — y compris le superflu.
</div>

</div>

<div>

### Avec RTK

<v-click>

```text
┌─────────────┐   ┌──────┐   ┌──────────┐   ┌──────┐
│    Outil    │──▶│ RTK  │──▶│ Résultat │──▶│  IA  │
│  (ex: git)  │   │      │   │ compact  │   │      │
└─────────────┘   └──────┘   └──────────┘   └──────┘
```

<div class="text-sm opacity-70 mt-2">
RTK retire le bruit, l'IA lit l'essentiel.
</div>

</v-click>

</div>

</div>

<v-click>

<div class="mt-10 p-4 border-l-4 border-green-500 bg-green-500/10 rounded-r-lg">
💡 <b>L'idée clé</b> : retirer du bruit, plutôt que raccourcir votre demande.
Comme un surligneur dans un long rapport : seules les lignes utiles sont transmises.
</div>

</v-click>

<!--
Notes présentateur :

- Analogie : « On ne change pas la destination du voyage : on réduit
  ce qu'on transporte pour y arriver. » (valise débarrassée du superflu)
- RTK = Rust Token Killer : un filtre qui compresse la sortie des
  commandes avant qu'elle n'atteigne l'IA.
- Source : documentation officielle, https://www.rtk-ai.app/docs/
-->

---
layout: default
---

# Comment se déclenche-t-il ? Automatiquement, via un « hook »

<div class="text-center mt-4">

<v-click>

```text
💬 Vous demandez :
   « Vérifie les changements du projet. »
                    ↓
🤖 L'assistant lance une commande prise en charge.
                    ↓
⚙️ Un déclencheur automatique (le « hook ») la fait passer par RTK.
                    ↓
📋 RTK filtre le résultat ; l'IA lit la version compacte.
```

</v-click>

</div>

<v-click>

<div class="grid grid-cols-3 gap-4 mt-10 text-sm">

<div class="p-4 border rounded-lg">

**1. Installation**

RTK s'installe une fois, puis se connecte à l'assistant.

</div>

<div class="p-4 border rounded-lg">

**2. Intégration**

Exemple avec Claude Code : intégration automatique documentée.

</div>

<div class="p-4 border rounded-lg">

**3. À l'usage**

Pas besoin d'écrire « utilise RTK » à chaque demande.

</div>

</div>

</v-click>

<v-click>

<div class="mt-8 p-4 border-l-4 border-orange-500 bg-orange-500/10 rounded-r-lg">
⚠️ Le hook agit sur les commandes prises en charge, pas sur tous les outils de l'assistant.
</div>

</v-click>

<!--
Notes présentateur :

- Après installation, RTK fonctionne de manière transparente pour
  l'utilisateur.
- Le déclencheur automatique s'appelle un « hook » : quand l'assistant
  exécute une commande prise en charge, sa sortie passe par RTK.
- Source : README du projet, https://github.com/rtk-ai/rtk
-->

---
layout: default
---

# Sans / avec : le même besoin, moins de volume

<div class="text-center mt-2 opacity-80 text-sm">
Exemple de la documentation officielle : vérifier l'état des fichiers du projet avec la commande <code>git status</code>.
</div>

<div class="grid grid-cols-2 gap-8 mt-8">

<div>

### Sans RTK

```text
─────────────────────────
 Rapport brut de git status
─────────────────────────
 40 lignes à lire par l'IA
─────────────────────────
```

<div class="mt-4 flex items-center gap-2">

<div class="flex-1 h-6 bg-red-400/70 rounded-full overflow-hidden">
<div class="h-full bg-red-500 w-full"></div>
</div>

<span>▰▰▰▰▰▰▰▰▰▰</span>

</div>

</div>

<div>

### Avec RTK

<v-click>

```text
─────────────────────────
 Résultat compact (RTK)
─────────────────────────
 3 lignes à lire par l'IA
─────────────────────────
```

<div class="mt-4 flex items-center gap-2">

<div class="flex-1 h-6 bg-green-400/70 rounded-full overflow-hidden">
<div class="h-full bg-green-500 w-[8%]"></div>
</div>

<span>▰</span>

</div>

</v-click>

</div>

</div>

<v-click>

<div class="mt-8 p-4 border-l-4 border-blue-500 bg-blue-500/10 rounded-r-lg text-sm">
📊 Les nombres (40 lignes → 3 lignes) viennent de l'exemple officiel. Les barres illustrent le volume :
ce n'est pas une reproduction de la sortie, ni une garantie pour toutes les commandes.
</div>

</v-click>

<!--
Notes présentateur :

- Insister : même demande, même résultat utile, mais l'IA lit 3 lignes
  au lieu de 40.
- Rappeler que le gain dépend de la commande — c'est un exemple
  officiel, pas une promesse universelle.
- Source : https://www.rtk-ai.app/docs/
-->

---
layout: default
---

# Où est le gain dans le « prompt engineering » ?

<div class="text-center mt-4">

L'IA ne lit pas seulement votre demande : elle reçoit aussi les consignes, l'historique et les résultats des outils.

</div>

<div class="grid grid-cols-2 gap-8 mt-8 text-sm">

<div>

### Sans RTK

```text
Demande
+ consignes
+ historique
+ [résultat volumineux]   ← occupe la place
```

</div>

<div>

### Avec RTK

<v-click>

```text
Demande
+ consignes
+ historique
+ [résultat compact]      ← RTK agit ici
```

</v-click>

</div>

</div>

<v-click>

<div class="grid grid-cols-2 gap-6 mt-10 text-sm">

<div class="p-4 border rounded-lg">

**Bien écrire sa demande** clarifie ce qu'on veut — c'est le rôle du prompt engineering.

</div>

<div class="p-4 border rounded-lg border-green-500/50 bg-green-500/10">

**RTK intervient sur un autre levier** : réduire le texte que les commandes ajoutent au contexte.

</div>

</div>

</v-click>

<v-click>

<div class="mt-6 text-center font-semibold">
Les deux approches sont complémentaires.
</div>

</v-click>

<!--
Notes présentateur :

- Le contexte de l'IA = demande + consignes + historique + résultats
  des outils. RTK cible la dernière partie.
- Ne pas confondre : écrire un bon prompt et filtrer les résultats
  d'outils sont deux leviers distincts et complémentaires.
- Source : README du projet, https://github.com/rtk-ai/rtk
-->

---
layout: default
---

# Les avantages immédiats… et la bonne mesure

<div class="grid grid-cols-2 gap-8 mt-4">

<div>

### ✅ Ce que RTK apporte dès maintenant

<v-click>

- Moins de texte issu des commandes à transmettre à l'IA.
- Moins de place occupée par ces résultats dans son contexte.
- Un filtrage automatique sur les commandes prises en charge.
- Un suivi des économies estimées avec la commande <code class="whitespace-nowrap">rtk gain</code>.

</v-click>

</div>

<div>

### ⚠️ Attention au raccourci !

<v-click>

<div class="p-4 border-l-4 border-orange-500 bg-orange-500/10 rounded-r-lg">

Un résultat fortement réduit ≠ une facture réduite d'autant.

Les demandes, l'historique et les réponses comptent aussi.

</div>

</v-click>

<v-click>

<div class="mt-4 text-sm opacity-80">

Les nombres de tokens affichés par RTK sont des **estimations**, pas un comptage exact.

</div>

</v-click>

</div>

</div>

<div class="mt-10 flex justify-center gap-6 text-xs opacity-60">

<div>Sources : <a href="https://www.rtk-ai.app/docs/">Documentation officielle RTK</a> · <a href="https://github.com/rtk-ai/rtk">README du projet</a></div>

</div>

<!--
Notes présentateur :

- Résumer : moins de volume transmis, filtrage automatique, suivi des
  économies avec `rtk gain`.
- Nuance importante à donner à l'oral : les économies affichées sont
  des estimations ; la facture dépend aussi des demandes, de
  l'historique et des réponses.
- Sources : https://www.rtk-ai.app/docs/ et
  https://github.com/rtk-ai/rtk
-->

---
layout: center
class: text-center
---

# Merci !

<div class="mt-6 text-lg opacity-80">
RTK : moins de texte à faire lire à l'IA, automatiquement.
</div>

<div class="mt-10 flex justify-center gap-8 text-sm opacity-70">

<div>📚 <a href="https://www.rtk-ai.app/docs/">Documentation officielle</a></div>
<div>🐙 <a href="https://github.com/rtk-ai/rtk">Code source sur GitHub</a></div>

</div>

<div class="abs-br m-6 text-xs opacity-40">
Présentation générée avec Slidev · Public : grands débutants
</div>
