<?php
// Supondo que você esteja usando PDO para conectar ao banco

include "identifica.php.cripto";

$host = 'localhost';
$db   = $nome_base_dados;
$user = $username;
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];
$pdo = new PDO($dsn, $user, $pass, $options);

//exit(json_encode($_POST));

if(isset($_POST['nome_tipo_evidencia'], $_POST['id_token'], $_POST['checked_status'])) {
    $nome_tipo_evidencia = $_POST['nome_tipo_evidencia'];
    $id_token = $_POST['id_token'];
    $isChecked = $_POST['checked_status'] === "1";

    if ($isChecked) {
        // Se o checkbox foi marcado, insere o registro na tabela
        $stmt = $pdo->prepare("INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES (?, ?)");
        if ($stmt->execute([$nome_tipo_evidencia, $id_token])) {
            echo "Registro inserido!";
        } else {
            print_r($stmt->errorInfo()); // Mostra informações de erro
        }
    } else {
        // Se o checkbox foi desmarcado, remove o registro da tabela
        $stmt = $pdo->prepare("DELETE FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia = ? AND id_token = ?");
        if ($stmt->execute([$nome_tipo_evidencia, $id_token])) {
            echo "Registro removido!";
        } else {
            print_r($stmt->errorInfo()); // Mostra informações de erro
        }
    }
} else {
    exit("Dados não recebidos corretamente.");
}


// Pega os valores dos atributos data-* do checkbox

// if(isset($_POST['nome_tipo_evidencia']) && isset($_POST['id_token'])) {
//     $nome_tipo_evidencia = $_POST['nome_tipo_evidencia'];
//     $id_token = $_POST['id_token'];
// } else {
//     exit("Dados não recebidos corretamente.");
// }
// 
// if (isset($_POST['evidencia']) && $_POST['evidencia']==='checked' ) {
//     // Se o checkbox foi marcado, insere o registro na tabela
//     $stmt = $pdo->prepare("INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES (?, ?)");
//     $stmt->execute([$nome_tipo_evidencia, $id_token]);
//     echo "Registro inserido!";
// } else {
//     // Se o checkbox foi desmarcado, remove o registro da tabela
//     $stmt = $pdo->prepare("DELETE FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia = ? AND id_token = ?");
//     $stmt->execute([$nome_tipo_evidencia, $id_token]);
//     echo "Registro removido!";
// }
?>


