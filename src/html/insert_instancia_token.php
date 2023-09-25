<?php
// Obtenha os dados JSON da requisição
$jsonData = file_get_contents('php://input');

// Decodifique o JSON em um array associativo de PHP
$arrayOfObjects = json_decode($jsonData, true);

// Agora, $arrayOfObjects é um array de arrays associativas,
// onde cada array associativo representa um objeto

// Processar o array de objetos conforme necessário...
foreach($arrayOfObjects as $obj) {
    $nome = $obj['nome'];
    $idade = $obj['idade'];
    // ... fazer algo com $nome e $idade
}

// Para enviar uma resposta de volta para o JavaScript:
$responseData = ['status' => 'ok'];
echo json_encode($responseData);
?>


