<?php
// Configurações de conexão com o banco de dados (substitua com suas configurações)

echo "
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<title>Inseridência</title>
	<style>
		html {
			background-color: black;
		}
		option {
			width: 200px;
			color: blue;
			background-color: white;
		}
		#cabecalio {
			height: 10%;
			position: absolute;
			width: 100%;
			top:0px;
			left: 0px;
			border: 1px solid gray;
			background-color: #103050;
			color: white;
			padding: 20px;
		}
		#resto {
			width: 100%;
			position: absolute;
			background-color: gray;
			padding: 20px;
			border: 2px solid white;
			border-radius: 10px;
	    	box-sizing: border-box;	
		}
		.campo {
			border: 1px solid black;
			background-color: orange;
			color: black;
			display: inline-block;
			padding: 10px;
			margin: 10px;
			border-radius: 10px;
		}
		.results {
		    max-height: 30%;
		    overflow-y: auto;
		    position: absolute;
			z-index: 10;
			border: 1px solid black;
			background-color: white;
			font-size: 1.1em;
		}
		input[type='text'] {
			font-size:1.22rem;
			border-radius: 5px;
		}
		
		input[type='text']:focus {
			border: 5px solid red;
		
		}
		.item {
		    padding: 8px;
		    cursor: pointer;
		}
		
		.item:hover {
		    background-color: #f7f7f7;
			color: black;
		}
		
		.selected {
		    background-color: #000000;
			color: #FFFFFF;
		}

		#div_form_upload {
			display: flex;
			padding: 10px;
		    flex-direction: column; /* Empilha os elementos verticalmente */
            /* justify-content: center;  Centraliza os elementos verticalmente */
            /*align-items: center;      Centraliza os elementos horizontalmente */
			border: 1px solid black;
			border-radius: 10px;
			background-color: gray;
			width: 100%;
			margin: 10px;
		    box-sizing: border-box;
		}

		#upload_form {
		    display: flex;
		    flex-direction: column;
		    max-width: 300px;
		    padding: 20px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}

		input[type='file'] {
		    margin-bottom: 10px;
		}
		#lente_container {
			position: relative;
			display: flex;
			flex-direction: column; /* Empilha os elementos verticalmente */
		    justify-content: center; /* Centraliza os elementos verticalmente */
		    align-items: center;     /* Centraliza os elementos horizontalmente */
			margin: 10px;
			padding: 10px;
			width: auto;
		}
		.clearfix::after { /* limpa os float */
		    content: '';
		    display: table;
		    clear: both;
		}

		.imagem-texto {
            color: white;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            z-index: 1;
        }
	
		#lente_busca {
		    display: block;
			cursor: pointer;
			margin: 10px;
			padding: 10px;
			background-color: yellow;
			border:1px solid black;
			border-radius: 10px;
		   	max-width: 100%;
    		max-height: 100%;
		    border: 2px solid transparent; /* Adiciona uma borda transparente para manter o tamanho consistente */
		    transition: transform 0.1s; /* Suaviza a animação de pressionar o botão */
		}

		#lente_busca:hover {
		   border: 3px solid #333; /* Muda a cor da borda ao passar o mouse para dar feedback */
		}

		#lente_busca:active {
		    transform: scale(0.95); /* Pressiona a imagem quando clicada, dando a sensação de um botão sendo pressionado */
		}

		#fileToUpload {
			display: none;
		}
		#botao_upload {
			display: none;
		}
	</style>
			
	<script>
	document.addEventListener('DOMContentLoaded', 
	function() {
	//alert('DOMload');
		  var windowHeight = window.innerHeight || document.documentElement.clientHeight;
		  var upperDivHeight = document.querySelector('#cabecalio').offsetHeight;
		  var dynamicDiv = document.getElementById('resto');
		  dynamicDiv.style.height = (windowHeight - upperDivHeight) + 'px';
		  dynamicDiv.style.top = upperDivHeight + 'px';
		  dynamicDiv.style.left = '0px';
		var urlAtual = window.location.href;
		// Remove todos os parâmetros após o ponto de interrogação
		var urlSemParametros = urlAtual.replace(/\?.*$/, '');
		// Atualiza a URL para a versão sem parâmetros
		window.history.replaceState(null, null, urlSemParametros);




function carrega_event_upload() {
		//alert('vai carregar');
		var uploadForm = document.getElementById('upload_form'); 
	    uploadForm.addEventListener('submit', function(e) {
	        e.preventDefault();
	
	        let formaData2 = new FormData(uploadForm);
	
	        fetch('upload_arquivo_pdf_jpg.php', {
	            method: 'POST',
	            body: formaData2
	        })
	        .then(response => response.text())
	        .then(data => {
				//alert(data);
	            document.getElementById('lente_busca').src = '../../imagens/'+data;
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    });
		document.getElementById('fileToUpload').addEventListener('change', function(event) {

		   var inputFile_2 = event.target;
				event.preventDefault();
		    if (inputFile_2.files.length > 0) {
				document.getElementById('botao_upload').click();
		    } else {
		    }

//alert('temer');
//	   		 let uploadedFile = event.target.files[0];
//	   		 if (uploadedFile) {
//	   		     document.getElementById('uploadedFileName').textContent = uploadedFile.name;
//	    }
		});
} // function carrega_event_upload


		document.getElementById('form_insere_evidencia').addEventListener('submit', function(event) {
		//alert('vai inserir');
		    event.preventDefault(); // Impede o envio tradicional do formulário
		
		    var formData = new FormData(this);
		
		    // Faz a requisição AJAX para o servidor
		    fetch(this.action, {
		        method: 'POST',
		        body: formData
		    })
		    .then(response => response.text())
		    .then(data => {
		        // Exibe a resposta do servidor no elemento com id 'response'
		        document.getElementById('div_form_upload').innerHTML = data;
				//setTimeout(function (){carrega_event_upload();},1000);
				carrega_event_upload();
		    })
		    .catch(error => {
		        console.error('Erro ao enviar o formulário:', error);
		    });
		});
	});
	
	</script>
</head>
<body>

<div id='cabecalio'><h1>Inserção de Evidências</h1></div>
<div id='resto'>
";

include "identifica.php.cripto";

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados; 

// Nome da tabela da qual você deseja gerar o formulário
$nomeTabela = "evidencias";

// Mapeamento dos tipos de coluna MySQL para tipos de entrada HTML
$tiposMapeados = [
    "varchar" => "text",
    "int" => "number",
    "date" => "date"
];

// Conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta para obter informações sobre a estrutura da tabela
$sql = "DESCRIBE $nomeTabela";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<form id='form_insere_evidencia' class='clearfix' action='processa_inseridencia.php' method='post'>";
    
    while ($row = $result->fetch_assoc()) {
        $nomeCampo = $row["Field"];
        $tipoCampo = $row["Type"];
        $chavePrimaria = $row["Key"] == "PRI"; // Verifica se é chave primária
        
        // Verifica se o tipo do campo é suportado e não é chave primária
        if (!$chavePrimaria) {
            foreach ($tiposMapeados as $tipo => $inputType) {
                if (strpos($tipoCampo, $tipo) === 0) {
                    // Verifica se é uma chave estrangeira
                    if (($nomeCampo === "id_token_tipo_de_evidencia") || ($nomeCampo === "id_token_tipo_de_veiculo")) {
                        // Se for uma chave estrangeira, crie um dropdown
if ($nomeCampo === "id_token_tipo_de_evidencia") 
{
echo "
	<div id='drop_tipo_de_evidencia' class='dropdown-wrapper campo' data-sql='SELECT nome_tipo_de_evidencia, id_token FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia LIKE ?;'>
		<label for='$nomeCampo'>tipo evidência:</label>
		<input id='input_tipo_de_evidencia' type='text' class='search-input' autocomplete='off' name='".$nomeCampo."' placeholder='Digite para buscar...' data-tabela='$nomeTabela' data-campo='$nomeCampo' data-tabela-externa='tipos_de_evidencias' data-campo-nome-externo='nome_tipo_de_evidencias' data-id-externo='id_token' data-companion-id='id_token_tipo_de_evidencia'  data-companion-results='results_evidencias'>
  <input id='id_token_tipo_de_evidencia' type='hidden' name='id_token_tipo_de_evidencia' value=''>
				<div id='results_evidencias'  class='results' tabindex='-1'></div>
	</div>
";
} 
if ($nomeCampo === "id_token_tipo_de_veiculo") 
{
echo "
	<div id='drop_tipo_de_veiculo' class='dropdown-wrapper campo' data-sql='SELECT nome_tipo_de_veiculo, id_token FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo LIKE ?;'>
		<label for='$nomeCampo'>tipo veículo:</label>
		<input id='input_tipo_de_veiculo' type='text' class='search-input' autocomplete='off' name='".$nomeCampo."' placeholder='Digite para buscar...' data-tabela='$nomeTabela' data-campo='$nomeCampo' data-tabela-externa='tipos_de_veiculos' data-campo-nome-externo='nome_tipo_de_veiculo' data-id-externo='id_token' data-companion-id='id_token_tipo_de_veiculo' data-companion-results='results_veiculos'>
  <input id='id_token_tipo_de_veiculo' type='hidden' name='id_token_tipo_de_veiculo' value=''>
				<div id='results_veiculos' class='results' tabindex='-1'></div>
	</div>
";
}

                    } else {
                        // Caso contrário, crie um campo de entrada padrão
						if ($nomeCampo=='nome_evidencia') {$nomeCampo_temp='título da evidência:'; $largura_text_nome_evidencia="style='flex-grow: 1;'"; $largura_campo_nome_evidencia="style='width: 90%; display:flex;align-items: center;' ";} else {$nomeCampo_temp=$nomeCampo; $largura_campo_nome_evidencia=""; $largura_text_nome_evidencia ="";}
                        echo "<div class='campo'  $largura_campo_nome_evidencia><label for='$nomeCampo'>$nomeCampo_temp:</label>";
                        echo "<input type='$inputType' id='$nomeCampo' $largura_text_nome_evidencia name='$nomeCampo' data-tabela='$nomeTabela' data-campo='$nomeCampo'></div>";
                    }
                    break;
                }
            }
        }
    }
    echo "<input type='submit' value='Enviar'>";
    echo "</form>";
} else {
    echo "A tabela não foi encontrada.";
}


	
echo "
<div id='div_form_upload'></div>
</div>
<script src='script_inseridencia.js'></script>
</body>
</html>
";

$conn->close();
?>

