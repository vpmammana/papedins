<?php

include "identifica.php.cripto";

// Configurações do banco de dados
$host = 'localhost';
$dbname = $nome_base_dados; 
$user = $username;
$charset = 'utf8mb4';

$options = array(
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
);

// Estabelecendo a conexão
$pdo = new PDO('mysql:host=' . $host . ';dbname=' . $dbname . ';charset=' . $charset, $user, $pass, $options);

// Coletando o ID enviado via GET
$id_chave_autor_evidencia = $_GET['id_chave_autor_evidencia'];

// Preparando e executando a query de delete
$response = array('success' => false);
try {
    $stmt = $pdo->prepare('DELETE FROM autores_evidencias WHERE id_chave_autor_evidencia = ?');
    if ($stmt->execute(array($id_chave_autor_evidencia))) {
        $response['success'] = true;
    }
} catch (Exception $e) {
    $response['error'] = $e->getMessage();
}

// Enviando resposta
echo json_encode($response);

?>

