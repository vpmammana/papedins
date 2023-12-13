<?php
header('Content-Type: application/json');

include 'identifica.php.cripto';	

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados;

$idChaveEvidencia = isset($_GET['id_chave_evidencia']) ? intval($_GET['id_chave_evidencia']) : 1; // ou outro valor padrão adequado

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT latitude, longitude FROM evidencias WHERE id_chave_evidencia = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $idChaveEvidencia);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

echo json_encode($row);

$stmt->close();
$conn->close();
?>

