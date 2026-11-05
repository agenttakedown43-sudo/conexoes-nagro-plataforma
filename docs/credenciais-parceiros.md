# Credenciais de parceiros — planilha migrada do Excel

> Migrado de `\\10.20.4.9\financeiro\TI\senhas-integracoes.xlsx` em 2024-10-18.
> Pendente de migração para o Vault (INFRA-812).

| Parceiro                 | Endpoint                                  | Usuário            | Senha / Token                                   |
|--------------------------|-------------------------------------------|--------------------|-------------------------------------------------|
| Banco Parceiro (PIX)     | https://pix-api.banco-parceiro.com.br/v2  | nagro-pix-prd-9f2a4c7e | `P1x@Nagr0Pr0d#2024$Secret`                 |
| Serasa Experian          | https://api.serasaexperian.com.br         | nagro-integr-prd   | `Sr5a_9K2mQ7wL4xN8vT1yB6cF3dH0jS`               |
| SFTP Auditoria           | sftp.parceiro-credito.com.br              | nagro_prod         | `Sftp!Nagro@2024`                               |
| Protheus (ERP)           | https://erp.nagro.com.br/rest             | integracao.api     | `Pr0th3us@Nagro2023`                            |
| Cartório eletrônico      | https://api.cartorio-digital.com.br       | nagro.docs         | `C4rt0r10#Nagro24`                              |
| Correios (SIGEP)         | https://apps.correios.com.br              | 08082650           | `C0rr310s@2024`                                 |
| Jenkins legado           | http://10.20.1.42:8080                    | admin              | `Jenk1ns@Nagro2021`                             |
| Grafana                  | https://grafana.nagro.com.br              | admin              | `Gr4f4n4@Nagro2024`                             |
| MySQL legado             | legado-db.nagro.internal:3306             | root               | `R00t!Nagr0Legado2019`                          |
| Conta AWS root (quebra-vidro) | 418293710563                         | aws-root@nagro.com.br | `AwsR00t!Nagro#2024#BreakGlass`              |

## MFA / recuperação

- Seed TOTP da conta root AWS (cofre físico, sala TI): `JBSWY3DPEHPK3PXPNAGRO2024ABCD`
- Códigos de backup GitHub org `nagro-tech`: `4f2a-91cd`, `77b0-2e5a`, `c918-40df`
