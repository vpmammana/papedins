<?php
header('Content-Type: application/json');

include 'identifica.php.cripto';

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados;

// Conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id_chave_evidencia, latitude, longitude FROM evidencias";
$result = $conn->query($sql);

$coordenadas = [];
while ($row = $result->fetch_assoc()) {
    $coordenadas[] = $row;
}

echo json_encode($coordenadas);

$conn->close();
?>

