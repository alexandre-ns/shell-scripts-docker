### Arquivo para ser usado como base para automações mais elaboradas ou operações frequentes.

### Arquivos
- copy.sh - Arquivo para ser usado como base para automações mais elaboradasCopia um arquivo para um diretório dentro do container

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
