<?php
function cria_script_update_grupo() {
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
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

$query = "SELECT nome_token, id_grupo_de_token, (SELECT nome_grupo_de_token FROM grupos_de_tokens where id_chave_grupo_de_token = id_grupo_de_token) as nome_grupo FROM tokens WHERE id_grupo_de_token IS NOT NULL";
$stmt = $pdo->prepare($query);
$stmt->execute();

$updates = [];
while ($row = $stmt->fetch()) {
    $updates[] = "UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='".$row['nome_grupo']."') WHERE nome_token = '{$row['nome_token']}';";
}

$file = 'script_update_grupo.sql';
file_put_contents($file, implode("\n", $updates));

echo "Script gerado com sucesso!";
}
?>

