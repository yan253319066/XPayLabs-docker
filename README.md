# XPayLabs Docker — Self-Hosted Multi-Tenant Crypto Payment Gateway

<p align="center">
  <a href="README.zh-CN.md">中文</a> · <strong>English</strong>
</p>

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-compose-2496ED?logo=docker)](docker-compose.yml)

<p align="center">
  <em>Deploy your own multi-chain crypto payment gateway. Host unlimited merchants on a single instance, collect transaction fees, and keep 100% of the revenue.</em>
</p>

<p align="center">
  <strong>⭐ If this project is useful, give it a star — it helps more people discover self-hosted crypto payments.</strong>
</p>

**XPayLabs** is a production-ready, open-source cryptocurrency payment gateway designed for operators who want full control over their payment infrastructure. Deploy a multi-chain, multi-tenant crypto payment system with a single `docker compose up` command — then onboard merchants and earn from every transaction processed.

### 💰 Cost Comparison: Self-Hosted vs Hosted Gateways

Processing **$100,000/month** in crypto payments:

| Gateway | Transaction Fee | Monthly Fee | **Annual Cost** | Savings vs XPay |
|---------|----------------|-------------|-----------------|-----------------|
| **XPayLabs** | **0%** | $0 | **~$240** (VPS) | — |
| NowPayments | 0.5% | $0 | ~$6,000 | **Save $5,760** |
| Coinbase Commerce | 0.8% | $25 | ~$9,900 | **Save $9,660** |
| BitPay | 1% | $30 | ~$12,360 | **Save $12,120** |

> XPayLabs is free software. You pay only blockchain gas costs (~$0.02-$0.50/tx) and your VPS bill.

---

## Features

- **Multi-Chain Support** — Accept payments on Ethereum (ETH), TRON (TRX & USDT), BNB Smart Chain (BSC), Polygon (MATIC), Avalanche (AVAX), and SUI
- **Self-Hosted** — Full ownership of data, funds, and infrastructure. No third-party dependency
- **Multi-Tenant** — Host unlimited merchants on a single deployment. Set your own fee structure and earn from every transaction
- **Merchant Dashboard** — Vue 3 + Element Plus admin panel for order management, payout, and settlement
- **Embedded Checkout** — Drop-in payment page with QR code, wallet connect (Reown AppKit), and direct crypto transfer
- **Collection Orders** — Generate unique deposit addresses per order; automatic blockchain scanning confirms payments
- **Webhook Callbacks** — Real-time payment notifications via merchant-registered callback URLs
- **HMAC Authentication** — Secure API communication using merchant token (HMAC-SHA256 signature)
- **RSA Encryption** — Sensitive API payloads encrypted with RSA key pairs between frontend and backend

---

## Architecture Overview

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  Merchant    │    │   Checkout   │    │   Gateway    │
│  Dashboard   │    │   (Vue 3)    │    │  (Nginx)     │
│  (Vue 3)     │    │              │    │   :180       │
└──────┬───────┘    └──────┬───────┘    └──────┬───────┘
       │                   │                   │
       └───────────────────┼───────────────────┘
                           │
              ┌────────────┴────────────┐
              │     xpay-merchant       │
              │   (Spring Boot, :8078)  │
              ├─────────────────────────┤
              │      xpay-user          │
              │   (Spring Boot, :8077)  │
              └────────────┬────────────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
  ┌──────┴──────┐  ┌──────┴──────┐  ┌──────┴──────┐
  │  xpay-eth   │  │ xpay-tron   │  │  xpay-sui   │
  │  Scanner    │  │ Scanner     │  │  Scanner    │
  └─────────────┘  └─────────────┘  └──────┬───────┘
                                           │
                                    ┌──────┴──────┐
                                    │ sui-node-svc │
                                    │ (Express)    │
                                    └─────────────┘
┌─────────────┐          ┌─────────────┐
│   MySQL     │          │   Redis     │
│    :3306    │          │   :6379     │
└─────────────┘          └─────────────┘
```

### Services Breakdown

| Service | Image | Role |
|---------|-------|------|
| `mysql` | `mysql:8.0` | Primary database |
| `redis` | `redis:7-alpine` | Cache & session store |
| `sui-node-service` | `ghcr.io/yan253319066/sui-node-service` | SUI blockchain RPC proxy (Express) |
| `xpay-tron` | `ghcr.io/yan253319066/xpay-java` | TRON blockchain scanner |
| `xpay-sui` | `ghcr.io/yan253319066/xpay-java` | SUI blockchain scanner |
| `xpay-eth` | `ghcr.io/yan253319066/xpay-java` | EVM-compatible scanner (ETH, BSC, Polygon, Avalanche) |
| `xpay-user` | `ghcr.io/yan253319066/xpay-java` | User & collection order API service |
| `xpay-merchant` | `ghcr.io/yan253319066/xpay-java` | Merchant backend (RuoYi-Vue-Plus based) |
| `merchant-vue` | `ghcr.io/yan253319066/merchant-vue` | Merchant admin dashboard (Vue 3 + Element Plus) |
| `checkout` | `ghcr.io/yan253319066/checkout` | Payment checkout page (Vue 3 + Vite 7) |
| `gateway` | `nginx:alpine` | Single entry point (reverse proxy) |

---

## Quick Start

### Prerequisites

- [Docker](https://docs.docker.com/engine/install/) 24+
- [Docker Compose](https://docs.docker.com/compose/install/) v2+

### 1. Clone

```bash
git clone https://github.com/yan253319066/XPayLabs-docker.git
cd XPayLabs-docker
```

### 2. Configure

```bash
cp .env.example .env
# Edit .env to set your own passwords, RPC endpoints, and domain URLs
```

### 3. Launch

```bash
docker compose up -d
```

The gateway starts on **port 180** by default. Visit `http://localhost:180` to access the merchant dashboard.

### 4. Initialize Database

The `./sql` directory is mounted to `/docker-entrypoint-initdb.d` — MySQL auto-executes `init.sql` on first startup. To reinitialize:

```bash
docker compose down -v    # WARNING: destroys all data
docker compose up -d
```

---

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `MYSQL_ROOT_PASSWORD` | ✅ | MySQL root password |
| `DB_USERNAME` | ✅ | Database username |
| `DB_PASSWORD` | ✅ | Database password |
| `REDIS_PASSWORD` | ❌ | Redis password (empty = no auth) |
| `ENCRYPTION_KEY` | ✅ | AES-256-CBC key (exactly 32 chars) |
| `JWT_SECRET_KEY` | ✅ | JWT signing secret |
| `SKIP_SIGN_SECRET` | ✅ | HMAC-SHA256 secret for SkipSign |
| `XPAY_PAY_DOMAIN` | ✅ | Public checkout URL |
| `XPAY_API_DOMAIN` | ✅ | Public API domain |
| `ETH_CHAINS_*` | ❌ | Ethereum RPC URLs (comma-separated) |
| `TRON_CHAINS_*` | ❌ | TRON node & API configuration |
| `HOST_PORT_*` | ❌ | Host port mappings |

See [`.env.example`](.env.example) for all configurable options.

---

## Port Mapping

| Default Port | Service | Description |
|-------------|---------|-------------|
| `180` | Gateway (Nginx) | Single public entry point |
| `13306` | MySQL | Database |
| `16379` | Redis | Cache |
| `13001` | sui-node-service | SUI blockchain proxy |
| `18077` | xpay-user | User/order API |
| `18078` | xpay-merchant | Merchant API |
| `18076` | xpay-eth | EVM scanner |
| `18075` | xpay-tron | TRON scanner |
| `18074` | xpay-sui | SUI scanner |

---

## SSL / HTTPS

1. Place your certificate files (`.crt` + `.key`) in `./certs/`
2. Uncomment SSL lines in `docker-compose.yml` (lines 198, 201-202)
3. Switch nginx config: rename `gateway-ssl.conf` → `default.conf` in the volume mount
4. Set `HOST_PORT_GATEWAY_HTTPS` in `.env`

---

## Supported Blockchains

| Chain | Network | Scanner Service |
|-------|---------|----------------|
| Ethereum | Mainnet, Sepolia | `xpay-eth` |
| BNB Smart Chain | Mainnet, Testnet | `xpay-eth` |
| Polygon | Mainnet, Amoy | `xpay-eth` |
| Avalanche C-Chain | Mainnet, Fuji | `xpay-eth` |
| TRON | Mainnet, Shasta | `xpay-tron` |
| SUI | Mainnet, Testnet | `xpay-sui` + `sui-node-service` |

---

## Logs

All Java services output logs to `./logs/` (mounted at `/app/logs`). Each service writes to its own subdirectory:

```
./logs/
├── sui-node-service/
├── XPayLabs-tron/
├── XPayLabs-sui/
├── XPayLabs-eth/
├── XPayLabs/
└── XPayLabs-merchant/
```

---

## Terminology

| Term | Meaning |
|------|---------|
| Collection Order | A payment order awaiting funds (not "payment" order) |
| Payout | Sending funds to any address |
| Merchant Token | HMAC-SHA256 signed authentication token (not Bearer) |
| Deposit Address | Per-order crypto address (not "payment address") |
| Webhook Callback | Merchant-registered URL for payment notifications |

---

## Related Projects

| Repository | Description |
|------------|-------------|
| [XPayLabs-java](https://github.com/yan253319066/XPayLabs-java) | Gateway core (Spring Boot) |
| [XPayLabs-merchant-vue](https://github.com/yan253319066/XPayLabs-merchant-vue) | Merchant dashboard (Vue 3 + Element Plus) |
| [XPayLabs-sui-node-service](https://github.com/yan253319066/XPayLabs-sui-node-service) | SUI blockchain RPC proxy (Express) |
| [XPayLabs](https://github.com/yan253319066/XPayLabs) | Marketing website (Next.js 15) |
| [XPayLabs-docs](https://github.com/yan253319066/XPayLabs-docs) | Documentation (Mintlify) |
| [XPayLabs-checkout](https://github.com/yan253319066/XPayLabs-checkout) | Checkout page (Vue 3) |
| [XPayLabs-demo-vue](https://github.com/yan253319066/XPayLabs-demo-vue) | E-commerce demo (Vue 3) |
| [XPayLabs-example-react](https://github.com/yan253319066/XPayLabs-example-react) | React integration example (React 18 + MUI) |
| [XPayLabs-example-vue](https://github.com/yan253319066/XPayLabs-example-vue) | Vue integration example (Vue 3) |
| [XPayLabs-x402](https://github.com/yan253319066/XPayLabs-x402) | x402 buyer SDK (npm `@xpaylabs/x402`) |
| [XPayLabs-x402-seller](https://github.com/yan253319066/XPayLabs-x402-seller) | x402 seller test server (Express) |
| [XPayLabs-java-sdk](https://github.com/yan253319066/XPayLabs-java-sdk) | Java SDK (Java 17 + OkHttp) |
| [XPayLabs-node-sdk](https://github.com/yan253319066/XPayLabs-node-sdk) | Node.js SDK (TypeScript + Axios) |

---

## License

[MIT](LICENSE) © 2026 XPay Labs

---

## FAQ

### What is XPayLabs Docker?

XPayLabs Docker is a production-ready, self-hosted cryptocurrency payment gateway that supports multiple blockchains and multiple merchants on a single deployment. Run it with `docker compose up` and you have a complete payment infrastructure.

### Can I host multiple merchants?

Yes. XPayLabs is **multi-tenant by design**. A single deployment can serve unlimited merchants, each with isolated data, separate API credentials, and independent configuration.

### Can I charge fees to merchants?

Absolutely. As the platform operator, you set your own fee structure — percentage-based or flat fee per transaction. Since you run the infrastructure yourself, there are no third-party fees eating into your margin.

### What blockchains are supported?

Ethereum, TRON (TRX & USDT), BNB Smart Chain, Polygon, Avalanche, and SUI — with more being added.

### Do I need KYC?

No. Self-hosted means no KYC, no third-party approval, no onboarding delays. You are in complete control.

---

## Self-Hosted vs. Payment Processor

| | XPayLabs (Self-Hosted) | Third-Party Processor |
|---|---|---|
| **Fee Control** | You set the rates. Zero processor cut | 1–3% per transaction + monthly fees |
| **Multi-Tenant** | Host unlimited merchants | Usually single-merchant or upcharge per seat |
| **Data Ownership** | Full. All data stays on your servers | Shared with processor and their sub-processors |
| **Fund Settlement** | Direct to your wallet. Instant settlement | Processor holds and batches payouts |
| **KYC** | None required | KYC for you and your merchants |
| **Customization** | Full control over UI, chains, integrations | Limited to processor's SDK and templates |
| **Counterparty Risk** | You control the private keys | Processor can freeze or delay funds |

---

🌟 **Enjoying XPayLabs?** [Star this repo](https://github.com/yan253319066/XPayLabs-docker) — it helps others discover self-hosted crypto payment infrastructure.

---

*Last updated: June 2026. Maintained by [XPayLabs](https://github.com/yan253319066).*

## Repository

**GitHub:** [yan253319066/XPayLabs-docker](https://github.com/yan253319066/XPayLabs-docker)
**Gitee (mirror):** [XPayLabs/XPayLabs-docker](https://gitee.com/XPayLabs/XPayLabs-docker)
