import requests
import json

place_id =  7983853 # Substitua pelo seu place_id
params = {'place_id': place_id, 'format': 'json'}

response = requests.get("https://nominatim.openstreetmap.org/reverse", params=params)
data = response.json()

# Verifica se 'data' e um dicionario e contem a chave 'boundingbox
if isinstance(data, dict) and 'boundingbox' in data:
    bounding_box = data['boundingbox']
    print("Bounding Box:", bounding_box)
else:
    print("Formato de resposta nao esperado:", data)

