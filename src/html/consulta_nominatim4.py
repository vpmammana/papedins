import requests

# Substitua pelo seu place_id valido
place_id = 123456789

# Montando a URL da consulta
url = f"https://nominatim.openstreetmap.org/reverse?format=json&place_id={place_id}"

# Realizando a consulta ao Nominatim
response = requests.get(url)
data = response.json()

# Verificando a resposta e extraindo o bounding box
if 'error' not in data:
    bounding_box = data.get('boundingbox', 'Bounding box nao disponivel')
    print("Bounding Box:", bounding_box)
else:
    print("Erro na consulta:", data.get('error'))

