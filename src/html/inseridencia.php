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

		.linha {
		    display: flex;
		    flex-direction: row;
		    align-items: center; /* Isso garante que os itens estejam centralizados verticalmente */
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
		    flex-direction: row; /* Empilha os elementos verticalmente */
            /* justify-content: center;  Centraliza os elementos verticalmente */
            /*align-items: center;      Centraliza os elementos horizontalmente */
			border: 1px solid black;
			border-radius: 10px;
			background-color: gray;
			width: 100%;
			margin: 10px;
		    box-sizing: border-box;
		}

#escolhe_autor {
    display: none;
    flex-direction: column;
    max-width: 30vw;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin: 5px;
    overflow: hidden; /* Garante que não haja rolagem horizontal no contêiner principal */
}

#escolhe_autor > #mostra_autores {
    flex: 1;
    background-color: white;
    border: 1px solid black;
    border-radius: 5px;
    overflow-y: auto; /* Rolagem vertical */
    overflow-x: hidden; /* Garante que o conteúdo mais largo seja cortado e não cause rolagem horizontal */
    white-space: nowrap; /* Evita quebra de linha do conteúdo */
}


		#upload_form {
		    display: flex;
		    flex-direction: row;
		    max-width: 300px;
		    padding: 20px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
			margin:5px;
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

function apagarAutor(id_chave_autor_evidencia, id_evidencia) {
	alert('vai apagar :'+id_chave_autor_evidencia+ ' / '+id_evidencia);
    var url = 'apagarAutor.php?id_chave_autor_evidencia=' + id_chave_autor_evidencia;
    fetch(url)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            if (data.success) {
                alert('Registro deletado com sucesso!');
            } else {
                alert('Erro ao deletar o registro.');
            }
        })
        .catch(function(error) {
            console.error('Houve um erro ao fazer a requisição:', error);
        });

getAutoresByEvidencia(id_evidencia).then(htmlContent => {
    document.getElementById(`mostra_autores`).innerHTML = htmlContent;
});



}


function grava_e_mostra_os_autores(){

let input_autores =  document.getElementById(`input_autores`);
let id_pessoa = input_autores.getAttribute(`data-id-token`); 
let id_evidencia = input_autores.getAttribute(`data-id-evidencia`);

if (id_pessoa.length>0) 
	{inserirAutorEvidencia(id_pessoa, id_evidencia);} 
else 
	{alert(`Escolha um autor usando a seta para baixo!`)}; 
	
getAutoresByEvidencia(id_evidencia).then(htmlContent => {
    document.getElementById(`mostra_autores`).innerHTML = htmlContent;	
});

input_autores.value = '';
input_autores.setAttribute('data-id-token','');
input_autores.setAttribute('data-selecionou','nao');

}

async function getAutoresByEvidencia(id_evidencia_param) {
    const response = await fetch('buscarAutoresPorEvidencia.php?id_evidencia=' + id_evidencia_param);
    const data = await response.json();

    let htmlContent = '';

    data.forEach(autor => {
        htmlContent += '<div title=\"'+autor.nome_pessoa+'\">' +
            '<button data-id-autores-evidencias=\"' + autor.id_chave_autor_evidencia + '\" onclick=\"alert('+id_evidencia_param+'); apagarAutor(' + autor.id_chave_autor_evidencia + ','+ id_evidencia_param+')\">Apaga</button>&nbsp;' +
            autor.nome_pessoa +
            '</div>';
    });

    return htmlContent;
}




function inserirAutorEvidencia(id_pessoa, id_evidencia) {
    const data = {
        id_pessoa: id_pessoa,
        id_evidencia: id_evidencia
    };

    fetch('inserir_autor_evidencia.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log('Registro inserido com sucesso!');
        } else {
            console.error('Erro ao inserir registro:', data.error);
        }
    })
    .catch(error => {
        console.error('Erro na requisição:', error);
    });
} // fim inserirAutorEvidencia


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
	
	        fetch('upload_arquivo_hash.php', {
	            method: 'POST',
	            body: formaData2
	        })
	        .then(response => response.json()
//{
// alert (response.json())
// console.log(response.json())
// 			if (!response.ok) {
// 			        throw new Error('Network response was not ok');
// 			}
// 			if (response.headers.get('Content-Type').includes('application/json')) {
// 			        return response.json();
// 			}
// 			    throw new Error('Response was not JSON');
// 		}
		)
	        .then(data => {
				// alert(data.mostra_mensagem);
				if (data.mostra_mensagem) {alert(data.message)};
	            document.getElementById('lente_busca').src = '../../imagens/'+data.arquivo;
	        })
	        .catch(error => {
	            console.error('Error:', error);
				//alert(error);
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


function executa_script_forca_bruta(receivedHtml) {

		const div = document.createElement('div');
		div.innerHTML = receivedHtml;
		
		// Inserir o conteúdo no DOM (sem o script)
		// document.body.appendChild(div);
		
		// Encontrar e executar scripts manualmente
		const scripts = div.querySelectorAll('script');
		scripts.forEach((script) => {
		    const newScript = document.createElement('script');
		    newScript.innerHTML = script.textContent;
		    document.body.appendChild(newScript);
		    newScript.remove(); // remover o script após execução, se desejado
		});

} // fim function 

function disabilita_inputs(form, disable){

// var form = document.getElementById('meuFormulario');
var inputs = form.getElementsByTagName('input');

for (var i = 0; i < inputs.length; i++) {
    inputs[i].disabled = disable;
}
	

} // fim function

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
		        // document.getElementById('div_form_upload').innerHTML = data;
				document.getElementById('div_form_upload').insertAdjacentHTML('beforeend', data); // Os scripts no receivedHtml SERÃO executados
				executa_script_forca_bruta(data);	
				//setTimeout(function (){carrega_event_upload();},1000);
				carrega_event_upload();
				disabilita_inputs(this, true); // true desabilita a entrada de dados
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

// note que o escolhe_autor estah display: none no começo. Note que tenho que usar os nomes id_token e nome_tipo para o script_inseridencia.js funcionar
	
echo '
<div id="div_form_upload">
	<div id="escolhe_autor" class="clearfix">
			<div class="linha">
                <div id="drop_autores" class="dropdown-wrapper campo" data-sql="SELECT nome_pessoa as nome_tipo, id_chave_pessoa as id_token FROM pessoas WHERE nome_pessoa LIKE ?;">
                    <label>autor:</label>
                    <input id="input_autores" type="text" class="search-input" autocomplete="off" placeholder="Digite para buscar..." data-tabela="autores_evidencias" data-campo1="id_autor" data-campo2="id_evidencia" data-tabela-externa="pessoas" data-campo-nome-externo="nome_pessoa" data-id-externo="id_chave_pessoa" data-companion-id="id_do_autor"  data-companion-results="results_autores">
					<input id="adiciona_autor" type="button" value="adiciona" onclick="grava_e_mostra_os_autores();">
	                <input id="id_do_autor" type="hidden" value="">
    	            <div id="results_autores"  class="results" tabindex="-1"></div>
				</div>
            </div>
            <input type="hidden" id="last_inserted_id_evidencia_para_autor" value="">
            <div id="mostra_autores"></div>   
    		</div>
	</div>
</div>
<script src="script_inseridencia.js"></script>
</body>
</html>
';

$conn->close();
?>

