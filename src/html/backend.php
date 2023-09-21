<?php
include "identifica.php.cripto";

$host = 'localhost';
$db   = $nome_base_dados;
$user = $username;;
$charset = 'utf8mb4';


$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$pdo = new PDO($dsn, $user, $pass);

$term = $_GET['term'];
$query = "SELECT nome_token FROM tokens WHERE id_tipo_token = 1 and nome_token like ?;";
$stmt = $pdo->prepare($query);
$stmt->execute(["$term%"]);

echo json_encode($stmt->fetchAll(PDO::FETCH_COLUMN));
?>

