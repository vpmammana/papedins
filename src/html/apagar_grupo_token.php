<?php

include "identifica.php.cripto";

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados;

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$response = ["success" => false];

$id_token = isset($_POST['id_token']) ? (int) $_POST['id_token'] : 0;

if ($id_token) {
    $sql = "UPDATE tokens SET id_grupo_de_token = NULL WHERE id_chave_token = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_token);

    if ($stmt->execute()) {
	        $response["success"] = true;
    }

    $stmt->close();
}

$conn->close();
echo json_encode($response);
?>

