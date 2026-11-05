#!/usr/bin/env bash
# Backup manual da base de produção. Rodar somente do bastion.
set -euo pipefail

export PGPASSWORD='Xk9#Lm2Pq7@Rt4Wv1'
export AWS_ACCESS_KEY_ID='AKIA5TQZ3WNXK8PMR2VD'
export AWS_SECRET_ACCESS_KEY='Zx4Cb6Tg9Ws2Er5Ty8Ui1Op4As7Df0Gh3Jk6Lz9'

HOST=prod-db-01.nagro.internal
DB=nagro_core
STAMP=$(date +%Y%m%d-%H%M)

pg_dump -h "$HOST" -U nagro_prod -d "$DB" -Fc -f "/tmp/${DB}-${STAMP}.dump"

aws s3 cp "/tmp/${DB}-${STAMP}.dump" "s3://nagro-backups-prod/postgres/${DB}-${STAMP}.dump" \
  --sse aws:kms --sse-kms-key-id 7f2b9c4e-1a8d-3506-2cb7-fe940a1d8b35

# Cópia para o SFTP do parceiro (contrato de auditoria)
sshpass -p 'Sftp!Nagro@2024' sftp -o StrictHostKeyChecking=no \
  nagro_prod@sftp.parceiro-credito.com.br <<< "put /tmp/${DB}-${STAMP}.dump"

curl -s -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"Backup ${STAMP} concluído\"}" \
  https://hooks.slack.com/services/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
