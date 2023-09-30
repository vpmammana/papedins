<?php

include "identifica.php.cripto";
file_put_contents("query3.txt", "Início\n\n");
file_put_contents("linhas_de_elementos.txt", "Início\n\n");
function mostra_frases($id_tipo_sintatico)
{
global $dsn;
global $user;
global $pass;
	$pdo4 = new PDO($dsn, $user, $pass);
	$id_frase="" ;
	$linha="";
	$finalizacao="";
	$close_div="";
	$query3 = 'select nome_tipo_elemento_sintatico as tipo, nome_token_na_frase, nome_token, id_chave_frase from tipos_elementos_sintaticos, frases, tokens_nas_frases, tokens where id_tipo_elemento_sintatico="'.$id_tipo_sintatico.'" and id_tipo_elemento_sintatico =id_chave_tipo_elemento_sintatico and id_chave_frase=id_frase and id_token = id_chave_token order by id_chave_frase, ordem;';
	$stmt3 = $pdo4->prepare($query3);
	$stmt3->execute();
	$rows3 = $stmt3->fetchAll(PDO::FETCH_ASSOC);
	$nome_frase = "";
	$espaco="";
	file_put_contents("query3.txt", $query3."\n\n", FILE_APPEND);
	file_put_contents("linhas_de_elementos.txt", $query3."> ".$id_tipo_sintatico." ".count($rows3)."\n", FILE_APPEND);
	$id_frase_velho="";
	if (count($rows3)>0) {
	foreach ($rows3 as $row3) {
		$nome_token			= $row3["nome_token"];
		$id_frase			= $row3["id_chave_frase"];
		$nome_frase = $nome_frase.$espaco.$nome_token;
		if (strlen($nome_token)>0) {$espaco=" ";}
	if ($id_frase != $id_frase_velho || $id_frase=="") {
			if (strlen($nome_token)>0) {$espaco_inicial="  ";} else {$espaco_inicial="";}
			$linha = $linha.$close_div."<div id='frase_".$id_frase."' class='frase'>".$nome_token." ";
		} else {
			$linha = $linha.$espaco.$nome_token;
			$close_div= "</div>";
		}
		$id_frase_velho = $id_frase;
}
				file_put_contents("linha.txt",$linha, FILE_APPEND);
				file_put_contents("linhas_de_elementos.txt", $linha, FILE_APPEND);
	$finalizacao="</div>";
	}
return $linha.$finalizacao;
}


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
$frases="";

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

//			if (strlen($fecha_div)>0) {
			echo "<br>";
				$frases = mostra_frases($id_tipo_elemento_sintatico);
//			}

			echo $fecha_div.'<div id="tipo_sintatico_'.str_replace(" ","_",$exp_sql).'" class="tipo_automata" data-id-tipo-elemento-sintatico="'.$id_tipo_elemento_sintatico.'"><b>'.$id_tipo_elemento_sintatico.") ".$exp_sql.'</b><br><br>';	
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

$fecha_div=$frases."<br><br><div style='width: 100%; display: inline-block;'><input class='botao' id='botao_".$id_tipo_elemento_sintatico."' style='float: right' type='button' value='guarda' data-id-tipo-sintatico='".$id_tipo_elemento_sintatico."' data-nome-tipo-sintatico='".str_replace(" ", "_",$nome_classe_tipo_sintatico)."'></div></div>";
	
}

mostra_frases($id_tipo_elemento_sintatico);
				
echo $fecha_div;
echo '
    <script src="script.js"></script>
</body>
</html>';

?>

