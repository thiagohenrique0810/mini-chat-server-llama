#!/bin/bash

# Inicie o serviço Ollama
ollama serve &

# Aguarde o serviço Ollama inicializar (aumentado para ser mais seguro)
sleep 10

# Tente baixar o modelo várias vezes
max_attempts=3
attempt=1

while [ $attempt -le $max_attempts ]; do
    echo "Tentativa $attempt de $max_attempts para baixar o modelo llama3.2"
    ollama pull llama3.2
    
    if ollama list | grep -q 'llama3.2'; then
        echo "Modelo llama3.2 disponível."
        break
    fi
    
    if [ $attempt -eq $max_attempts ]; then
        echo "Falha ao baixar o modelo llama3.2 após $max_attempts tentativas."
        exit 1
    fi
    
    attempt=$((attempt + 1))
    sleep 5
done

# Inicie a aplicação Python
exec python3 app.py