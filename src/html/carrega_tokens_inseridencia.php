<?php

if(isset($_GET["query"])){
  $param_query= $_GET["query"];
} else $param_query = "SELECT id_chave_token, nome_token FROM tokens WHERE id_tipo_token = 1 and nome_token like ?;";

if(isset($_GET["term"])){
  $param_term= $_GET["term"];
} else $param_term = "a";

$term = $param_term;

file_put_contents("debug_json.txt", $param_query);

include "identifica.php.cripto";

$host = 'localhost';
$db   = $nome_base_dados;
$user = $username;;
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$pdo = new PDO($dsn, $user, $pass);

$query = $param_query;
$stmt = $pdo->prepare($query);
$stmt->execute(["$term%"]);

$temp=json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
$output = preg_replace('/id_token[A-Za-z0-9_-]*/', 'id_token', $temp);
$output = preg_replace('/nome_tipo[A-Za-z0-9_-]*/', 'nome_tipo', $output);
file_put_contents("debug_json.txt", $output, FILE_APPEND);

echo $output;
?>

