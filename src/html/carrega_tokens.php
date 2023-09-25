<?php

if(isset($_GET["query"])){
  $param_query= $_GET["query"];
} else $param_query = "SELECT id_chave_token, nome_token FROM tokens WHERE id_tipo_token = 1 and nome_token like ?;";



if(isset($_GET["term"])){
  $param_term= $_GET["term"];
} else $param_term = "a";


$term = $param_term;


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

echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
?>

