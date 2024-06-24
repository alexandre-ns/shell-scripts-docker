#!/bin/bash

# Configurações do email
RECIPIENT="alexandren49@gmail.com"
SUBJECT="Assunto do Email"
BODY="Este é o corpo do e-mail enviado pelo msmtp."


echo -e "Subject: $SUBJECT\n\n$BODY" | msmtp -a outlook $RECIPIENT