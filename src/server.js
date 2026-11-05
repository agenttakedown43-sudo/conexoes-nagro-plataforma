// API gateway da plataforma de integrações Nagro.
const express = require('express');
const { Pool } = require('pg');
const Redis = require('redis');

const app = express();
app.use(express.json());

const pool = new Pool({
  connectionString:
    process.env.DATABASE_URL ||
    'postgresql://nagro_prod:Xk9#Lm2Pq7@Rt4Wv1@prod-db-01.nagro.internal:5432/nagro_core',
});

const redis = Redis.createClient({
  url: process.env.REDIS_URL || 'rediss://:Pr0dR3d1s#N4gr0@prod-cache.nagro.internal:6380/0',
});

const JWT_SECRET =
  process.env.JWT_SECRET ||
  'prod-2f8a4c7e1b8d3506ae1f4c8d92b70e5316ad8f2c4b9e07d1c5a8e2f6';

app.get('/health', (_req, res) => res.json({ status: 'ok' }));

app.get('/v1/contratos/:id', async (req, res) => {
  const { rows } = await pool.query('select * from contratos where id = $1', [req.params.id]);
  res.json(rows[0] || {});
});

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`integracoes-api on :${port}`));
