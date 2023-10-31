<?php
function insertFileHash($filename, $id_evidencia) {
    $dir = '../../imagens/';
    $file = $dir . $filename;
    $hash = '';

    if(file_exists($file)) {
        $hash = hash_file('md5', $file);
    } else {
        return "Error: File does not exist!";
    }

    $conn = new mysqli('localhost', 'username', 'password', 'database_name');

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = ?");
    $stmt->bind_param('s', $type);
    $type = 'HASH_FILE';
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 0) {
        $stmt->close();
        $conn->close();
        return "Error: HASH_FILE type not found!";
    }

    $row = $result->fetch_assoc();
    $id_tipo = $row['id_chave_tipo_de_identificador'];
    $stmt->close();

    $stmtInsert = $conn->prepare("INSERT INTO evidencias_tipos_de_evidencias (id_tipo_de_identificador, id_evidencia, valor) VALUES (?, ?, ?)");
    $stmtInsert->bind_param('iis', $id_tipo, $id_evidencia, $hash);

    if (!$stmtInsert->execute()) {
        if ($conn->errno == 1644) { // Capturing the custom error number for SIGNAL SQLSTATE '45000'
            $errorMsg = $conn->error; 
            $stmtInsert->close();
            $conn->close();
            return $errorMsg;
        } else {
            $stmtInsert->close();
            $conn->close();
            return "Error inserting data: " . $conn->error;
        }
    }

    $stmtInsert->close();
    $conn->close();
    return "Hash inserted successfully!";
}
?>
