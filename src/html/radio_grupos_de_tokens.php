<?php
// Conexão com o banco de dados

include "identifica.php.cripto";

$host = "localhost";
$user = $username;
$dbname = $nome_base_dados;

echo '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Tokens</title>
    <style>
        #radioForm {
            font-family: Arial, sans-serif;
            max-width: 400px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin: 50px auto;
            border-radius: 8px;
        }

        #radioForm input[type="radio"] {
            margin-right: 10px;
            vertical-align: middle;
        }

        #radioForm label {
            font-size: 16px;
            color: #333;
            cursor: pointer;
        }

        #radioForm br {
            margin: 10px 0;
        }
    </style>
</head>
<body>';


$connection = new mysqli($host, $user, $pass, $dbname);

if ($connection->connect_error) {
    die("Erro de conexão: " . $connection->connect_error);
}

// Verificar e obter o valor do tipo via GET
$tipo = isset($_GET['tipo']) ? $connection->real_escape_string($_GET['tipo']) : 'evidencia';
$idToken = isset($_GET['id_token']) ? (int) $_GET['id_token'] : 0;

// Buscar o valor de id_grupo_de_token da tabela tokens
$queryToken = "SELECT id_grupo_de_token, nome_token FROM tokens WHERE id_chave_token = ?";
$stmt = $connection->prepare($queryToken);
$stmt->bind_param('i', $idToken);
$stmt->execute();
$resultToken = $stmt->get_result();
$rowToken = $resultToken->fetch_assoc();
$idGrupoTokenSelecionado = $rowToken['id_grupo_de_token'] ?? null;
$nome_token = $rowToken['nome_token'] ?? null;
$stmt->close();

// Selecione os registros com base no tipo fornecido
$query = "SELECT id_chave_grupo_de_token, acentuada FROM grupos_de_tokens WHERE tipo = '$tipo'";
$result = $connection->query($query);

echo '<form action="update_token.php" method="post" id="radioForm"><h3 style="text-align: left; font-family: Arial, sans-serif; margin-bottom: 20px;">Grupo de "' . htmlspecialchars($nome_token) . '"</h3>';
if ($result->num_rows > 0) {
    // Gere os radio buttons
    while ($row = $result->fetch_assoc()) {
        $checked = ($idGrupoTokenSelecionado == $row['id_chave_grupo_de_token']) ? 'checked' : '';
        echo '<input type="radio" name="grupo_token" value="' . $row['id_chave_grupo_de_token'] . '" data-id-chave-grupo-token="' . $row['id_chave_grupo_de_token'] . '" onclick="document.getElementById(\'radioForm\').submit();" ' . $checked . '>';
        echo $row['acentuada'];
        echo '<br>';
    }
} else {
    echo "Nenhum grupo de token encontrado.";
}

echo '<input type="hidden" name="id_token" value="' . $idToken . '">';

echo '</form>';

echo '</body></html>';


$connection->close();
?>

