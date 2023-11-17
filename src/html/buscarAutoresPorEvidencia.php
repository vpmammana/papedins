<?php

// Configurações do banco de dados

if (isset($parametro_saida_string)) {
	$saida_string = $parametro_saida_string;
} else {
	$saida_string = "saida_json";
}

include "identifica.php.cripto";

$host = 'localhost';
$db = $nome_base_dados; 
$user = $username; 
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

// Conexão com o banco de dados
$pdo = new PDO($dsn, $user, $pass, $options);

// Busca os autores por evidência
$id_evidencia = $_GET['id_evidencia'];

$query = "
    SELECT ae.id_chave_autor_evidencia, p.nome_pessoa 
    FROM autores_evidencias ae
    JOIN pessoas p ON ae.id_pessoa = p.id_chave_pessoa 
    WHERE ae.id_evidencia = ?
";

$stmt = $pdo->prepare($query);
$stmt->execute([$id_evidencia]);
$autores = $stmt->fetchAll();
$saida_html = "";
// Retornando o resultado em formato JSON
if ($saida_string=="saida_json") {echo json_encode($autores);}
if ($saida_string=="saida_html") {
    foreach ($autores as $autor) {
    $saida_html = $saida_html.'<div title="'.$autor['nome_pessoa'].'"><button data-id-autores-evidencias="'.$autor['id_chave_autor_evidencia'].'" onclick="apagarAutor('.$autor['id_chave_autor_evidencia'].','.$id_evidencia.')">Apaga</button>&nbsp;'.$autor['nome_pessoa'].'</div>';
    }
}

?>

