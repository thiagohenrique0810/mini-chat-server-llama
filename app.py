# Correções para app.py:
from flask import Flask, request, jsonify
import subprocess
import time

app = Flask(__name__)

@app.route('/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    if not user_message:
        return jsonify({'error': 'Mensagem não fornecida'}), 400

    try:
        # Adicionar timeout e verificar se o Ollama está pronto
        result = subprocess.run(
            ['ollama', 'run', 'llama3.2', user_message],
            capture_output=True,
            text=True,
            timeout=30
        )
        
        if result.returncode != 0:
            return jsonify({'error': f'Erro do Ollama: {result.stderr}'}), 500
            
        assistant_message = result.stdout.strip()
        return jsonify({'response': assistant_message})
    except subprocess.TimeoutExpired:
        return jsonify({'error': 'Tempo limite excedido'}), 504
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    # Aguardar o Ollama inicializar completamente
    time.sleep(10)
    app.run(host='0.0.0.0', port=8000)
