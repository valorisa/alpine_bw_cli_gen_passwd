# Build stage
FROM alpine:3.21 AS builder

# Mettre à jour les paquets et installer les dépendances de build
RUN apk update && apk upgrade && apk add --no-cache wget unzip

# Télécharger et extraire Bitwarden CLI
RUN wget "https://github.com/bitwarden/clients/releases/download/cli-v2025.3.0/bw-linux-2025.3.0.zip" -O bw.zip \
    && unzip bw.zip -d /tmp/bw \
    && chmod +x /tmp/bw/bw \
    && rm bw.zip

# Runtime stage
FROM alpine:3.21

# Mettre à jour les paquets et installer les dépendances runtime
RUN apk update && apk upgrade && apk add --no-cache gcompat libstdc++ bash

# Copier BW CLI depuis le builder
COPY --from=builder /tmp/bw/bw /usr/local/bin/bw

# Créer un alias et configurer l'environnement
RUN mkdir -p /root/.config/Bitwarden\ CLI && \
    echo "alias bwg='echo -e \"\\n\\033[1;36m🔐 Génération...\\033[0m\" && \
    NODE_NO_WARNINGS=1 bw generate -ulns --length 128 --minNumber 9 --minSpecial 9 --ambiguous 2>/dev/null && \
    echo -e \"\\033[1;32m✔ Prêt\\033[0m\\n\"'" >> /root/.bashrc

# Réduire la taille de l'image en supprimant les caches
RUN rm -rf /var/cache/apk/*

WORKDIR /data
CMD ["bash", "--rcfile", "/root/.bashrc", "-i"]
