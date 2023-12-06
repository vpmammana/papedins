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

// Obtém o valor do POST
$idChave = $_POST['id_chave_duplo_token_para_grupo_de_token'];

// Prepara o comando SQL
$sql = "SELECT valido FROM duplos_tokens_para_grupos_de_tokens WHERE id_chave_duplo_token_para_grupo_de_token = ?";
$stmt = $conn->prepare($sql);

// Vincula o parâmetro ao comando SQL
$stmt->bind_param("i", $idChave);

// Executa o comando
$stmt->execute();

// Vincula o resultado a uma variável
$stmt->bind_result($valido);

// Obtém o resultado
$stmt->fetch();

// Retorna o resultado
echo $valido;

// Fecha a conexão
$stmt->close();
$conn->close();
?>

