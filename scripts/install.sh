#!/bin/sh
# Bitwarden CLI Installer for Alpine Linux

set -e

echo "➤ Installation des dépendances..."
sudo apk add --no-cache gcompat libstdc++ unzip

echo "➤ Téléchargement de Bitwarden CLI..."
wget "https://github.com/bitwarden/clients/releases/download/cli-v2025.3.0/bw-linux-2025.3.0.zip" -O bw.zip
unzip bw.zip -d ~/.local/bin/
chmod +x ~/.local/bin/bw
rm bw.zip

echo "➤ Configuration de l'alias..."
cat >> ~/.bashrc <<'EOF'
# Bitwarden Password Generator
alias bwg='
  echo -e "\n\033[1;36m🔐 Génération de mot de passe...\033[0m";
  NODE_NO_WARNINGS=1 ~/.local/bin/bw generate -ulns --length 128 --minNumber 9 --minSpecial 9 --ambiguous 2>/dev/null;
  echo -e "\033[1;32m✔ Prêt (copiez ci-dessus)\033[0m\n"
'
EOF

echo "✅ Installation terminée ! Exécutez :"
echo "source ~/.bashrc && bwg"
