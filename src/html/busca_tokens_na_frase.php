<?php
header("Content-Type: application/json; charset=UTF-8");

include "identifica.php.cripto";

// Configurações do banco de dados
$host = "localhost";
$db   = $nome_base_dados;
$user = $username;

$pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);

// Verificar se o parâmetro id_frase foi enviado
if(isset($_GET['id_frase'])) {
    $id_frase = (int) $_GET['id_frase'];
    
    // Preparar e executar consulta
    $stmt = $pdo->prepare("SELECT * FROM tokens_nas_frases WHERE id_frase = ? ORDER BY ordem");
    $stmt->execute([$id_frase]);
    
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($result);
} else {
    echo json_encode(["error" => "Parâmetro id_frase não fornecido."]);
}
?>

