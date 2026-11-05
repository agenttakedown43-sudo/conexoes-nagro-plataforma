# Onboarding — Squad Integrações (documento interno)

> Classificação: **CONFIDENCIAL — uso interno Nagro**
> Não compartilhar fora do grupo `infra@nagro.com.br`.

## 1. Acessos que você precisa pedir

| Sistema            | Como pedir                        | Aprovador                  |
|--------------------|-----------------------------------|----------------------------|
| VPN corporativa    | Chamado JIRA `INFRA`              | infra-plantao@nagro.com.br |
| AWS (conta 418293710563) | SSO Okta → `nagro-prod`     | plataforma@nagro.com.br    |
| Bastion SSH        | enviar chave pública no chamado   | squad-integracoes          |
| Grafana / Kibana   | login SSO                         | automático                 |

## 2. Rede interna

```
VPN gateway ........ vpn.nagro.com.br:1194 (UDP, OpenVPN)
Bastion ............ bastion.nagro.com.br (10.20.0.10)
Faixa corporativa .. 10.20.0.0/16
  10.20.1.0/24 ..... servidores de aplicação
  10.20.4.0/24 ..... estações da TI
  10.20.9.0/24 ..... bancos de dados (prod-db-01 = 10.20.9.11)
Kubernetes API ..... https://k8s-prod.nagro.internal:6443
Jenkins legado ..... http://10.20.1.42:8080 (admin / Jenk1ns@Nagro2021)
NAS financeiro ..... \\10.20.4.9\financeiro (usuário: nagro\svc_backup)
```

Credencial temporária da VPN de laboratório (rotacionar mensalmente):
```
usuário: lab.integracoes
senha:   V9n@Nagro#Lab2024
```

## 3. Sistemas críticos

- **ERP (Protheus)** — `erp.nagro.com.br` — integração via webservice SOAP
- **Core bancário parceiro** — `pix-api.banco-parceiro.com.br`
- **Bureau Serasa** — client `nagro-integr-prd`
- **Portal do cliente** — `app.nagro.com.br`

## 4. Contatos

| Papel                | Nome              | E-mail                       | Ramal |
|----------------------|-------------------|------------------------------|-------|
| Head de Tecnologia   | (a definir)       | cto@nagro.com.br             | 2001  |
| Coord. Infra         | (a definir)       | infra@nagro.com.br           | 2014  |
| Plantão 24x7         | rodízio           | infra-plantao@nagro.com.br   | 2099  |
| Segurança da Informação | (a definir)    | seguranca@nagro.com.br       | 2077  |

## 5. Wiki e repositórios

- Confluence: https://wiki.nagro.com.br/display/INFRA
- Runbooks: https://wiki.nagro.com.br/display/INFRA/Runbooks
- Repositórios: https://github.com/nagro-tech
