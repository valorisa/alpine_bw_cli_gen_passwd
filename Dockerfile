# Build stage
FROM alpine:edge AS builder

# Install build dependencies
RUN apk add --no-cache wget unzip

# Download and extract Bitwarden CLI
RUN wget "https://github.com/bitwarden/clients/releases/download/cli-v2025.3.0/bw-linux-2025.3.0.zip" -O bw.zip \
    && unzip bw.zip -d /tmp/bw \
    && chmod +x /tmp/bw/bw \
    && rm bw.zip

# Runtime stage
FROM alpine:edge

# Install runtime dependencies
RUN apk add --no-cache gcompat libstdc++ bash

# Copy BW CLI from builder
COPY --from=builder /tmp/bw/bw /usr/local/bin/bw

# Create alias and config
RUN mkdir -p /root/.config/Bitwarden\ CLI && \
    echo "alias bwg='echo -e \"\\n\\033[1;36m🔐 Génération...\\033[0m\" && \
    NODE_NO_WARNINGS=1 bw generate -ulns --length 128 --minNumber 9 --minSpecial 9 --ambiguous 2>/dev/null && \
    echo -e \"\\033[1;32m✔ Prêt\\033[0m\\n\"'" >> /root/.bashrc

WORKDIR /data
CMD ["bash", "--rcfile", "/root/.bashrc", "-i"]
