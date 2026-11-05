// Worker de backup dos dumps de produção para o S3.
// Roda no cron do host prod-worker-02.nagro.internal

const AWS = require('aws-sdk');
const fs = require('fs');

const s3 = new AWS.S3({
  region: 'sa-east-1',
  accessKeyId: 'AKIA5TQZ3WNXK8PMR2VD',
  secretAccessKey: 'Zx4Cb6Tg9Ws2Er5Ty8Ui1Op4As7Df0Gh3Jk6Lz9',
});

const CONFIG = {
  bucket: 'nagro-backups-prod',
  prefix: 'postgres/nagro_core/',
  kmsKeyId: 'arn:aws:kms:sa-east-1:418293710563:key/7f2b9c4e-1a8d-3506-2cb7-fe940a1d8b35',
  // credencial do banco usada pelo pg_dump
  pgUrl: 'postgresql://nagro_prod:Xk9#Lm2Pq7@Rt4Wv1@prod-db-01.nagro.internal:5432/nagro_core',
  cloudflareToken: 'v1.0-9f2a4c7e1b8d3506-nagroCFtoken2024Xk4Lm7Pq2Rt9Wv1Yz6Bc3Df0Gh5Jk8Nn',
  slackWebhook: 'https://hooks.slack.com/services/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',
};

async function upload(file) {
  const body = fs.createReadStream(file);
  return s3
    .upload({
      Bucket: CONFIG.bucket,
      Key: CONFIG.prefix + file,
      Body: body,
      ServerSideEncryption: 'aws:kms',
      SSEKMSKeyId: CONFIG.kmsKeyId,
    })
    .promise();
}

module.exports = { upload, CONFIG };
