<?php
// Conexão com o banco de dados

include "identifica.php.cripto";

$host = "localhost";
$password = $pass;
$dbname = $nome_base_dados;

$conn = new mysqli($host, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Obtém os valores do POST
$valido = $_POST['valido'];
$idChave = $_POST['id_chave_duplo_token_para_grupo_de_token'];

// Prepara o comando SQL
$sql = "UPDATE duplos_tokens_para_grupos_de_tokens SET valido = ? WHERE id_chave_duplo_token_para_grupo_de_token = ?";
$stmt = $conn->prepare($sql);

// Vincula os parâmetros ao comando SQL
$stmt->bind_param("si", $valido, $idChave);

// Executa o comando
$stmt->execute();

// Fecha a conexão
$stmt->close();
$conn->close();
?>

