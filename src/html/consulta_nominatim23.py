import requests

# Substitua pelo seu place_id valido
place_id = 7983853 

# Parametros para a consulta Nominatim
params = {
    'place_id': place_id,
    'format': 'json'
}

# Realizando a consulta ao Nominatim
response = requests.get("https://nominatim.openstreetmap.org/reverse", params=params)
data = response.json()

# Verificando a resposta e extraindo o bounding box
if 'error' not in data:
    bounding_box = data.get('boundingbox', 'Bounding box nao disponivel')
    print("Bounding Box:", bounding_box)
else:
    print("Erro na consulta:", data.get('error'))

