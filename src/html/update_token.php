<?php
// Conexão com o banco de dados
include "identifica.php.cripto";

$host = "localhost";
$user = $username;
$dbname = $nome_base_dados;

$connection = new mysqli($host, $user, $pass, $dbname);

if ($connection->connect_error) {
    die("Erro de conexão: " . $connection->connect_error);
}

if (isset($_POST['grupo_token']) && isset($_POST['id_token'])) {
    $idChaveGrupoToken = (int) $_POST['grupo_token'];
    $idToken = (int) $_POST['id_token'];

    $query = "UPDATE tokens SET id_grupo_de_token = ? WHERE id_chave_token = ?";

    $stmt = $connection->prepare($query);
    $stmt->bind_param('ii', $idChaveGrupoToken, $idToken);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
   header('Location: https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/arvore_de_tokens.php');
   exit;
 
	} else {
        echo "Erro ao atualizar ou nenhum registro foi alterado.";
    }

    $stmt->close();
} else {
    echo "Nenhum grupo de token selecionado ou ID de token não fornecido.";
}

$connection->close();
?>

