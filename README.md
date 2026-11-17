# Valentini Intelligence — Worker VPS

Worker contínuo para conferência da carteira 2026 da Valentini Seguros.

## Objetivo

Ler PDFs diretamente do Google Drive no VPS, extrair texto e validar seguros, usando o Base44 somente como CRM/banco. Não usa o conector Google Drive do Base44 para processar cada documento.

## Arquitetura

Google Drive API (somente leitura) → VPS Hostinger → parser PDF → validações → Base44 API

## Regras preservadas

- seguradora detectada precisa bater com a planilha;
- vigência explícita tem prioridade;
- placa exata, equivalência oficial placa antiga/Mercosul e fallback OCR de 1 caractere com validações fortes;
- bloqueio de `DADOS DO VEICULO SUBSTITUIDO`;
- Frota vai para revisão;
- prêmio não bloqueia importação;
- cotação e cancelamento não são autoritativos;
- evita duplicidade por apólice ou cliente+placa+vigência.

## Segurança

- Google Drive apenas `drive.readonly`;
- não versionar `.env`;
- Base44 API key somente no VPS;
- iniciar com `DRY_RUN=true`.

## Deploy Hostinger

```bash
git clone https://github.com/dudavalentini-lgtm/valentini-intelligence.git /opt/valentini-worker
cd /opt/valentini-worker
cp .env.example .env
# preencher .env
docker compose build
docker compose up -d
docker compose logs -f --tail=100
```

## Teste inicial

Use:

```env
DRY_RUN=true
WORKERS=2
```

Depois de validar os logs:

```env
DRY_RUN=false
WORKERS=5
```

e reinicie:

```bash
docker compose up -d --force-recreate
```

## Codex

Abra este repositório no Codex e peça:

> Revise este worker para produção no VPS Hostinger Ubuntu 24.04. Preserve as regras de validação atuais, valide Docker, dependências, tratamento de erros, concorrência, idempotência, logs e segurança. Não coloque segredos no repositório. Depois prepare os comandos exatos para deploy em /opt/valentini-worker, começando em DRY_RUN=true.
