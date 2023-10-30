<?php

// Configurações do banco de dados

include "identifica.php.cripto";

$host = 'localhost';
$db = $nome_base_dados; 
$user = $username; 
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

// Conexão com o banco de dados
$pdo = new PDO($dsn, $user, $pass, $options);

// Busca os autores por evidência
$id_evidencia = $_GET['id_evidencia'];

$query = "
    SELECT ae.id_chave_autor_evidencia, p.nome_pessoa 
    FROM autores_evidencias ae
    JOIN pessoas p ON ae.id_pessoa = p.id_chave_pessoa 
    WHERE ae.id_evidencia = ?
";

$stmt = $pdo->prepare($query);
$stmt->execute([$id_evidencia]);
$autores = $stmt->fetchAll();

// Retornando o resultado em formato JSON
echo json_encode($autores);

?>

