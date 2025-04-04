# 🔧 Configurations Avancées

## 1. Personnalisation des Mots de Passe
```bash
# Exemple avec des règles simplifiées
alias bwg-short='
  bw generate -ulns --length 64 --minNumber 4 --minSpecial 4
'
```

## 2. Intégration avec Vaultwarden
```bash
bw config server https://votre.instance.vaultwarden
```

## 3. Sauvegarde Automatisée
```bash
# Export mensuel
0 0 1 * * bw export --format encrypted_json > ~/bw-backup-$(date +\%Y-\%m-\%d).json
```

## 4. Solution Alternative sans Node.js
```dockerfile
FROM scratch
COPY --from=builder /tmp/bw/bw /bw
ENTRYPOINT ["/bw"]
```
