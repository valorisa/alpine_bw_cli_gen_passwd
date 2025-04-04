#!/bin/sh
# Uninstall Bitwarden CLI

set -e

echo "➤ Nettoyage des fichiers..."
rm -f ~/.local/bin/bw
rm -rf ~/.config/Bitwarden\ CLI

echo "➤ Suppression de l'alias..."
sed -i '/# Bitwarden Password Generator/,+7d' ~/.bashrc

echo "✅ Désinstallation complète"
