<?php
// Recebe o corpo da requisição JSON

include "identifica.php.cripto";

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados;

$inputJSON = file_get_contents('php://input');

// Decodifica o JSON para um array associativo
$data = json_decode($inputJSON, true);

// Agora $data é um array associativo contendo os objetos enviados

file_put_contents("verifica_tokens.txt",json_encode($data, JSON_PRETTY_PRINT));

$nome_frase ="";
$espaco="";

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexão
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

for ($i = 0; $i<count($data); $i++) {
		
	$nome_frase = $nome_frase.$espaco.$data[$i]["token"];
	$espaco=" ";
	if (strlen($data[$i]["id_tipo_sintatico"])>0) {$id_tipo_elemento_sintatico = $data[$i]["id_tipo_sintatico"];}

} // fim do for

file_put_contents("frase.txt", count($data)." (".$i.") ".$nome_frase." -> ".$id_tipo_elemento_sintatico);


$stmt = $conn->prepare("INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES (?, ?);");
$stmt->bind_param("ss", $nome_frase, $id_tipo_elemento_sintatico);

// Definir valores e executar
$executou = $stmt->execute();

$last_id = $conn->insert_id;

if ($executou) {
	$response = array("status" => "success", "message" => "Dados recebidos com sucesso");
	$pode_inserir_tokens = true;
} else
{
	$response = array("status" => "fail", "message" => "Não foi possível inserir: ".$stmt->error);
	$pode_inserir_tokens = false;
}


//+-------------------------+--------------+------+-----+----------------------+--------------------------------+
//| Field                   | Type         | Null | Key | Default              | Extra                          |
//+-------------------------+--------------+------+-----+----------------------+--------------------------------+
//| id_chave_token_na_frase | int(11)      | NO   | PRI | NULL                 | auto_increment                 |
//| nome_token_na_frase     | varchar(200) | YES  |     | NULL                 |                                |
//| id_frase                | int(11)      | YES  | MUL | NULL                 |                                |
//| id_token                | int(11)      | YES  | MUL | NULL                 |                                |
//| ordem                   | int(11)      | YES  |     | NULL                 |                                |
//| id_categoria            | int
//| time_stamp              | timestamp(6) | NO   |     | current_timestamp(6) | on update current_timestamp(6) |
//+-------------------------+--------------+------+-----+----------------------+--------------------------------+

if ($pode_inserir_tokens) {

	for ($i = 0; $i<count($data); $i++) {
			if (strlen($data[$i]["token"]) > 0 && strlen($data[$i]["id_token"]) > 0 && strlen($data[$i]["ordem"]) > 0 && strlen($data[$i]["id_categoria"]) > 0)
				{
					$stmt = $conn->prepare("INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem, id_categoria) VALUES (?, ?, ? , ?, ?);");
					if (!$stmt) 
						{
								$response= array("status" => "erro_query", "message" => $response["message"]." erro na query: ".$stmt->error);  echo json_encode($response);  exit;
						}
					$stmt->bind_param("sssss", $data[$i]["token"], $last_id, $data[$i]["id_token"],$data[$i]["ordem"], $data[$i]["id_categoria"]);
					file_put_contents("parametros.txt",$data[$i]["token"].$last_id."-".$data[$i]["id_token"]."-".$data[$i]["ordem"]."-".$data[$i]["id_categoria"]);
					$executou2 = $stmt->execute();
					if ($executou2) {$reponse = array("status" => "token inserido", "message" => $response["message"]." Token '".$data[$i]["token"]."' inserido; ");}
					else {$reponse = array("status" => "token inserido", "message" => $response["message"]." erro: ".$stmt->error);}

				} 
					else 
						{$reponse = array("status" => "suspense", "message" => $response["message"]." Token vazio.");}
	} // fim do for
	echo json_encode($response);
}
else {
	echo json_encode($response);
}
$saida = var_export($response, true);

file_put_contents("resposta_grava_token.txt",$saida);

$stmt->close();
$conn->close();

?>

