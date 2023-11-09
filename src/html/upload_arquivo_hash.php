<?php

file_put_contents('json_hash.txt', "Debug de json\n");

function muda_nome_arq($caminho_completo) {

    // Obtém o nome do arquivo a partir do caminho completo
    $nome_arquivo = pathinfo($caminho_completo, PATHINFO_FILENAME);

    // Obtém a extensão do arquivo
    $extensao = pathinfo($caminho_completo, PATHINFO_EXTENSION);

    // Obtém a data atual no formato "ano-mes-dia"
    $data_atual_invertida = date("Ymd");

    // Obtém a hora atual no formato "hora-minuto-segundo"
    $hora_atual_direta = date("His");

    // Gera o novo nome do arquivo com o nome original, data invertida, hora direta e extensão
    $novo_nome = $nome_arquivo . '_' . $data_atual_invertida . '_' . $hora_atual_direta . '.' . $extensao; 

    // Obtém o diretório do caminho completo
    $diretorio = dirname($caminho_completo);

    // Constrói o caminho completo para o novo arquivo
    $novo_caminho_completo = $diretorio . '/' . $novo_nome;

    return $novo_caminho_completo;

} // fim muda_nome_arq

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
        return ['success' => false, 'message' => "Erro ao inserir o hash: " . $conn->error];
        $stmtInsert->close();
    }

    $stmtInsert->close();
    return ['success' => true, 'message' => "Hash foi inserido com sucesso!"];
} // function insertFileHash

$target_dir = "/var/www/html/dev_vitor/papedins/imagens/";
$basename_sem_blank = str_replace(" ","_",basename($_FILES["fileToUpload"]["name"]));
$target_file = $target_dir . $basename_sem_blank;
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
$saida['message'] = "";
$mostra_mensagem = false;
if (file_exists($target_file)) {
    //echo "Desculpe, o arquivo já existe.";
    $basename_sem_blank = muda_nome_arq($basename_sem_blank);
    $mostra_mensagem = true;
    $saida=['success' => false, 'mostra_mensagem' => $mostra_mensagem, 'message' =>  $saida['message']."\nO arquivo já existe no repositório e tentamos incluir na base com nome alterado:".$basename_sem_blank.". Se o hash do arquivo já foi incluído, ele não será incluído." , 'arquivo' => $basename_sem_blank];
    $uploadOk = 2;
}

$target_file = $target_dir . $basename_sem_blank;

if($imageFileType != "pdf" && $imageFileType != "png" && $imageFileType != "jpg" && $imageFileType != "jpeg" ) {
    //echo "Desculpe, apenas arquivos PDF, PNG, JPG e JPEG são permitidos.";
    $mostra_mensagem = true;
    $saida=['success' => false, 'mostra_mensagem' => $mostra_mensagem,  'message' =>  $saida['message']."\nDesculpe, apenas arquivos PDF, PNG, JPG e JPEG são permitidos.", 'arquivo' => ""];
    $uploadOk = 0;
}


if ($uploadOk == 0) {
    //echo "Desculpe, seu arquivo não foi enviado.";
    $mostra_mensagem = true;
    $saida=['success' => false, 'mostra_mensagem' => $mostra_mensagem,  'message' => $saida['message']."\nDesculpe, seu arquivo não foi enviado.", 'arquivo' => ""];
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        //echo $basename_sem_blank;
    	$saida=['success' => true, 'mostra_mensagem' => $mostra_mensagem,  'message'=> $saida['message']."\nUpload deu certo!", 'arquivo' => $basename_sem_blank];
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
	    $mostra_mensagem = true;
            $saida=['success' => $saida['success'], 'mostra_mensagem' => $mostra_mensagem,  'message' => $saida['message']."\n".$hashResult['message'], 'arquivo' => $saida['arquivo']];
		header('Content-Type: application/json');
		echo json_encode($saida);
       		file_put_contents('json_hash.txt', "\n\nprint_r:\n\n".print_r($saida, TRUE)."\n\njson_encode:\n\n".json_encode($saida), FILE_APPEND);
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
            //echo $conn->error;
            $conn->rollback();
            $conn->close();
			$mostra_mensagem = true;
			$saida=['success' => false, 'mostra_mensagem' => $mostra_mensagem, 'message' => $saida['message']."Houve um erro na hora de inserir o registro da evidência e do tipo de identificador.", 'arquivo' => "" ];
			header('Content-Type: application/json');
			echo json_encode($saida);
       			file_put_contents('json_hash.txt', "\n\nprint_r:\n\n".print_r($saida, TRUE)."\n\njson_encode:\n\n".json_encode($saida), FILE_APPEND);
	    exit();
        }

        $conn->commit();
        $conn->close();
    } else {
        // echo "Desculpe, houve um erro ao enviar seu arquivo.";
	$mostra_mensagem = true;
        $saida=['success' => false, 'mostra_mensagem' => $mostra_mensagem, 'message' => $saida['message']."\nDesculpe, houve um erro ao enviar seu arquivo.", 'arquivo' => ""];
    }
}

header('Content-Type: application/json');
echo json_encode($saida);
file_put_contents('json_hash.txt', "print_r:\n\n".print_r($saida, TRUE), FILE_APPEND);
?>

