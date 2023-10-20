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


if(isset($_POST['nome_tipo_veiculo'], $_POST['id_token_veiculo'], $_POST['checked_status_veiculo'])) {
    $nome_tipo_veiculo = $_POST['nome_tipo_veiculo'];
    $id_token_veiculo = $_POST['id_token_veiculo'];
    $isChecked = $_POST['checked_status_veiculo'] === "1";

    if ($isChecked) {
        // Se o checkbox foi marcado, insere o registro na tabela
        $stmt = $pdo->prepare("INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES (?, ?)");
        if ($stmt->execute([$nome_tipo_veiculo, $id_token_veiculo])) {
            echo "Registro inserido!";
        } else {
            print_r($stmt->errorInfo()); // Mostra informações de erro
        }
    } else {
        // Se o checkbox foi desmarcado, remove o registro da tabela
        $stmt = $pdo->prepare("DELETE FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = ? AND id_token = ?");
        if ($stmt->execute([$nome_tipo_veiculo, $id_token_veiculo])) {
            echo "Registro removido!";
        } else {
            print_r($stmt->errorInfo()); // Mostra informações de erro
        }
    }
} else {
    exit("Dados não recebidos corretamente.");
}


?>


