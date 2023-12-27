import requests


# -22.86059930 | -22.85772110 | -46.94777590 | -46.94640670 

# Defina sua consulta Overpass QL
# Por exemplo, todos os predios em uma area especifica
overpass_url = "http://overpass-api.de/api/interpreter"
overpass_query = """
[out:json][timeout:25];
// insira sua consulta aqui
(way["building"](-22.865,-46.948,-22.850,-46.946););
out body;
>;
out skel qt;
"""

response = requests.get(overpass_url, params={'data': overpass_query})
data = response.json()

print(data)

# Converta para GeoJSON usando uma biblioteca Python, como osm2geojson

