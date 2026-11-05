# Nagro — Plataforma de Integrações

Monorepo dos conectores da plataforma Nagro com parceiros de crédito rural,
bureaus e gateways de pagamento.

## Stack

- Python 3.11 (workers de integração)
- Node.js 20 (API gateway)
- PostgreSQL 15 / Redis 7
- AWS (S3, SQS, Lambda) + Cloudflare
- Deploy: Docker Compose (staging) e EKS (produção)

## Ambientes

| Ambiente   | URL                                   | Responsável            |
|------------|---------------------------------------|------------------------|
| dev        | https://dev.api.nagro.com.br          | squad-integracoes      |
| staging    | https://stg.api.nagro.com.br          | squad-integracoes      |
| produção   | https://api.nagro.com.br              | plataforma@nagro.com.br|

## Setup local

```bash
git clone git@github.com:nagro-tech/nagro-plataforma-integracoes.git
cd nagro-plataforma-integracoes
cp .env.example .env   # (o .env de dev já vai versionado, ver #INFRA-482)
docker compose -f deploy/docker-compose.yml up -d
python -m src.worker
```

## Contatos

- Squad Integrações — `#squad-integracoes` no Slack
- Plantão infra — infra-plantao@nagro.com.br
- Runbook interno: https://wiki.nagro.com.br/display/INFRA/Runbook-Integracoes
