# Sobre
### Arquivos
Monitoramento de docker container, O script monitora se um container especifico está no ar usando CRON, caso ele esteja ele apenas registra informações de log.
Caso o container saia fora do ar o script enviará emails para um endereço configurado pelo usuário que este seja notificado.

1. instale a biblioteca msmtp.

```bash
sudo apt update
sudo apt install msmtp
```

2. *Por questões de permissões relativas a biblioteca msmtp e a configuração CRON, Como root crie um arquivo chamado .msmtprc em /home/root/


3. Após criar o arquivo de configuração .msmtprc, preencha-o com as seguintes informações.

```bash
# Exemplo de um arquivo para configuração do msmtp

defaults
auth           on
tls            on
tls_starttls   on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        ~/.msmtp.log #arquivo de log.

# Configurações de email do remetente
account        conta # noma para a conta
host           nome_servidor_SMTP # exemplo: "smtp.gmail.com" para GMAIL ou "smtp-mail.outlook.com" para MICROSOFT
port           porta # 587
from           email_remetente@dominio.com
user           email_remetente@dominio.com
password       senha_email_remetente

# conta padrão
account default : conta
```

4. Altere permissões por segurança

```bash
chmod 600 /home/root/.msmtprc
```

5. Acesse as informações do arquivo information.txt e preencha os campos.
- RECIPIENT - email do destinatário para notificação.
- SUBJECT= - Descrição do "assunto" para notificação no email.
- CONTAINER_NAME_OR_ID - Nome ou ID do container a ser monitorado.
- DEFAULT_ACCOUNT - Nome da conta padrão(account default) definida no arquivo 

6. Insira as instruções de execução a seguir no arquivo crontab.

    - Monitoramento por minuto. Substitua MINUTOS por um número inteiro para indicar a cada quantos MINUTOS a verificação do container será efetuada.

```bash
*/MINUTOS * * * * root /CAMINHO/PARA/O/ARQUIVO/container.sh
*/MINUTOS * * * * root /home/user/container.sh
```