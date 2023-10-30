<?php
			echo 
				'
			<span id="uploadedFileName"></span>
			<form id="upload_form" action="" class="clearfix" method="POST" enctype="multipart/form-data">
		        <!-- Selecione o arquivo para upload (PDF, PNG, JPG, JPEG), last_inserted_id é: '.$lastInsertedId.' -->
		    	<input type="hidden" name="last_inserted_id" id="last_inserted_id" value="'.$lastInsertedId.'">
				<input type="file" name="fileToUpload" id="fileToUpload">
				<div id="lente_container" class="clearfix" >
				<div class="imagem-texto">Arquivo da evidência</div>
					<img id="lente_busca" src="../../imagens/pdf3_lente2.png" onclick="document.getElementById(`fileToUpload`).click();">
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
