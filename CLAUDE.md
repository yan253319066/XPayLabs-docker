# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

XPayLabs full-stack deployment orchestration via Docker Compose v2. 11 containers form a complete payment gateway: MySQL 8.0 + Redis 7 + Nginx reverse proxy + 5 Java Spring Boot microservices + 1 Node.js SUI proxy + 2 Vue frontends.

## Commands

```bash
# Start all services
docker compose up -d

# Stop all services
docker compose down

# Stop and destroy all data (reinitialize DB)
docker compose down -v
docker compose up -d

# View logs
docker compose logs -f [service-name]

# Rebuild a specific service
docker compose up -d --build sui-node-service
```

## Service Inventory (11 containers)

| Container | Image | Internal Port | Host Port | Role |
|------|------|---------|---------|------|
| `xpay-mysql` | mysql:8.0 | 3306 | 13306 | Primary database |
| `xpay-redis` | redis:7-alpine | 6379 | 16379 | Cache & sessions |
| `xpay-sui-node` | ghcr.io/.../sui-node-service | 3001 | 13001 | SUI RPC proxy |
| `xpay-tron` | ghcr.io/.../xpay-java | 8075 | 18075 | TRON scanner |
| `xpay-sui` | ghcr.io/.../xpay-java | 8074 | 18074 | SUI scanner |
| `xpay-eth` | ghcr.io/.../xpay-java | 8076 | 18076 | EVM scanner |
| `xpay-user` | ghcr.io/.../xpay-java | 8077 | 18077 | User/order API |
| `xpay-merchant` | ghcr.io/.../xpay-java | 8078 | 18078 | Merchant backend |
| `xpay-merchant-vue` | ghcr.io/.../merchant-vue | 80 | — | Merchant admin panel |
| `xpay-checkout` | ghcr.io/.../checkout | 80 | — | Checkout page |
| `xpay-gateway` | nginx:alpine | 80 | 180 | Reverse proxy entry |

## Directory Structure

```
├── docker-compose.yml     # Main orchestration file
├── .env.example           # Environment variable template
├── nginx/
│   ├── gateway.conf       # Reverse proxy main config
│   ├── gateway-ssl.conf   # SSL variant
│   ├── checkout.conf      # Checkout Nginx config
│   └── merchant-vue.conf  # Merchant panel Nginx config
├── sql/
│   └── init.sql           # MySQL initialization (auto-runs on first start)
├── certs/                 # SSL certificates (.gitkeep)
└── logs/                  # Per-service Java logs (runtime mount)
```

## Key Environment Variables

| Variable | Description |
|------|------|
| `MYSQL_ROOT_PASSWORD` | MySQL root password |
| `DB_USERNAME` / `DB_PASSWORD` | Database user credentials |
| `REDIS_PASSWORD` | Redis auth password |
| `ENCRYPTION_KEY` | AES-256-CBC 32-char key (shared with sui-node-service) |
| `JWT_SECRET_KEY` | Merchant service JWT signing key |
| `SKIP_SIGN_SECRET` | HMAC-SHA256 SkipSign secret |
| `XPAY_PAY_DOMAIN` | Public checkout URL |
| `XPAY_API_DOMAIN` | Public API domain |
| `ETH_NETWORKS` | Active EVM networks (comma-separated) |

## Supported Blockchains

- Ethereum (Mainnet, Sepolia)
- BNB Smart Chain (Mainnet, Testnet)
- Polygon (Mainnet, Amoy)
- Avalanche C-Chain (Mainnet, Fuji)
- TRON (Mainnet, Shasta)
- SUI (Mainnet, Testnet)

## Deployment

```bash
cp .env.example .env      # Edit passwords, RPC URLs, keys
docker compose up -d      # Access at http://localhost:180
```

### SSL Setup
1. Place `.crt` and `.key` files in `certs/`
2. Uncomment SSL-related lines in `docker-compose.yml`
3. Set `HOST_PORT_GATEWAY_HTTPS` in `.env`
