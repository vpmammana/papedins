<?php

function getConcatenatedString($host, $dbUser, $dbPassword, $dbName, $id_evidencia, $nome_tipo_de_identificador) {
    $dbConnection = new mysqli($host, $dbUser, $dbPassword, $dbName);
    
    // Verifique a conexão
    if ($dbConnection->connect_error) {
        die("Conexão falhou: " . $dbConnection->connect_error);
        return false;
    }

    $sql = "
        SELECT 
            SUBSTRING_INDEX(e.nome_evidencia, ' ', 1) AS first_word_nome_evidencia,
            SUBSTRING_INDEX(t.nome_tipo_de_identificador, ' ', 1) AS first_word_nome_tipo,
            e.id_chave_evidencia,
            t.id_chave_tipo_de_identificador
        FROM 
            evidencias e
        JOIN 
            tipos_de_identificadores t
        WHERE
            e.id_chave_evidencia = ? AND t.id_chave_tipo_de_identificador = (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = ?);
    ";  // Adicionamos cláusulas WHERE para filtrar pelos identificadores fornecidos

    if($stmt = $dbConnection->prepare($sql)) {
        $stmt->bind_param('is', $id_evidencia, $nome_tipo_de_identificador);
        $stmt->execute();

        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $concatenatedString = $row['first_word_nome_evidencia'] . '_' . $row['first_word_nome_tipo'] . '_' . $row['id_chave_evidencia'] . '_' . $row['id_chave_tipo_de_identificador'];
            $stmt->close();
            $dbConnection->close();
            return $concatenatedString;
        } else {
            $stmt->close();
            $dbConnection->close();
            return false;
        }
    } else {
        die("Erro na preparação da consulta: " . $dbConnection->error);
    }
}



function insertFileHash($conn, $filename, $id_evidencia) {
        global $servername;
        global $password;
        global $dbname;
        global $username;
    $dir = '../../imagens/';
    $file = $dir . $filename;
    $hash = '';

    if(!file_exists($file)) {
        return ['success' => false, 'message' => "Arquivo não existe!"];
    }
    $hash = hash_file('sha256', $file);
    $stmt = $conn->prepare("SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = ?");
    $stmt->bind_param('s', $type);
    $type = 'HASH_FILE';
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 0) {
        $stmt->close();
        return ['success' => false, 'message' => "Tipo HASH_FILE não foi encontrado!"];
    }

    $row = $result->fetch_assoc();
    $id_tipo = $row['id_chave_tipo_de_identificador'];
    $stmt->close();

    // $stmtInsert = $conn->prepare("INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) VALUES (?, ?, ?, ?)");
    $stmtInsert = $conn->prepare("INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE nome_evidencia_tipo_de_identificador = VALUES(nome_evidencia_tipo_de_identificador), valor = VALUES(valor)");

	$nome_concatenado = getConcatenatedString($servername, $username, $password, $dbname, $id_evidencia, "HASH_FILE");
	//echo $nome_concatenado;
    $stmtInsert->bind_param('siis', $nome_concatenado , $id_tipo, $id_evidencia, $hash);

    if (!$stmtInsert->execute()) {
        $stmtInsert->close();
        return ['success' => false, 'message' => "Erro ao inserir o dado: " . $conn->error];
    }

    $stmtInsert->close();
    return ['success' => true, 'message' => "Hash foi inserido com sucesso!"];
} // function insertFileHash

$target_dir = "/var/www/html/dev_vitor/papedins/imagens/";
$basename_sem_blank = str_replace(" ","_",basename($_FILES["fileToUpload"]["name"]));
$target_file = $target_dir . $basename_sem_blank;
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

if (file_exists($target_file)) {
    echo "Desculpe, o arquivo já existe.";
    $uploadOk = 0;
}

if($imageFileType != "pdf" && $imageFileType != "png" && $imageFileType != "jpg" && $imageFileType != "jpeg" ) {
    echo "Desculpe, apenas arquivos PDF, PNG, JPG e JPEG são permitidos.";
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    echo "Desculpe, seu arquivo não foi enviado.";
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo $basename_sem_blank;

        include "identifica.php.cripto";
        $servername = "localhost";
        $password = $pass;
        $dbname = $nome_base_dados;

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Conexão falhou: " . $conn->connect_error);
        }

        $conn->begin_transaction();

        $hashResult = insertFileHash($conn, $basename_sem_blank, $_POST["last_inserted_id"]);

        if (!$hashResult['success']) {
            $conn->rollback();
            echo $hashResult['message'];
            $conn->close();
            exit();
        }

        $sql = "INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) 
        VALUES (?, (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = 'FILE'), ?, ?)
        ON DUPLICATE KEY UPDATE nome_evidencia_tipo_de_identificador = VALUES(nome_evidencia_tipo_de_identificador), valor = VALUES(valor);";

        if ($stmt = $conn->prepare($sql)) {
            $evidenciaId = $_POST["last_inserted_id"];
            $name = getConcatenatedString($servername, $username, $password, $dbname, $evidenciaId, "FILE");
            $stmt->bind_param("sis", $name, $evidenciaId, $target_file);
            $stmt->execute();
            $stmt->close();
        } else {
            echo $conn->error;
            $conn->rollback();
            $conn->close();
            exit();
        }

        $conn->commit();
        $conn->close();
    } else {
        echo "Desculpe, houve um erro ao enviar seu arquivo.";
    }
}

?>

