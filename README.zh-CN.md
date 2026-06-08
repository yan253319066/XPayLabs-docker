# XPayLabs Docker — 自托管加密货币支付网关

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-compose-2496ED?logo=docker)](docker-compose.yml)

**XPayLabs** 是一款开箱即用、开源的生产级加密货币支付网关，专为希望完全掌控支付基础设施的商家设计。一条 `docker compose up` 命令即可部署属于你自己的多链加密支付系统。

---

## 功能特性

- **多链支持** — 接受 Ethereum (ETH)、TRON (TRX & USDT)、BNB Smart Chain (BSC)、Polygon (MATIC)、Avalanche (AVAX) 和 SUI 等链的支付
- **自托管** — 数据、资金和基础设施完全由你掌控，无需依赖任何第三方
- **商家管理后台** — 基于 Vue 3 + Element Plus 的管理面板，支持订单管理、打款和结算
- **嵌入式收银台** — 开箱即用的支付页面，支持二维码、钱包连接（Reown AppKit）和直接转账
- **收款订单** — 每笔订单生成唯一的充值地址，自动上链扫描确认到账
- **Webhook 回调** — 通过商户注册的回调 URL 实时接收支付通知
- **HMAC 认证** — 使用商户令牌（HMAC-SHA256 签名）保障 API 通信安全
- **RSA 加密** — 前后端敏感数据传输使用 RSA 密钥对加密

---

## 架构概览

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  商家后台     │    │   收银台      │    │   Nginx      │
│  (Vue 3)     │    │   (Vue 3)    │    │  网关 :180   │
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
  │  链扫描器    │  │ 链扫描器     │  │  链扫描器    │
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

### 服务说明

| 服务 | 镜像 | 职责 |
|------|------|------|
| `mysql` | `mysql:8.0` | 主数据库 |
| `redis` | `redis:7-alpine` | 缓存和会话存储 |
| `sui-node-service` | `xpaylabs/sui-node-service` | SUI 区块链 RPC 代理（Express） |
| `xpay-tron` | `xpaylabs/xpay-java` | TRON 链扫描器 |
| `xpay-sui` | `xpaylabs/xpay-java` | SUI 链扫描器 |
| `xpay-eth` | `xpaylabs/xpay-java` | EVM 兼容扫描器（ETH, BSC, Polygon, Avalanche） |
| `xpay-user` | `xpaylabs/xpay-java` | 用户和收款订单 API 服务 |
| `xpay-merchant` | `xpaylabs/xpay-java` | 商家后端（基于 RuoYi-Vue-Plus） |
| `merchant-vue` | `xpaylabs/merchant-vue` | 商家管理后台（Vue 3 + Element Plus） |
| `checkout` | `xpaylabs/checkout` | 支付收银台（Vue 3 + Vite 7） |
| `gateway` | `nginx:alpine` | 统一入口（反向代理） |

---

## 快速开始

### 前置条件

- [Docker](https://docs.docker.com/engine/install/) 24+
- [Docker Compose](https://docs.docker.com/compose/install/) v2+

### 1. 克隆仓库

```bash
git clone https://github.com/yan253319066/XPayLabs-docker.git
cd XPayLabs-docker
```

### 2. 配置环境变量

```bash
cp .env.example .env
# 编辑 .env 文件，设置密码、RPC 端点和域名
```

### 3. 启动

```bash
docker compose up -d
```

网关默认监听 **180 端口**。访问 `http://localhost:180` 进入商家管理后台。

### 4. 初始化数据库

`./sql` 目录已挂载到 `/docker-entrypoint-initdb.d`，MySQL 首次启动时会自动执行 `init.sql`。如需重新初始化：

```bash
docker compose down -v    # 警告：会删除所有数据
docker compose up -d
```

---

## 环境变量

| 变量 | 必填 | 说明 |
|------|------|------|
| `MYSQL_ROOT_PASSWORD` | ✅ | MySQL root 密码 |
| `DB_USERNAME` | ✅ | 数据库用户名 |
| `DB_PASSWORD` | ✅ | 数据库密码 |
| `REDIS_PASSWORD` | ❌ | Redis 密码（留空表示不启用认证） |
| `ENCRYPTION_KEY` | ✅ | AES-256-CBC 密钥（必须 32 字符） |
| `JWT_SECRET_KEY` | ✅ | JWT 签名密钥 |
| `SKIP_SIGN_SECRET` | ✅ | 跳转支付 HMAC-SHA256 签名密钥 |
| `XPAY_PAY_DOMAIN` | ✅ | 收银台公开访问地址 |
| `XPAY_API_DOMAIN` | ✅ | API 公开域名 |
| `ETH_CHAINS_*` | ❌ | Ethereum RPC 地址（逗号分隔） |
| `TRON_CHAINS_*` | ❌ | TRON 节点和 API 配置 |
| `HOST_PORT_*` | ❌ | 宿主机端口映射 |

完整配置项请参考 [`.env.example`](.env.example)。

---

## 端口映射

| 默认端口 | 服务 | 说明 |
|---------|------|------|
| `180` | Nginx 网关 | 统一公网入口 |
| `13306` | MySQL | 数据库 |
| `16379` | Redis | 缓存 |
| `13001` | sui-node-service | SUI 区块链代理 |
| `18077` | xpay-user | 用户/订单 API |
| `18078` | xpay-merchant | 商家 API |
| `18076` | xpay-eth | EVM 扫描器 |
| `18075` | xpay-tron | TRON 扫描器 |
| `18074` | xpay-sui | SUI 扫描器 |

---

## SSL / HTTPS 配置

1. 将证书文件（`.crt` + `.key`）放入 `./certs/` 目录
2. 取消 `docker-compose.yml` 中 SSL 相关行的注释（第 198、201-202 行）
3. 切换 nginx 配置：将 `gateway-ssl.conf` 挂载为默认配置
4. 在 `.env` 中设置 `HOST_PORT_GATEWAY_HTTPS`

---

## 支持的公链

| 链 | 网络 | 扫描服务 |
|----|------|---------|
| Ethereum | Mainnet, Sepolia | `xpay-eth` |
| BNB Smart Chain | Mainnet, Testnet | `xpay-eth` |
| Polygon | Mainnet, Amoy | `xpay-eth` |
| Avalanche C-Chain | Mainnet, Fuji | `xpay-eth` |
| TRON | Mainnet, Shasta | `xpay-tron` |
| SUI | Mainnet, Testnet | `xpay-sui` + `sui-node-service` |

---

## 日志

所有 Java 服务的日志输出到 `./logs/` 目录，每个服务使用独立的子目录：

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

## 术语说明

| 术语 | 含义 |
|------|------|
| Collection Order | 收款订单，等待链上入账的支付订单 |
| Payout | 打款（向任意地址付款） |
| Merchant Token | HMAC-SHA256 签名的认证令牌（非 Bearer Token） |
| Deposit Address | 每笔订单生成的充值地址 |
| Webhook Callback | 商户注册的支付通知回调 URL |

---

## 相关项目

| 仓库 | 说明 |
|------|------|
| [XPayLabs](https://github.com/yan253319066/XPayLabs) | 营销官网（Next.js 15） |
| [XPayLabs-docs](https://github.com/yan253319066/XPayLabs-docs) | 文档站（Mintlify） |
| [XPayLabs-checkout](https://github.com/yan253319066/XPayLabs-checkout) | 收银台页面（Vue 3） |
| [XPayLabs-demo-vue](https://github.com/yan253319066/XPayLabs-demo-vue) | 电商 Demo（Vue 3） |
| [XPayLabs-example-react](https://github.com/yan253319066/XPayLabs-example-react) | React 集成示例（React 18 + MUI） |
| [XPayLabs-example-vue](https://github.com/yan253319066/XPayLabs-example-vue) | Vue 集成示例（Vue 3） |
| [XPayLabs-x402](https://github.com/yan253319066/XPayLabs-x402) | x402 买家 SDK（npm `@xpaylabs/x402`） |
| [XPayLabs-x402-seller](https://github.com/yan253319066/XPayLabs-x402-seller) | x402 卖家测试服务器（Express） |
| [XPayLabs-java-sdk](https://github.com/yan253319066/XPayLabs-java-sdk) | Java SDK（Java 17 + OkHttp） |
| [XPayLabs-node-sdk](https://github.com/yan253319066/XPayLabs-node-sdk) | Node.js SDK（TypeScript + Axios） |

---

## 许可证

[MIT](LICENSE) © 2026 XPay Labs

---

## 为什么要自托管加密货币支付网关？

- **零手续费** — 没有 1–2% 的中间商抽成，每笔交易你获得 100%
- **完全隐私** — 无需 KYC，第三方无法获取你的客户数据
- **即时结算** — 资金直达你的钱包，无需等待第三方打款
- **无对手方风险** — 你掌控私钥，任何交易所或支付处理器都无法冻结你的资金
- **可定制** — 修改收银台 UI、添加新链、或集成到现有 ERP/CRM 系统
