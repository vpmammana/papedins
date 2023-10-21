<?php
// Conexão com o banco de dados (substitua com suas configurações)

include "identifica.php.cripto";

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados;

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Captura os valores enviados pelo formulário
$nome_evidencia = $_POST['nome_evidencia'];
$id_tipo_de_evidencia = $_POST['id_tipo_de_evidencia'];
$titulo = $_POST['titulo'];
$data = $_POST['data'];

// Prepara a instrução SQL para inserção
$sql = "INSERT INTO evidencias (nome_evidencia, id_tipo_de_evidencia, titulo, data) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("siss", $nome_evidencia, $id_tipo_de_evidencia, $titulo, $data);

// Executa a inserção
if ($stmt->execute()) {
    echo "Evidência inserida com sucesso.";
} else {
    echo "Erro ao inserir a evidência: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>

