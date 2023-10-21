<?php

if(isset($_GET["query"])){
  $param_query= $_GET["query"];
} else $param_query = "SELECT id_token, nome_tipo_de_evidencias FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia like ?;";



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

