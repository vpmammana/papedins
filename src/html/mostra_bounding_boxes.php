<?php
// Conexão com o banco de dados

include "identifica.php.cripto";

$host = "localhost";
$password = $pass; 
$dbname = $nome_base_dados;

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta SQL
$sql = "SELECT limite_sul, limite_norte, limite_oeste, limite_leste FROM enderecos_do_OSM";
$result = $conn->query($sql);

// Variáveis para armazenar os limites extremos
$minLat = 90.0;
$maxLat = -90.0;
$minLng = 180.0;
$maxLng = -180.0;

// Processamento dos dados para encontrar limites extremos
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $minLat = min($minLat, $row["limite_sul"]);
        $maxLat = max($maxLat, $row["limite_norte"]);
        $minLng = min($minLng, $row["limite_oeste"]);
        $maxLng = max($maxLng, $row["limite_leste"]);
    }
}

// Inicialização do mapa (usando Leaflet JS)
echo '<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />';
echo '<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>';
echo '<div id="map" style="height: 100%;"></div>';
echo '<script>
      var map = L.map("map");
      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "&copy; OpenStreetMap contributors"
      }).addTo(map);';

// Redefinir a consulta para plotar os retângulos
$result = $conn->query($sql);

// Plotagem dos retângulos
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $south = $row["limite_sul"];
        $north = $row["limite_norte"];
        $west = $row["limite_oeste"];
        $east = $row["limite_leste"];

        // Desenhar retângulo no mapa
        echo "L.rectangle([[$south, $west], [$north, $east]], {color: '#0000FF', weight: 1}).addTo(map);";
    }
}

// Ajustar a vista do mapa para incluir todos os retângulos
echo "map.fitBounds([[$minLat, $minLng], [$maxLat, $maxLng]]);";

echo '</script>';

$conn->close();
?>

