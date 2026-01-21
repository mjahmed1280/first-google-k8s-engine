from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    print("Hello from Flask on Kubernetes!")
    return jsonify({"message": "Hello from Flask on Kubernetes!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
