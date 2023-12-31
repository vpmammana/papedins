<?php

include "cria_script_update_grupo.php";

cria_script_update_grupo();


if(isset($_GET["tipo_token"])){
  $param_tipo_token= $_GET["tipo_token"];
} else $param_tipo_token = "";

if (strlen($param_tipo_token)>0){$where = " WHERE tipo_token = '".$param_tipo_token."' ";}
else {$where="";}

function deletarBackupsAntigos($diretorio) { // funcao gerada pelo Chat GPT

    // Buscar todos os arquivos do diretório
    $arquivos = glob($diretorio . "*.sql");

    // Filtrar arquivos que correspondem ao padrão de nome com timestamp
    $backups = array_filter($arquivos, function($arquivo) {
        return preg_match('/script_tipos_veidencias_\d{8}-\d{6}\.sql$/', $arquivo);
    });

    // Ordenar os backups pela data de modificação em ordem decrescente
    usort($backups, function($a, $b) {
        return filemtime($b) - filemtime($a);
    });

    // Se há mais de 10 backups, excluir os antigos
    if (count($backups) > 10) {
        for ($i = 10; $i < count($backups); $i++) {
            unlink($backups[$i]);
        }
    }
} // deletarBackupsAntigos


$diretorio = "";

deletarBackupsAntigos($diretorio);

$timestampAtual = time();
$stampArquivo = date('Ymd-His', $timestampAtual);

$nome_script = "script_tipos_veidencias_".$stampArquivo.".sql";

file_put_contents($nome_script, "# script que preenche as tabelas tipos_de_evidencias e tipos_de_veiculos. Esse script é gerado a cada acesso à página arvore_de_tokens.php\n\nstart transaction;\n\ndelete from tipos_de_evidencias;\n\ndelete from tipos_de_veiculos;\n\n\n");

include "identifica.php.cripto";

$host = 'localhost';
$user = $username;
$db = $nome_base_dados;

// Estabelecer a conexão
$conn = new mysqli($host, $user, $pass, $db);

// Verificar a conexão
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Executar uma consulta SQL

echo "
<!DOCTYPE html>
<html>




<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Gervidência</title>

    <title>Exemplo de Tabela</title>
    <style>
        /* Algumas estilizações básicas para a tabela */
		html {
			background-color: black;
		}
		body {
			background-color: #1B1B1B;
			color: #A0A0A0;
		}
        .tabela_externa {
            width: 100%;
            border-collapse: collapse;
        }
	
        .externa {
            border: 1px solid gray;
            padding: 8px;
            text-align: center;
        }

		.interna {
            border: none;
			text-align: left;
			z-index: 0;
        }

		.mensagem {
			background-color: red;
			color: black;
			border: 1px solid black;
			border-radius: 10px;
			padding: 10px;
			display: inline-block;
			margin: 10px;
		}
		.mensagem_radio {
			background-color: red;
			color: black;
			border: 1px solid black;
			border-radius: 10px;
			margin-left: 10px;
		}
		.checaixa {
  			transform: scale(2); /* Ajuste o valor conforme necessário para aumentar ou diminuir o tamanho */
			margin-left: 30px;
			z-index: 0;
		}
		.cabeca {
			border: 2px solid white !important;
			background-color: gray;
			color: white;
		}
		#cabecalio-container {
			width: 100%;
			top: 0px;
			left: 0px;
			position: absolute;
			background-color: #1B5543;
			padding: 10px;

		}


		#table-container {
			overflow-y: auto;
			width: 100%;
			position: absolute;
		}
		.radio_sintatico {
			margin-left: 20px;
			margin-right: 10px;
			margin-top: 10px;
			margin-bottom: 10px;
			transform: scale(2);
		}

    </style>
	<script>

		function apagarIdGrupoDeToken(id_token) {
		    const url = `apagar_grupo_token.php`;
		
		    fetch(url, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: 'id_token='+id_token
		    })
		    .then(response => response.json())
		    .then(data => {
				if (data.success) {document.getElementById('grupo_'+id_token).innerHTML='';} else {document.getElementById('grupo_'+id_token).innerHTML='problemas para apagar';}
				
		        // Aqui você pode adicionar qualquer lógica que queira executar em caso de sucesso ou erro
		        // Por exemplo, você pode mostrar alguma notificação ao usuário ou atualizar algum elemento da página
		    })
		    .catch(error => {
				alert(error);
		        // Manipule qualquer erro da chamada AJAX aqui
		    });
		}

		function fetchRadioGruposDeTokens(id_token, tipo) {
		    const url = `radio_grupos_de_tokens.php?id_token=`+id_token+`&tipo=`+tipo;
		
		    fetch(url)
		    .then(response => response.text()) // Obtém a resposta como texto
		    .then(data => {
		        // Atualiza o conteúdo do div com os dados recebidos
		        document.getElementById('resultContent').innerHTML = data;
		
		        // Exibe o div centrado
		        document.getElementById('resultModal').style.display = 'block';
		    })
		    .catch(error => {
		        console.error('Erro ao buscar os dados:', error);
		    });
		} // function fetchRadioGruposDeTokens
		

		function submitForm(id_token) {
	        var checkbox = document.getElementById('evidencia_'+id_token);
			console.log(checkbox);
			console.log(checkbox.getAttribute('data-nome-tipo-evidencia'));
			document.getElementById('nome_tipo_evidencia_'+id_token).value = checkbox.getAttribute('data-nome-tipo-evidencia');
			console.log('-> '+document.getElementById('nome_tipo_evidencia_'+id_token).value);
			document.getElementById('id_token_'+id_token).value = checkbox.getAttribute('data-id-token');
			document.getElementById('checked_status_'+id_token).value = checkbox.checked ? '1' : '0'; // Adicionado
	        var form = document.getElementById('myForm_'+id_token);
	        var xhr = new XMLHttpRequest();
	        xhr.open(form.method, form.action, true);
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
console.log(new URLSearchParams(new FormData(form)).toString());
	        xhr.send(new URLSearchParams(new FormData(form)).toString());
	
	        xhr.onloadend = function() {
	            if(xhr.status == 200) {
	                console.log(xhr.responseText);
	            }
	        };
	    }
	    function submitForm_veiculo(id_token) {
	        var checkbox = document.getElementById('veiculo_'+id_token);
			console.log(checkbox);
			console.log(checkbox.getAttribute('data-nome-tipo-veiculo'));
			document.getElementById('nome_tipo_veiculo_'+id_token).value = checkbox.getAttribute('data-nome-tipo-veiculo');
			console.log('-> '+document.getElementById('nome_tipo_veiculo_'+id_token).value);
			document.getElementById('id_token_veiculo_'+id_token).value = checkbox.getAttribute('data-id-token');
			document.getElementById('checked_status_veiculo_'+id_token).value = checkbox.checked ? '1' : '0'; // Adicionado
	        var form = document.getElementById('myForm_veiculo_'+id_token);
	        var xhr = new XMLHttpRequest();
	        xhr.open(form.method, form.action, true);
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
console.log(new URLSearchParams(new FormData(form)).toString());
	        xhr.send(new URLSearchParams(new FormData(form)).toString());
	
	        xhr.onloadend = function() {
	            if(xhr.status == 200) {
	                console.log(xhr.responseText);
	            }
	        };
	    }
function carrega_button(tipo_token) {
// Crie uma instância de XMLHttpRequest
var xhr = new XMLHttpRequest();

// Defina o método HTTP e a URL do seu script PHP
xhr.open('GET', 'retorna_radio.php?tipo_token='+tipo_token, true);

// Defina a função de callback para tratar a resposta
xhr.onload = function() {
  if (xhr.status === 200) {
    // A resposta do servidor estará em xhr.responseText
    var resultado = xhr.responseText;
    
    // Coloque o resultado dentro do seu div
    var divResultado = document.getElementById('div_radio_button');
    divResultado.innerHTML = resultado;
  } else {
    alert('Erro na chamada AJAX.');
  }
};

// Envie a solicitação
xhr.send();
}

function recarrega(tipo_token) {
//alert(tipo_token);
var urlAtual = window.location.href;
var novaURL = urlAtual.replace(/\?.*$/, '') + '?tipo_token='+tipo_token;

// Recarrega a página com a nova URL
window.location.href = novaURL;
} 

document.addEventListener('DOMContentLoaded', function() {
document.body.style.display='none';
  carrega_button('".$param_tipo_token."');
  setTimeout( function () {
  document.body.style.display='block';
  var windowHeight = window.innerHeight || document.documentElement.clientHeight;
  var upperDivHeight = document.querySelector('#cabecalio-container').offsetHeight;
  var dynamicDiv = document.getElementById('table-container');
  dynamicDiv.style.height = (windowHeight - upperDivHeight) + 'px';
  dynamicDiv.style.top = upperDivHeight + 'px';
  dynamicDiv.style.left = '0px';
var urlAtual = window.location.href;

// Remove todos os parâmetros após o ponto de interrogação
var urlSemParametros = urlAtual.replace(/\?.*$/, '');

// Atualiza a URL para a versão sem parâmetros
window.history.replaceState(null, null, urlSemParametros);
  }, 1000);
		// Fechar o div quando clicar fora do conteúdo
//		document.getElementById('resultModal').addEventListener('click', function(e) {
//		    if (e.target === this) {
//		        this.style.display = 'none';
//		    }
//		});


});
	</script>
</head>
<body>
";

$sql = "

WITH RECURSIVE category_path AS (
    -- Caso base: categorias sem parent (raízes)
    SELECT id_chave_token, nome_token, (select nome_tipo_token from tipos_tokens where id_chave_tipo_token = id_tipo_token) AS tipo_token, id_grupo_de_token, id_raiz, CAST(nome_token AS CHAR(255)) AS path, (select case when exists (select 1 from tipos_de_evidencias where id_token = id_chave_token) THEN 'checked' ELSE '' END) as marca,(select case when exists (select 1 from tipos_de_veiculos where id_token = id_chave_token) THEN 'checked' ELSE '' END) as marca_veiculo
    FROM tokens
    WHERE id_raiz IS NULL
    
    UNION ALL
    
    -- Recursão: junta-se com a tabela original para encontrar filhos e construir o path
    SELECT c.id_chave_token, c.nome_token,(select nome_tipo_token from tipos_tokens where id_chave_tipo_token = c.id_tipo_token) as tipo_token, c.id_grupo_de_token, c.id_raiz, CONCAT(cp.path, ' > ', c.nome_token), (select case when exists (select 1 from tipos_de_evidencias where id_token = c.id_chave_token) THEN 'checked' ELSE '' END) as marca, (select case when exists (select 1 from tipos_de_veiculos where id_token = c.id_chave_token) THEN 'checked' ELSE '' END) as marca_veiculo

    FROM tokens c
    JOIN category_path cp ON c.id_raiz = cp.id_chave_token
)

SELECT id_chave_token, nome_token, tipo_token, path, id_grupo_de_token, id_raiz, marca, marca_veiculo, (select acentuada from grupos_de_tokens where id_chave_grupo_de_token = id_grupo_de_token) as nome_grupo FROM category_path ".$where."  ORDER BY path;

";
$result2 = $conn->query($sql);

echo "
<div id='cabecalio-container'>
<!-- Hidden frame para evitar a abertura de janelas novas quando termina de fazer o action de um submit num form -->
<iframe name='hiddenFrame' style='display:none;'></iframe>
<!-- Div para exibir os radio buttons de grupos de tokens -->
<div id='resultModal' style='display: none; position: fixed; top: 0; right: 0; bottom: 0; left: 0; background: rgba(0,0,0,0.5); z-index: 9999;'>
    <div style='background: white; max-width: 500px; margin: 100px auto; padding: 20px;'>
        <div id='resultContent'></div>
    </div>
</div>
<h1>Gervidência</h1>
<h3><b>Gerenciamento de Veículos de Divulgação e de Evidências</b> - Nesta janela você deve identificar quais tokens têm papel de representar uma evidência (artigo, paper, contrato, ofício, etc.) e quais têm o papel de representar um veículo de divulgação (revista, jornal, Journal, magazine, TV, YouTube, etc.) </h3>
<div class='mensagem'>Número de tokens: ".$result2->num_rows."</div>
<div id='div_radio_button' class='mensagem_radio'></div>

</div>
";
echo "
<div id='table-container'>
<table class='externa tabela_externa'>
<thead style='position: sticky; top: 0'>
<tr style='position: sticky;'>
<th class='cabeca' style=' z-index: 1000;'>identificador <br>do token</th>
<th class='cabeca' style=' z-index: 1000;'>identificador <br>do token pai</th>
<th class='cabeca' style=' z-index: 1000;'>token</th>
<th class='cabeca' style=' z-index: 1000;'>função <br>gramatical</th>
<th class='cabeca' style=' z-index: 1000;'>hierarquia</th>
<th class='cabeca' style=' z-index: 1000;'>grupo</th>
<th class='cabeca' style=' z-index: 1000;'>artigo, contrato, <br>paper, ofício, etc.?:</th>
<th class='cabeca' style=' z-index: 1000;'>revista, contrato, <br>ofício, Journal, etc.?:</th>
</tr>
</thead>
<tbody>
";

if ($result2->num_rows > 0) {
    while($row = $result2->fetch_assoc()) {
		$id_chave_token = $row["id_chave_token"];
		$id_raiz = $row["id_raiz"];
		$nome_token = $row["nome_token"];
		$hierarchy = $row["path"];
		$tipo_token = $row["tipo_token"];
		$marca = $row["marca"];
		$marca_veiculo = $row["marca_veiculo"];
		$nome_grupo = $row["nome_grupo"];

		if ($marca=="checked") {file_put_contents($nome_script, "INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('".$nome_token."',(SELECT id_chave_token FROM tokens WHERE nome_token = '".$nome_token."'));\n", FILE_APPEND);};
		if ($marca_veiculo=="checked") {file_put_contents($nome_script, "INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('".$nome_token."', (SELECT id_chave_token FROM tokens WHERE nome_token ='".$nome_token."'));\n", FILE_APPEND);};

		echo "
		<tr>
		<td style='text-align: left; font-size: 0.8em' class='externa'>".$id_chave_token."</td><td style='text-align: left; font-size: 1em' class='externa'>".$id_raiz."</td><td style='text-align: left; font-size: 1em' class='externa'>".$tipo_token."</td><td style='color: #DDDDDD; font-size: 1.5em' class='externa'><b>".$nome_token."</b></td><td style='font-size: 1.3rem; text-align: left' class='externa'>".$hierarchy."</td>
		<td id='grupo_".$id_chave_token."' style='text-align: left; font-size: 1em' class='externa'>
			".$nome_grupo."
		</td>

		<td style='text-align: left; font-size: 1.3em' class='externa'>".
		'<form id="myForm_'.$id_chave_token.'" action="processa.php" method="post">
		<table class="interna">
		<tr class="interna">
		<td class="interna">
		    <label for="evidencia_'.$id_chave_token.'">É evidência? </label>
		</td>
		<td>
			<input type="checkbox"
			   class="checaixa"
	           id="evidencia_'.$id_chave_token.'"
    	       name="evidencia"
        	   value="checked"
       		   data-nome-tipo-evidencia="'.$nome_token.'"
           	   data-id-token="'.$id_chave_token.'"
			   '.$marca.'
               onchange="submitForm('.$id_chave_token.');">
  			   <input type="hidden" name="nome_tipo_evidencia" id="nome_tipo_evidencia_'.$id_chave_token.'" value="">
			   <input type="hidden" name="id_token" id="id_token_'.$id_chave_token.'" value="">
	  		   <input type="hidden" name="checked_status" id="checked_status_'.$id_chave_token.'" value="">
		</td>
		</tr>
		</table>
		</form>
		</td>
		<td style="text-align: left; font-size: 1.3em" class="externa">
		<form id="myForm_veiculo_'.$id_chave_token.'" action="processa_veiculo.php" method="post">
		<table class="interna">
		<tr>
		<td>		    
			<label for="veiculo_'.$id_chave_token.'">É veículo?</label>
		</td>
		<td>
		    <input type="checkbox"
	           id="veiculo_'.$id_chave_token.'"
			   class="checaixa"
    	       name="veiculo"
        	   value="checked"
       		   data-nome-tipo-veiculo="'.$nome_token.'"
           	   data-id-token="'.$id_chave_token.'"
			   '.$marca_veiculo.'
               onchange="submitForm_veiculo('.$id_chave_token.');">
  			   <input type="hidden" name="nome_tipo_veiculo" id="nome_tipo_veiculo_'.$id_chave_token.'" value="">
			   <input type="hidden" name="id_token_veiculo" id="id_token_veiculo_'.$id_chave_token.'" value="">
	  		   <input type="hidden" name="checked_status_veiculo" id="checked_status_veiculo_'.$id_chave_token.'" value="">
		</td>
		</tr>
			   <script>
					document.getElementById("evidencia_'.$id_chave_token.'").addEventListener("change", function() {
					if (this.checked) {
						    fetchRadioGruposDeTokens("'.$id_chave_token.'","evidencia");
							if (document.getElementById("veiculo_'.$id_chave_token.'").checked == true) {
								document.getElementById("veiculo_'.$id_chave_token.'").click();
							}
				        document.getElementById("veiculo_'.$id_chave_token.'").checked = false;
					} else {apagarIdGrupoDeToken("'.$id_chave_token.'");}
					});
				
					document.getElementById("veiculo_'.$id_chave_token.'").addEventListener("change", function() {
					    	if (this.checked) {
							fetchRadioGruposDeTokens("'.$id_chave_token.'","veiculo");
							if (document.getElementById("evidencia_'.$id_chave_token.'").checked == true) {
								document.getElementById("evidencia_'.$id_chave_token.'").click();
							}
					       	document.getElementById("evidencia_'.$id_chave_token.'").checked = false;
					    } else {apagarIdGrupoDeToken("'.$id_chave_token.'");}
					});
			   </script>
		</table>	
		</form>
		</td>
	</tr>';
    }

echo "
</tbody>
</table>
</div>
";

} else {

    echo "0 result2s";
}



echo "
</body>
</html>
";
file_put_contents($nome_script,"commit;", FILE_APPEND);
$conn->close();
?>
