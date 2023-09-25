<?php

include "identifica.php.cripto";

$host = 'localhost';
$db   = $nome_base_dados;
$user = $username;;
$charset = 'utf8mb4';


$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$pdo = new PDO($dsn, $user, $pass);
$pdo2 = new PDO($dsn, $user, $pass);


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

$linha = 0;
$ordem=0;
$id_tipo_elemento_sintatico="0";
$nome_classe_tipo_sintatico = "";
foreach ($rows as $row) {

$nivel 				= $row["niveis_temp"];
$nome_tipo_secao 		= $row["nome_tipo_secao"];
$trecho				= $row["trecho"];
$nome_tipo_token 	= $row["nome_tipo_token"];
$exp_sql		 	= $row["exp_sql"];

if ($nome_tipo_secao == "estrutura" && $nivel == 1)
		{

			$query2 ="select id_chave_tipo_elemento_sintatico from tipos_elementos_sintaticos where nome_tipo_elemento_sintatico='".$exp_sql."';";
			$stmt2 = $pdo2->prepare($query2);
			$stmt2->execute();
			$rows2 = $stmt2->fetchAll(PDO::FETCH_ASSOC);
			foreach ($rows2 as $row2) {
				$id_tipo_elemento_sintatico = $row2["id_chave_tipo_elemento_sintatico"];
				$nome_classe_tipo_sintatico = $exp_sql;
			}
			echo $fecha_div.'<div id="tipo_sintatico_'.str_replace(" ","_",$exp_sql).'" class="tipo_automata" data-id-tipo-elemento-sintatico="'.$id_tipo_elemento_sintatico.'"><b>'.$exp_sql.'</b><br><br>';	
			$ordem=0;
		}
else 
		{
			echo'
			<div class="automata">'.$nome_tipo_token.'<br>
				<div id="drop_'.$linha.'" class="dropdown-wrapper" data-sql="'.$exp_sql.'">
				    <input id="input_'.$linha.'" type="text" class="search-input '.str_replace(" ","_",$nome_classe_tipo_sintatico).'" placeholder="Digite para buscar..." data-id-token="" data-ordem="'.$ordem.'" data-id-tipo-elemento-sintatico="'.$id_tipo_elemento_sintatico.'">
				    <div class="results"></div>
				</div>
			</div>
			';
		     $linha++;
			 $ordem++;
		}
$fecha_div="<br><div style='width: 100%; display: inline-block;'><input class='botao' id='botao_".$id_tipo_elemento_sintatico."' style='float: right' type='button' value='guarda' data-id-tipo-sintatico='".$id_tipo_elemento_sintatico."' data-nome-tipo-sintatico='".str_replace(" ", "_",$nome_classe_tipo_sintatico)."'></div></div>";
	
}

echo $fecha_div;
echo '
    <script src="script.js"></script>
</body>
</html>';

?>

