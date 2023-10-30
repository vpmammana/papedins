<?php

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

try {
    $pdo = new PDO($dsn, $user, $pass, $options);

    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    $stmt1 = $pdo->prepare("SELECT nome_pessoa FROM pessoas WHERE id_chave_pessoa = ?");
    $stmt1->execute([$data['id_pessoa']]);
    $nomePessoa = $stmt1->fetchColumn();
    $primeiraPalavraPessoa = explode(' ', trim($nomePessoa))[0];

    $stmt2 = $pdo->prepare("SELECT nome_evidencia FROM evidencias WHERE id_chave_evidencia = ?");
    $stmt2->execute([$data['id_evidencia']]);
    $nomeEvidencia = $stmt2->fetchColumn();
    $primeiraPalavraEvidencia = explode(' ', trim($nomeEvidencia))[0];

    $nomeAutorEvidencia = $primeiraPalavraPessoa . '_' . $primeiraPalavraEvidencia . '_' . $data['id_pessoa'] . '_' . $data['id_evidencia'];

    $stmt3 = $pdo->prepare("INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa) VALUES (?, ?, ?)");
    $stmt3->execute([$nomeAutorEvidencia, $data['id_evidencia'], $data['id_pessoa']]);

    echo json_encode(['success' => true]);

} catch (\PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>

