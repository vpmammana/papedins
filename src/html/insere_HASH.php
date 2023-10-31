<?php
function insertFileHash($filename, $id_evidencia) {
    $host = "localhost"; // Endereço do servidor
    $user = "username";  // Usuário do banco de dados
    $pass = "password";  // Senha do banco de dados
    $db   = "database";  // Nome do banco de dados

    // Conexão com o banco de dados
    $conn = new mysqli($host, $user, $pass, $db);
    if ($conn->connect_error) {
        die("Falha na conexão: " . $conn->connect_error);
    }

    $relativePath = '../../imagens/' . $filename;

    if (!file_exists($relativePath)) {
        $conn->close();
        return false;
    }

    $hash = hash_file('sha256', $relativePath);

    // Busca o id do tipo de identificador correspondente ao nome "HASH_FILE"
    $query = "SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = 'HASH_FILE'";
    $result = $conn->query($query);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $id_tipo_de_identificador = $row['id_chave_tipo_de_identificador'];

        // Verifica se a combinação (id_evidencia, id_tipo_de_identificador) já existe
        $checkQuery = "SELECT 1 FROM evidencias_tipos_de_evidencias WHERE id_evidencia = ? AND id_tipo_de_identificador = ?";
        $checkStmt = $conn->prepare($checkQuery);
        $checkStmt->bind_param("ii", $id_evidencia, $id_tipo_de_identificador);
        $checkStmt->execute();
        $checkResult = $checkStmt->get_result();

        if ($checkResult->num_rows > 0) {
            // Se já existe, atualiza o valor
            $updateQuery = "UPDATE evidencias_tipos_de_evidencias SET valor = ? WHERE id_evidencia = ? AND id_tipo_de_identificador = ?";
            $updateStmt = $conn->prepare($updateQuery);
            $updateStmt->bind_param("sis", $hash, $id_evidencia, $id_tipo_de_identificador);
            $updateStmt->execute();
            $updateStmt->close();
        } else {
            // Se não existe, insere o novo valor
            $insertStmt = $conn->prepare("INSERT INTO evidencias_tipos_de_evidencias (id_tipo_de_identificador, id_evidencia, valor) VALUES (?, ?, ?)");
            $insertStmt->bind_param("iis", $id_tipo_de_identificador, $id_evidencia, $hash);
            $insertStmt->execute();
            $insertStmt->close();
        }

        $checkStmt->close();
        $conn->close();
        return true;
    }

    $conn->close();
    return false;
}
?>
