
# Build

FROM node:22.0.0-alpine@sha256:1b2479dd35a99687d6638f5976fd235e26c5b37e8122f786fcd5fe231d63de5b AS builder

# PLEASE NOTE: required by download
ARG GITHUB_TOKEN

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . ./
RUN npm run download && npm run build

# ---

# Release

FROM node:22.0.0-alpine@sha256:1b2479dd35a99687d6638f5976fd235e26c5b37e8122f786fcd5fe231d63de5b

WORKDIR /app

ENV ASTRO_TELEMETRY_DISABLED=1 \
    HOME=/home/node

# PLEASE NOTE
#   try to replace with a COPY
#   e.g. COPY --from=builder /app/node_modules ./node_modules
# COPY package*.json ./
# RUN npm ci

COPY --from=builder /app/dist ./dist

EXPOSE 4321

USER node

ENTRYPOINT ["npm"]
CMD ["run", "start"]
