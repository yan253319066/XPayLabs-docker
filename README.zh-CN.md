# XPayLabs Docker — 自托管多商家加密货币支付网关

<p align="center">
  <strong>中文</strong> · <a href="README.md">English</a>
</p>

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-compose-2496ED?logo=docker)](docker-compose.yml)

<p align="center">
  <em>部署你自己的多链加密支付网关。一个实例可托管无限商家、收取交易手续费，100% 收入归你。</em>
</p>

**XPayLabs** 是一款开箱即用、开源的生产级加密货币支付网关，专为希望完全掌控支付基础设施的运营者设计。一条 `docker compose up` 命令即可部署多链、多商家加密支付系统 — 然后入驻商家，从每笔交易中获取收益。

---

## 功能特性

- **多链支持** — 接受 Ethereum (ETH)、TRON (TRX & USDT)、BNB Smart Chain (BSC)、Polygon (MATIC)、Avalanche (AVAX) 和 SUI 等链的支付
- **自托管** — 数据、资金和基础设施完全由你掌控，无需依赖任何第三方
- **多商家** — 一个部署可入驻无限商家。自主设置费率，从每笔交易中抽成
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
| `sui-node-service` | `ghcr.io/yan253319066/sui-node-service` | SUI 区块链 RPC 代理（Express） |
| `xpay-tron` | `ghcr.io/yan253319066/xpay-java` | TRON 链扫描器 |
| `xpay-sui` | `ghcr.io/yan253319066/xpay-java` | SUI 链扫描器 |
| `xpay-eth` | `ghcr.io/yan253319066/xpay-java` | EVM 兼容扫描器（ETH, BSC, Polygon, Avalanche） |
| `xpay-user` | `ghcr.io/yan253319066/xpay-java` | 用户和收款订单 API 服务 |
| `xpay-merchant` | `ghcr.io/yan253319066/xpay-java` | 商家后端（基于 RuoYi-Vue-Plus） |
| `merchant-vue` | `ghcr.io/yan253319066/merchant-vue` | 商家管理后台（Vue 3 + Element Plus） |
| `checkout` | `ghcr.io/yan253319066/checkout` | 支付收银台（Vue 3 + Vite 7） |
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
| [XPayLabs-java](https://github.com/yan253319066/XPayLabs-java) | 网关核心（Spring Boot） |
| [XPayLabs-merchant-vue](https://github.com/yan253319066/XPayLabs-merchant-vue) | 商户后台（Vue 3 + Element Plus） |
| [XPayLabs-sui-node-service](https://github.com/yan253319066/XPayLabs-sui-node-service) | SUI 区块链 RPC 代理（Express） |
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

## 常见问题

### XPayLabs Docker 是什么？

XPayLabs Docker 是一款生产级的自托管加密货币支付网关，单次部署同时支持多条区块链和多个商家。一条 `docker compose up` 命令即可拥有完整的支付基础设施。

### 可以入驻多个商家吗？

可以。XPayLabs **原生支持多商家架构**。一个部署可服务无限商家，每个商家拥有独立的数据隔离、独立的 API 凭证和独立的配置。

### 可以向商家收取手续费吗？

完全可以。作为平台运营者，你可以自主设置费率结构 — 按百分比抽成或每笔固定费用。由于基础设施由你运行，没有任何第三方抽成侵蚀你的利润。

### 支持哪些区块链？

Ethereum、TRON（TRX & USDT）、BNB Smart Chain、Polygon、Avalanche 和 SUI — 持续增加中。

### 需要 KYC 吗？

不需要。自托管意味着无需 KYC、无需第三方审批、无需等待入驻审核。一切由你掌控。

---

## 自托管 vs. 第三方支付处理器

| | XPayLabs（自托管） | 第三方支付处理器 |
|---|---|---|
| **费率控制** | 你自主定价，零中间商抽成 | 每笔 1–3% + 月费 |
| **多商家** | 可入驻无限商家 | 通常仅支持单商户，或按席位加价 |
| **数据所有权** | 完全掌握，数据留在你的服务器 | 与处理器及其分包商共享 |
| **资金结算** | 直达你的钱包，实时到账 | 处理器托管后批量打款 |
| **KYC** | 不需要 | 你和你的商家都需要 KYC |
| **可定制性** | 完全控制 UI、链、集成方案 | 受限于处理器的 SDK 和模板 |
| **对手方风险** | 你掌控私钥 | 处理器可冻结或延迟资金 |

---

## 仓库

**GitHub:** [yan253319066/XPayLabs-docker](https://github.com/yan253319066/XPayLabs-docker)
**Gitee（镜像）:** [XPayLabs/XPayLabs-docker](https://gitee.com/XPayLabs/XPayLabs-docker)

*最后更新：2026 年 6 月。维护者：[XPayLabs](https://github.com/yan253319066)。*
