from flask import Flask, request, jsonify
from pymongo import MongoClient

app = Flask(__name__)

# Conexión a la base de datos MongoDB
client = MongoClient('dbmongo://mongodb.db-dylan.svc.cluster.local:27017/')
db = client['test']
collection = db['users']

# Endpoint para almacenar un usuario en la base de datos
@app.route('/api/users', methods=['POST'])
def create_user():
    data = request.json
    if 'name' in data:
        name = data['name']
        user = {'name': name}
        collection.insert_one(user)
        return jsonify({'message': 'Usuario creado exitosamente'}), 201
    else:
        return jsonify({'error': 'Se requiere un campo "name" en el cuerpo de la solicitud'}), 400

# Endpoint para obtener todos los usuarios almacenados en la base de datos
@app.route('/api/users', methods=['GET'])
def get_users():
    users = [user['name'] for user in collection.find({}, {'_id': 0})]
    return jsonify(users)

if __name__ == '__main__':
      app.run(host='0.0.0.0', port=5000, debug=True)