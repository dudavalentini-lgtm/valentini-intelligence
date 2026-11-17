# Instruções para o Codex

Este repositório é o worker de conferência da carteira 2026 da Valentini Seguros.

## Objetivo
Executar continuamente em um VPS Hostinger Ubuntu 24.04, lendo PDFs via Google Drive API (somente leitura), extraindo texto localmente e gravando resultados no Base44.

## Restrições
- Nunca commitar segredos, API keys ou service-account JSON.
- Não usar o conector Google Drive do Base44 para processar documentos.
- Preserve as regras de segurança do parser v3.
- Frota não deve ser importada automaticamente.
- Documento de cancelamento ou cotação não é autoritativo.
- Placa em "DADOS DO VEICULO SUBSTITUIDO" deve bloquear importação automática.
- Priorize idempotência e evite duplicidades.
- Comece o deploy com DRY_RUN=true e 2 workers.
- Só após validar logs, usar DRY_RUN=false e 5 workers.

## Ambiente alvo
- Ubuntu 24.04 LTS
- Docker + Docker Compose
- diretório: /opt/valentini-worker
- restart policy: unless-stopped
