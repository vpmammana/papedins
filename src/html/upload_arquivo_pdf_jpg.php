<?php
$target_dir = "/var/www/html/dev_vitor/papedins/imagens/";

$basename_sem_blank = str_replace(" ","_",basename($_FILES["fileToUpload"]["name"]));
$target_file = $target_dir . $basename_sem_blank;
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Verifica se o arquivo já existe
if (file_exists($target_file)) {
    echo "Desculpe, o arquivo já existe.";
    $uploadOk = 0;
}

// Verifica o tipo de arquivo
if($imageFileType != "pdf" && $imageFileType != "png" && $imageFileType != "jpg" && $imageFileType != "jpeg" ) {
    echo "Desculpe, apenas arquivos PDF, PNG, JPG e JPEG são permitidos.";
    $uploadOk = 0;
}

// Se $uploadOk estiver setado como 0 por um erro anterior
if ($uploadOk == 0) {
    echo "Desculpe, seu arquivo não foi enviado.";
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo $basename_sem_blank;
        //print_r($_POST); 
        // Conectar ao banco de dados e registrar o arquivo

		include "identifica.php.cripto";
		$servername = "localhost";
        $password = $pass; 
        $dbname = $nome_base_dados;
        
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Conexão falhou: " . $conn->connect_error);
        }

//        $sql = "INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) VALUES (?, (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = 'FILE'), ?, ?)";

$sql = "INSERT INTO evidencias_tipos_de_identificadores 
(nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) 
VALUES (?, (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = 'FILE'), ?, ?)
ON DUPLICATE KEY UPDATE
nome_evidencia_tipo_de_identificador = VALUES(nome_evidencia_tipo_de_identificador),
valor = VALUES(valor);";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("sis", $name, $evidenciaId, $target_file);
            $name = $basename_sem_blank; 
            $evidenciaId = $_POST["last_inserted_id"]; // Aqui você deve informar o ID da evidência apropriado
            $stmt->execute();
            $stmt->close();
        } else {
            echo "Erro: " . $sql . "<br>" . $conn->error;
        }
        $conn->close();
    } else {
        echo "Desculpe, houve um erro ao enviar seu arquivo.";
    }
}
?>

