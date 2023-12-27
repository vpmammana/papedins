import requests

osm_id =  150205625 # Substitua pelo seu osm_id valido

url = "https://nominatim.openstreetmap.org/reverse?format=json&osm_id={}".format(osm_id)

response = requests.get(url)
data = response.json()

if 'error' not in data:
    bounding_box = data.get('boundingbox', 'Bounding box nao disponivel')
    print("Bounding Box:", bounding_box)
    print("Nome do Local:", data.get('display_name', 'Nome nao disponivel'))
else:
    print("Erro na consulta:", data.get('error'))

