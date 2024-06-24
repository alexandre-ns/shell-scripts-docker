# Email - Envio de email através do msmtp via protocolo SMTP
1. instale o msmtp.

```bash
sudo apt update
sudo apt install msmtp
```

2. Crie o arquivo de configuração ~/.msmtprc que armazenará informações sobre servidor de email, segurança e infomações de remetente.

```bash
# Exemplo de um arquivo para configuração do msmtp

defaults
auth           on
tls            on
tls_starttls   on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        ~/.msmtp.log

# Configurações de email do remetente
account        conta
host           nome_servidor_SMTP # exemplo: "smtp.gmail.com" para GMAIL ou "smtp-mail.outlook.com" para MICROSOFT
port           porta # 587
from           email_remetente@dominio.com
user           email_remetente@dominio.com
password       senha_email_remetente

# conta padrão
account default : conta
```

3. Altere permissões para aumentar segurança

```bash
chmod 600 ~/.msmtprc
```

# Execução
  
1. Adicione a permissão necessárias.
   
```bash
chmod +x copy.sh
```

2. Execute o script

```bash
./copy.sh ID_OR_NAME_CONTAINER LOCALIZAÇÃO/E/NOME/ARQUIVO DIRETÓRIO/DESTINO/NO/CONTAINER
./copy.sh nome_container /home/server/arquivo.txt  /home/
```
