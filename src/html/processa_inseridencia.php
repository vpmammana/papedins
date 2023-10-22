<?php
// Configurações de conexão com o banco de dados (substitua com suas configurações)

include "identifica.php.cripto";

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados; 

// Verifica se o formulário foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtém os dados do formulário
    $nome_evidencia = $_POST["nome_evidencia"];
    $id_token_tipo_de_evidencia = $_POST["id_token_tipo_de_evidencia"];
    $id_token_tipo_de_veiculo = $_POST["id_token_tipo_de_veiculo"];
    $data = $_POST["data"];

    // Conexão com o banco de dados
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Conexão falhou: " . $conn->connect_error);
    }

    // Prepara a consulta SQL para inserir dados na tabela "evidencias"
    $sql = "INSERT INTO evidencias (nome_evidencia, id_token_tipo_de_evidencia, id_token_tipo_de_veiculo, data) VALUES (?, ?, ?, ?)";

    // Prepara a declaração SQL
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Vincula os parâmetros à declaração SQL
        $stmt->bind_param("siis", $nome_evidencia, $id_token_tipo_de_evidencia, $id_token_tipo_de_veiculo, $data);

        // Executa a declaração SQL para inserir os dados
        if ($stmt->execute()) {
            echo "Dados inseridos com sucesso!";
        } else {
            echo "Erro ao inserir dados: " . $stmt->error;
        }

        // Fecha a declaração SQL
        $stmt->close();
    } else {
        echo "Erro na preparação da consulta: " . $conn->error;
    }

    // Fecha a conexão com o banco de dados
    $conn->close();
}
?>

