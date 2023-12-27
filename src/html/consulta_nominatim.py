import requests

params = {
    'place_id': '7983853',
    'format': 'json',
    'polygon_geojson': 1
}

response = requests.get("https://nominatim.openstreetmap.org/search", params=params)
data = response.json()

# Exemplo de como extrair bounding boxes
for place in data:
    bounding_box = place['boundingbox']
    print("Bounding Box:", bounding_box)

