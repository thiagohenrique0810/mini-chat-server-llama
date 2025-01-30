# Llama API Docker

Uma API REST simples que encapsula o modelo Llama 3.2 usando Ollama, permitindo interações via requisições HTTP. Este projeto oferece uma maneira fácil de integrar o modelo de linguagem Llama em suas aplicações através de uma API containerizada.

## 🚀 Características

- API REST com Flask
- Containerização completa com Docker
- Integração com Ollama
- Sistema de retry para download do modelo
- Tratamento de timeouts e erros
- Fácil de expandir e customizar

## 📋 Pré-requisitos

- Docker
- 8GB+ de RAM recomendado
- 10GB+ de espaço em disco
- Conexão com internet (para download inicial do modelo)

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/llama-api-docker
cd llama-api-docker
```

2. Construa a imagem Docker:
```bash
docker build -t llama-api .
```

3. Execute o container:
```bash
docker run -p 8000:8000 -p 11434:11434 llama-api
```

Na primeira execução, o sistema irá baixar o modelo Llama 3.2, o que pode levar alguns minutos dependendo da sua conexão com a internet.

## 🔍 Uso

Para interagir com a API, envie requisições POST para o endpoint `/chat`:

```bash
curl -X POST http://localhost:8000/chat \
     -H "Content-Type: application/json" \
     -d '{"message": "Qual é a capital do Brasil?"}'
```

Exemplo de resposta:
```json
{
    "response": "A capital do Brasil é Brasília."
}
```

## 🛠️ Estrutura do Projeto

```
.
├── Dockerfile
├── app.py          # Aplicação Flask
├── entrypoint.sh   # Script de inicialização
└── requirements.txt
```

## ⚙️ Configuração

O projeto usa as seguintes portas por padrão:
- 8000: API Flask
- 11434: Serviço Ollama

Você pode modificar estas portas no Dockerfile e no código da aplicação conforme necessário.

## 🤝 Contribuindo

1. Faça um Fork do projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## ⚠️ Limitações Conhecidas

- O modelo requer uma quantidade significativa de RAM
- O primeiro download do modelo pode ser demorado
- As respostas podem levar alguns segundos dependendo da complexidade da pergunta

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📬 Contato

Seu Nome - [@seu-twitter](https://twitter.com/seu-twitter) - email@exemplo.com

Link do projeto: [https://github.com/seu-usuario/llama-api-docker](https://github.com/seu-usuario/llama-api-docker)
