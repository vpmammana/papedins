<?php


function consultaEvidencia($id_evidencia) {
global $nome_imagem_padrao;

    // Inclui o arquivo com as credenciais do banco de dados
    include "identifica.php.cripto";

    // Cria a conexão com o banco de dados
    $conexao = new mysqli("localhost", $username, $pass, $nome_base_dados);

    // Verifica se a conexão foi bem-sucedida
    if ($conexao->connect_error) {
        die("Falha na conexão: " . $conexao->connect_error);
    }

    // Prepara a consulta SQL para evitar injeção de SQL
    $stmt = $conexao->prepare("SELECT valor FROM evidencias_tipos_de_identificadores 
                               WHERE id_evidencia = ? AND id_tipo_de_identificador = 
                               (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores 
                                WHERE nome_tipo_de_identificador = 'FILE')");

    // Vincula o parâmetro à consulta preparada
    $stmt->bind_param("i", $id_evidencia);

    // Executa a consulta
    $stmt->execute();

    // Obtém o resultado da consulta
    $resultado = $stmt->get_result();

    // Verifica se algum resultado foi encontrado
    if ($resultado->num_rows > 0) {
        // Obtém o valor
        $row = $resultado->fetch_assoc();
        $valor = $row["valor"];
    } else {
        $valor = $nome_imagem_padrao;
    }

    // Fecha o statement e a conexão
    $stmt->close();
    $conexao->close();
    $valor = str_replace("/var/www/html/dev_vitor/papedins/", "../../", $valor);
    // Retorna o valor
    return $valor;
}


$nome_imagem_padrao = "../../imagens/pdf3_lente2.png";

if (isset($_GET['id_evidencia'])) {
        $lastInsertedId = $_GET['id_evidencia'];
	$nome_imagem_padrao = consultaEvidencia($lastInsertedId);
} 





			echo 
				'
			<span id="uploadedFileName"></span>
			<form id="upload_form" action="" class="clearfix" method="POST" enctype="multipart/form-data">
		        <!-- Selecione o arquivo para upload (PDF, PNG, JPG, JPEG), last_inserted_id é: '.$lastInsertedId.' -->
		    	<input type="hidden" name="last_inserted_id" id="last_inserted_id" value="'.$lastInsertedId.'">
				<input type="file" name="fileToUpload" id="fileToUpload">
				<div id="lente_container" class="clearfix" >
				<div class="imagem-texto">Arquivo da evidência</div>
					<img id="lente_busca" src="'.$nome_imagem_padrao.'" onclick="document.getElementById(`fileToUpload`).click();">
				<div class="imagem-texto">Clique acima<br>para inserir<br>ou alterar</div>
		        <input id="botao_upload" type="submit" value="Upload" name="submit">
				</div>
		    </form>
			<script>
				document.getElementById("escolhe_autor").style.display="flex";
				document.getElementById("last_inserted_id_evidencia_para_autor").value="'.$lastInsertedId.'";
				document.getElementById("input_autores").setAttribute("data-id-evidencia","'.$lastInsertedId.'");
			</script>
				';



?>
