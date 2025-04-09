# 🏔️ alpine_bw_cli_gen_passwd

[![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=for-the-badge&logo=alpine-linux&logoColor=white)](https://alpinelinux.org/)
[![Bitwarden](https://img.shields.io/badge/Bitwarden-175DDC?style=for-the-badge&logo=bitwarden&logoColor=white)](https://bitwarden.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com)

> Générateur de mots de passe sécurisés via Bitwarden CLI optimisé pour Alpine Linux (native + Docker)

## 🚀 Fonctionnalités
- Génération de mots de passe **128 caractères** avec règles strictes
- Suppression automatique des warnings Node.js
- Sortie colorée et lisible
- **Deux modes** : 
  - Installation native (optimisée Alpine)
  - Conteneur Docker isolé

## 📦 Installation

### Méthode 1 : Native (recommandée pour Alpine)
```bash
curl -sSL https://raw.githubusercontent.com/votrecompte/alpine_bw_cli_gen_passwd/main/scripts/install.sh | sh
source ~/.bashrc
```

### Méthode 2 : Docker
```bash
docker build -t alpine-bw-cli .
docker run -it --rm alpine-bw-cli bwg
```

## ✨ Alias Principal (`bwg`)
```bash
alias bwg='
  echo -e "\n\033[1;36m🔐 Génération de mot de passe...\033[0m";
  NODE_NO_WARNINGS=1 bw generate -ulns --length 128 --minNumber 9 --minSpecial 9 --ambiguous 2>/dev/null;
  echo -e "\033[1;32m✔ Prêt (copiez-le ci-dessus)\033[0m\n"
'
```

## 🐳 Utilisation avec Docker
Persistez la configuration entre les runs :
```bash
docker run -it --rm -v bw-data:/root/.config/Bitwarden\ CLI alpine-bw-cli bwg
```

## 📂 Structure du Projet
```
alpine_bw_cli_gen_passwd/
├── Dockerfile            # Build pour conteneur Alpine
├── scripts/
│   ├── install.sh       # Installation native
│   └── uninstall.sh     # Nettoyage
└── docs/
    └── advanced.md      # Personnalisations avancées
```

## 🔧 Personnalisation
Modifiez les paramètres dans l'alias :
```diff
- --length 128
+ --length 64
```

## 🛠️ Dépendances
| Native          | Docker         |
|-----------------|----------------|
| `gcompat`       | Aucune         |
| `unzip`         |                |

## 📜 License
MIT - [Lire le texte complet](LICENSE)

---

> **Note** : Pour une configuration avancée, consultez [docs/advanced.md](docs/advanced.md)
```

---

### Points Clés :
1. **Badges d'en-tête** : Visibilité immédiate des technologies
2. **Installation en 1 commande** : Pour les deux méthodes
3. **Sections dédiées** : Docker vs Native bien séparées
4. **Tableaux comparatifs** : Pour les dépendances
5. **Liens vers la doc avancée** : Permet d'alléger le README

### Visualisation GitHub :
![Preview GitHub](https://user-images.githubusercontent.com/.../preview.png)  
*(Lien vers une capture d'écran réelle optionnelle)*
