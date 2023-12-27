<?php
include "identifica.php.cripto";

header('Content-Type: application/json');

$dados = json_decode(file_get_contents('php://input'), true);
$latitude = $dados['latitude'];
$longitude = $dados['longitude'];
$id_evidencia = $dados['id_evidencia']; // Recebendo id_evidencia via POST

// Conexão com o banco de dados
$conn = new mysqli('localhost', $username, $pass, $nome_base_dados);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Falha na conexão com o banco de dados: ' . $conn->connect_error]));
}
	file_put_contents("log_bounding.txt", "latitude: ".json_encode($latitude) . "\n", FILE_APPEND);
	file_put_contents("log_bounding.txt", "longitude: ".json_encode($longitude) . "\n", FILE_APPEND);

// Consulta SQL para encontrar endereços
$sql = "SELECT id_chave_endereco_do_OSM FROM enderecos_do_OSM WHERE ? >= limite_sul AND ? <= limite_norte AND ? >= limite_oeste AND ? <= limite_leste";
$stmt = $conn->prepare($sql);
$stmt->bind_param("dddd", $latitude, $latitude, $longitude, $longitude);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($endereco = $result->fetch_assoc()) {
	file_put_contents("log_bounding.txt", "id_chave_endereco_do_OSM: " . $endereco['id_chave_endereco_do_OSM'] . "\n", FILE_APPEND);
        // Inserção na tabela enderecos_evidencias para cada endereço encontrado
        $sql_insert = "INSERT INTO enderecos_evidencias (id_endereco_do_OSM, id_evidencia) VALUES (?, ?)";
        $stmt_insert = $conn->prepare($sql_insert);
        $stmt_insert->bind_param("ii", $endereco['id_chave_endereco_do_OSM'], $id_evidencia);
        $stmt_insert->execute();
    }
    echo json_encode(['isInsideBoundingBox' => true]);
} else {
    echo json_encode(['isInsideBoundingBox' => false]);
}

$conn->close();
?>

