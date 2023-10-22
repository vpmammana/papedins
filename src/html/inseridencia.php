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
		


	</style>
			
	<script>
	document.addEventListener('DOMContentLoaded', 
	function() {
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
    echo "<form action='processa_inseridencia.php' method='post'>";
    
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
		<input id='input_tipo_de_evidencia' type='text' class='search-input' autocomplete='off' name='".$nomeCampo."' placeholder='Digite para buscar...' data-tabela='$nomeTabela' data-campo='$nomeCampo' data-tabela-externa='tipos_de_evidencias' data-campo-nome-externo='nome_tipo_de_evidencias' data-id-externo='id_token' data-companion-id='id_token_tipo_de_evidencia'>
  <input id='id_token_tipo_de_evidencia' type='hidden' name='id_token_tipo_de_evidencia' value=''>
				<div class='results' tabindex='-1'></div>
	</div>
";
} 
if ($nomeCampo === "id_token_tipo_de_veiculo") 
{
echo "
	<div id='drop_tipo_de_veiculo' class='dropdown-wrapper campo' data-sql='SELECT nome_tipo_de_veiculo, id_token FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo LIKE ?;'>
		<label for='$nomeCampo'>tipo veículo:</label>
		<input id='input_tipo_de_veiculo' type='text' class='search-input' autocomplete='off' name='".$nomeCampo."' placeholder='Digite para buscar...' data-tabela='$nomeTabela' data-campo='$nomeCampo' data-tabela-externa='tipos_de_veiculos' data-campo-nome-externo='nome_tipo_de_veiculo' data-id-externo='id_token' data-companion-id='id_token_tipo_de_veiculo'>
  <input id='id_token_tipo_de_veiculo' type='hidden' name='id_token_tipo_de_veiculo' value=''>
				<div class='results' tabindex='-1'></div>
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
</div>
<script src='script_inseridencia.js'></script>
</body>
</html>
";

$conn->close();
?>

