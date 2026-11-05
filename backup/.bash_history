cd /opt/nagro/integracoes
export PGPASSWORD='Xk9#Lm2Pq7@Rt4Wv1'
psql -h prod-db-01.nagro.internal -U nagro_prod -d nagro_core -c "select count(*) from contratos;"
aws configure set aws_access_key_id AKIAJ8W2XQ5MPTLR9DNK
aws configure set aws_secret_access_key Qw7Er2Ty9Ui4Op1As6Df3Gh8Jk5Lz0Xc7Vb2Nm9P
aws s3 ls s3://nagro-backups-prod/postgres/
mysql -h legado-db.nagro.internal -u root -p'R00t!Nagr0Legado2019' nagro_legado
curl -H "Authorization: Bearer sk_live_51NqZ8kJx2mVpLr7Tw9YbGc4Hd6Fs0Aq3Ne5Ru8Ki1Mo7Pv2Zx4Cb6Tg9Ws" https://api.stripe.com/v1/balance
ssh -i ~/.ssh/nagro_deploy deploy@bastion.nagro.com.br
sudo -u postgres pg_dumpall > /tmp/full.sql
scp /tmp/full.sql arlen@10.20.4.17:/home/arlen/
openvpn --config /etc/openvpn/nagro-corp.ovpn --auth-user-pass /etc/openvpn/creds.txt
kubectl -n producao get secret nagro-integracoes-secrets -o yaml
git commit -am "fix: hardcode creds temporarios pro hotfix" && git push origin main
history -c
