<?php

include "identifica.php.cripto";

$host = 'localhost';
$db   = $nome_base_dados;
$user = $username;;
$charset = 'utf8mb4';


$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$pdo = new PDO($dsn, $user, $pass);


echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dropdown com Busca</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>';


$query = 'call mostra_documento_completo_niveis_sem_lixeira_automata("estrutura");';
$stmt = $pdo->prepare($query);
$stmt->execute();

$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

$fecha_div="";

foreach ($rows as $row) {

$nivel 				= $row["niveis_temp"];
$nome_tipo_secao 		= $row["nome_tipo_secao"];
$trecho				= $row["trecho"];
$nome_tipo_token 	= $row["nome_tipo_token"];
$exp_sql		 	= $row["exp_sql"];

if ($nome_tipo_secao == "estrutura" && $nivel == 1)
		{
			echo $fecha_div.'<div class="tipo_automata"><b>'.$exp_sql.'</b><br>';	
		}
else 
		{
			echo'
			<div class="automata">'.$nome_tipo_token.'<br>
				<div id="drop1" class="dropdown-wrapper" data-sql="'.$exp_sql.'">
				    <input type="text" class="search-input" placeholder="Digite para buscar...">
				    <div class="results"></div>
				</div>
			</div>
			';
		}
$fecha_div="</div>";
	
}


echo '
    <script src="script.js"></script>
</body>
</html>';

?>

