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
    echo "<form action='processar_formulario.php' method='post'>";
    
    while ($row = $result->fetch_assoc()) {
        $nomeCampo = $row["Field"];
        $tipoCampo = $row["Type"];
        $chavePrimaria = $row["Key"] == "PRI"; // Verifica se é chave primária
        
        // Verifica se o tipo do campo é suportado e não é chave primária
        if (!$chavePrimaria) {
            foreach ($tiposMapeados as $tipo => $inputType) {
                if (strpos($tipoCampo, $tipo) === 0) {
                    // Verifica se é uma chave estrangeira
                    if ($nomeCampo === "id_tipo_de_evidencia") {
                        // Se for uma chave estrangeira, crie um dropdown

echo "
<div class='campo'>
	<div id='drop' class='dropdown-wrapper' data-sql='SELECT nome_tipo_de_evidencia, id_token FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia LIKE ?;'>
	<label>Tipo de Evidência</label>
		<input id='input' type='text' class='search-input' placeholder='Digite para buscar...' data-tabela='$nomeTabela' data-campo='$nomeCampo' data-tabela-externa='tipos_de_evidencias' data-campo-nome-externo='nome_tipo_de_evidencias' data-id-externo='id_token'>
				<div class='results' tabindex='-1'></div>
	</div>
</div>
";

                        echo "<div class='campo'><label for='$nomeCampo'>$nomeCampo:</label>";
                        echo "<select id='$nomeCampo' name='$nomeCampo'>";
                        
                        // Consulta para buscar os valores da tabela "tipos_de_identificadores"
                        $sql_fk = "SELECT id_token, nome_tipo_de_evidencia FROM tipos_de_evidencias";
                        $result_fk = $conn->query($sql_fk);
                        
                        if ($result_fk->num_rows > 0) {
                            while ($row_fk = $result_fk->fetch_assoc()) {
                                echo "<option value='" . $row_fk["id_token"] . "'>" . $row_fk["nome_tipo_de_evidencia"] . "</option>";
                            }
                        }
                        
                        echo "</select></div>";
                    } else {
                        // Caso contrário, crie um campo de entrada padrão
                        echo "<div class='campo'><label for='$nomeCampo'>$nomeCampo:</label>";
                        echo "<input type='$inputType' id='$nomeCampo' name='$nomeCampo' data-tabela='$nomeTabela' data-campo='$nomeCampo'></div>";
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

