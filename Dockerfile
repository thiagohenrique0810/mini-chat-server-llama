# Dockerfile
FROM ollama/ollama:latest

# Instalar Python e dependências necessárias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Diretório de trabalho
WORKDIR /app

# Copiar arquivos necessários
COPY requirements.txt .
COPY app.py .
COPY entrypoint.sh .

# Instalar dependências Python
RUN pip3 install --no-cache-dir -r requirements.txt

# Dar permissão de execução ao entrypoint
RUN chmod +x entrypoint.sh

# Expor as portas necessárias (Ollama usa 11434 e nossa API usa 8000)
EXPOSE 11434 8000

# Definir o entrypoint
ENTRYPOINT ["./entrypoint.sh"]