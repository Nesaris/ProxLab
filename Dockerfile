# syntax=docker/dockerfile:1
# ProxLab 2 : Node seul, aucune dépendance d'exécution (node:sqlite, WebSocket,
# TLS et Argon2id sont dans le moteur). L'image de base est épinglée par
# empreinte (index multi-architecture amd64 + arm64) : une étiquette peut être
# déplacée, une empreinte non.
ARG NODE_IMAGE=node:24.22.1-bookworm-slim@sha256:be8204d4bd327363357f532187b752ff62759c31bedf98e9e18fc08c9cbd605c

FROM ${NODE_IMAGE}
# Paquets du système à jour, et pas de npm, npx, corepack ni yarn : le service
# n'a aucune dépendance npm, ils n'ont rien à faire dans l'image.
RUN apt-get update && apt-get upgrade -y --no-install-recommends && rm -rf /var/lib/apt/lists/* \
 && rm -rf /usr/local/lib/node_modules/npm /usr/local/lib/node_modules/corepack /usr/local/bin/npm /usr/local/bin/npx /usr/local/bin/corepack /opt/yarn-* /usr/local/bin/yarn /usr/local/bin/yarnpkg
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates tzdata \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd -g 10001 proxlab && useradd -u 10001 -g proxlab -M -d /nonexistent -s /usr/sbin/nologin proxlab
WORKDIR /app
COPY package.json nouveautes.json ./
COPY socle ./socle
COPY src ./src
COPY web ./web
RUN mkdir -p /data && chown proxlab:proxlab /data && chmod 700 /data
USER proxlab
ENV NODE_ENV=production DATA_DIR=/data PORT=8140
EXPOSE 8140
VOLUME ["/data"]
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD ["node", "-e", "fetch('http://127.0.0.1:8140/api/health').then(r => process.exit(r.ok ? 0 : 1), () => process.exit(1))"]
CMD ["node", "--disable-warning=ExperimentalWarning", "src/main.js"]
