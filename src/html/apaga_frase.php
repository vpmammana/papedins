<?php
// Configuração do banco de dados

include "identifica.php.cripto";

$host = 'localhost';
$db   = $nome_base_dados;
$user = $username;
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];
$pdo = new PDO($dsn, $user, $pass, $options);

// Obtendo o JSON enviado
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); // convertendo JSON para array

if (isset($input['id_frase'])) {
    $id_frase = $input['id_frase'];

    // Deletando da tabela usando PDO para prevenir SQL Injection
    $stmt = $pdo->prepare('DELETE FROM frases WHERE id_chave_frase = :id_frase');
    $stmt->execute(['id_frase' => $id_frase]);

    echo json_encode(['status' => 'success', 'message' => 'Entry deleted']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'id_frase not provided']);
}
?>

