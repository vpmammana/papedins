<?php
// Incluir arquivo de configurações de banco de dados
	file_put_contents("log.txt", "Hora de Começar: \n\n\n");


$nivel_exposicao = $_GET['nivel_exposicao'] ?? 60; // se não for passado o nivel_exposicao, assume 60 pontos



function query_dinamico($query) {
    global $conn;

    // Executa a consulta
    $resultado = mysqli_query($conn, $query);

    if (!$resultado) {
        // Manipula o erro aqui (por exemplo, você pode logar o erro ou exibir uma mensagem)
        echo "Erro na execução da consulta: " . mysqli_error($conn);
        return null;
    }

    // Obtém a linha de resultado
    $linha = mysqli_fetch_assoc($resultado);

    if ($linha) {
        // Retorna o valor do campo 'valor_campo_externo'
        return $linha['valor_campo_externo'];
    } else {
        // Retorna null se não houver linhas ou se o campo não existir
        return null;
    }
}


include "identifica.php.cripto";

echo '<!DOCTYPE html>';
echo '<html lang="pt-br">';
echo '<head>';
echo '    <meta charset="UTF-8">';
echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">';
echo '    <title>Seu Título Aqui</title>';
echo '</head>';
echo '<body>';

echo '
<div id="cabecalio-container">
<input id="botao_de_percorrer" value="grava status" type="button" onclick="percorrerElementosDoDOM()">
<label id="label_titulo" class="titulo_da_pagina" style="background-color: transparent">Tabela de Evidências</label><input id="cria_evidencia" type="button" onclick="window.open(`https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/inseridencia.php`,`_blank`);" value="Criar Evidência" >
</div>



<div id="table-container">
';

// Criar conexão com o banco de dados
$conn = new mysqli('localhost', $username, $pass, $nome_base_dados);

// Checar conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta SQL
$sql = "SELECT 
		@id_evidencia := e.id_chave_evidencia AS id_evidencia,
	       	CONCAT('<td class=\'fr_evidencia td_principal\'><div class=\'flex_container_evidencias\'><div class=\'div_evidencia\'>(', 
			e.id_chave_evidencia, 
			') ', 
			e.nome_evidencia,
			'</div>',
			IFNULL(CONCAT('<div class=\'celula_dados_container\'>', '<div class=\'dados_atomicos\'>',e.data, '</div>'), '<div class=\'dados_atomicos\'>Sem data</div>'),
			IFNULL(CONCAT('<div class=\'dados_atomicos\'>',(select acentuada  from evidencias, tokens, grupos_de_tokens where id_token_tipo_de_evidencia = id_chave_token and id_grupo_de_token = id_chave_grupo_de_token and id_chave_evidencia = @id_evidencia),'</div>') , '<div class=\'dados_atomicos\'>Sem grupo</div>'),
			IFNULL(CONCAT
			(
				'<div class=\'fr_img\'><img class=\'icone\' src=\'',
				REPLACE
				(
						(
							SELECT 
								valor 
							FROM 
								evidencias_tipos_de_identificadores 
							WHERE 
								id_evidencia = @id_evidencia AND 
								id_tipo_de_identificador = 
									(
										SELECT 
											id_chave_tipo_de_identificador 
										FROM 
											tipos_de_identificadores 
										WHERE 
											nome_tipo_de_identificador = 'FILE'
									)
						)
					,'/var/www/html/dev_vitor/papedins',
					'../..'
				)	
				, '\'></div>'
			), '<div class=\'falta\'>Sem imagem</div>')
		, '</div></td>') as evidencia,
               	CONCAT('<td class=\'fr_data td_principal\'><div class=\'celula_dados_container\'>', '<div class=\'dados_atomicos\'>',e.data, '</div><div class=\'dados_atomicos\'>',(select nome_grupo_de_token  from evidencias, tokens, grupos_de_tokens where id_token_tipo_de_evidencia = id_chave_token and id_grupo_de_token = id_chave_grupo_de_token and id_chave_evidencia = @id_evidencia),'</div></div></td>') as data,
               	CONCAT('<td class=\'fr_grupo td_principal\'><div class=\'fr_container_flex\'>', GROUP_CONCAT(DISTINCT CONCAT('<div class=\'fr_autor\'>', p.nome_pessoa, '</div>') SEPARATOR ''), '</div></td>') AS autores,
               	CONCAT(
			'<td class=\'fr_grupo td_principal\'><div class=\'fr_container_flex\'>', 
			GROUP_CONCAT(DISTINCT IF(tdi.nivel_exposicao > $nivel_exposicao ,CONCAT('<div class=\'fr_identificador\'>', 
			tdi.nome_tipo_de_identificador, ': <span class=\'valor_evidencia\'>', 
			CASE WHEN 
				(SELECT tabela_externa FROM tipos_de_identificadores WHERE id_chave_tipo_de_identificador = tdi.id_chave_tipo_de_identificador)  is null 
			THEN  
				REPLACE(etdi.valor,'/var/www/html/dev_vitor/papedins/imagens/','') 
			ELSE 
				CONCAT(
					'[[SELECT ', 
					(SELECT nome_campo_do_nome_externo FROM tipos_de_identificadores WHERE id_chave_tipo_de_identificador = tdi.id_chave_tipo_de_identificador) ,
					' as valor_campo_externo FROM ',
					(SELECT tabela_externa FROM tipos_de_identificadores WHERE id_chave_tipo_de_identificador = tdi.id_chave_tipo_de_identificador) , 
					' WHERE ', 
					(SELECT nome_campo_da_chave_primaria_externa FROM tipos_de_identificadores WHERE id_chave_tipo_de_identificador = tdi.id_chave_tipo_de_identificador),
					' = ',
					REPLACE(REPLACE(REPLACE(valor, '\r', ''), '\n', ''), '\t', ''), 
					']]')
			END, 
			'</span></div>'), '')  order by tdi.ordem_exposicao asc SEPARATOR ''
			), 
			'</div></td>') AS identificadores,
	       CONCAT('<td class=\'fr_img td_principal\'><img class=\'icone td_principal\' src=\'',REPLACE((SELECT valor FROM evidencias_tipos_de_identificadores WHERE id_evidencia = @id_evidencia AND id_tipo_de_identificador = (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = 'FILE')),'/var/www/html/dev_vitor/papedins','../..'), '\'></td>') AS file
	    #   CONCAT('<td class=\'fr_data td_principal\'>',(select nome_grupo_de_token  from evidencias, tokens, grupos_de_tokens where id_token_tipo_de_evidencia = id_chave_token and id_grupo_de_token = id_chave_grupo_de_token and id_chave_evidencia = @id_evidencia), '</td>') as grupo_de_token 
        FROM evidencias e
        LEFT JOIN autores_evidencias ae ON e.id_chave_evidencia = ae.id_evidencia
        LEFT JOIN pessoas p ON ae.id_pessoa = p.id_chave_pessoa
        LEFT JOIN evidencias_tipos_de_identificadores etdi ON e.id_chave_evidencia = etdi.id_evidencia
        LEFT JOIN tipos_de_identificadores tdi ON etdi.id_tipo_de_identificador = tdi.id_chave_tipo_de_identificador
        GROUP BY e.id_chave_evidencia ORDER BY e.data DESC";
file_put_contents("log_sel.txt", $sql . "\n");
$result = $conn->query($sql);
$padrao = '/\[\[(SELECT .*?)\]\]/i';
$resultados=array();
// Verificar e exibir os resultados
if ($result->num_rows > 0) {
    echo '<table id="table_principal">';
    while($row = $result->fetch_assoc()) {
	$id_evidencia = $row["id_evidencia"];
	$identificadores = $row["identificadores"] ?? "<td class='fr_grupo td_principal'><div class='falta'>Sem identificadores</div></td>"; // Se não houver identificadores, exibir "Sem identificadores"
	file_put_contents("log.txt", $identificadores . "\n", FILE_APPEND);
	$novos_identificadores = $identificadores;

// Verifica se a string contém a substring desejada

	if (preg_match($padrao, $identificadores, $resultados)) {
		$valor_externo = query_dinamico($resultados[1]);
		$novos_identificadores = preg_replace('/\[\[.*?\]\]/', $valor_externo, $identificadores);
	} else {$valor_externo = "erro ao extrair campo externo";}
	echo '<tr class="tr_principal" data-id-evidencia="'.$id_evidencia.'">';
        echo $row["evidencia"];
     //   echo $row["file"] ?? "<td class='fr_data td_principal'><div class='falta'>Sem imagem</div></td>"; // Se não houver arquivo, exibir "Sem imagem"
        echo $row["autores"] ?? "<td class='fr_grupo td_principal'><div class='falta'>Sem autores</div></td>"; // Se não houver autores, exibir "Sem autores"
        echo $novos_identificadores; // Se não houver identificadores, exibir "Sem identificadores";
        // echo $row["grupo_de_token"];
        //echo $row["data"];
	echo '</tr>';
    }
    echo '</table>';
} else {
    echo "<div class='div_evidencia'>0 resultados</div>"; // Se não houver resultados, exibir "0 result
}

// Fechar conexão
$conn->close();
?>

<!-- CSS para estilização -->
<style>


/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
html {
	line-height: 1;
	width: auto;
        height: 100vh;
}

ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}

#cria_evidencia {
    font-size: 1.4rem;
    font-weight: bold;
    color: #0000AA;
    text-align: center;
    padding: 5px;
    border: none;
    border-radius: 5px;
    margin: 3px;
    flex-shrink: 1;
    box-sizing: border-box;	
}
#label_titulo {
    font-size: 1.4rem;
    font-weight: bold;
    color: #CCBBB5;
    text-shadow: 2px 2px 2px #000000;
    text-align: center;
    width: 100%;
    height: 100%;
    padding: 10px;
    background-color: transparent;
    border: none;
    border-radius: 5px;
    box-sizing: border-box;
    display: inline-block;
    margin: 3px;
    flex-shrink: 1;
    box-sizing: border-box;	
}

#botao_de_percorrer {
    flex-shrink: 1;
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 1.4rem;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 5px;
    box-sizing: border-box;
}

/*  * {
  outline: 1px solid #f00 !important;
}  isso aqui permite ver os limites dos elementos para debug*/

		html {
			background-color: black;
		}

/* * {
    outline: 1px solid yellow; 
} */


	  #cabecalio-container {
			display: flex;
			flex-direction: row;
			align-items: center; /* alinhamento no centro no eixo vertical */
			justify-content: space-between; /* alinhamento no centro no eixo horizontal */
			overflow-x: scroll;
                        width: 100%;
		/*	height: 4vw;
                        top: 0px;
                        left: 0px;
                        position: absolute;
                        background-color: #1B5543;
                        padding: 10px;
			overflow: auto; */
			position: sticky;
			top: 0;
			background-color: #333;
			color: white;
			text-align: center;
			padding: 10px 0;
			z-index: 1000;                
			box-sizing: border-box;
			flex-shrink: 0;
			flex-grow: 0;
	}




           #table-container {
			flex-grow: 1;
		        background-color: #f4f4f4;
			display: inline;
                        overflow-y: auto;
                        overflow-x: auto;
                      /*  position: absolute;*/
			/* top: 10%;*/
			/*height: auto;*/
			/* left: 0%; */
			background-color: #FF0000;
			box-sizing: border-box;
		}


flex_container_evidencias {
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	align-items: flex-start; /* alinhamento no topo no eixo vertical */
	justify-content: flex-start; /* alinhamento à esquerda no eixo horizontal */
	padding: 5px;
}

    body {
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
	line-height: 1;
	height: 100vh;
	max-height: 100vh;
	font-family: Arial, Helvetica, sans-serif;
	background-color: #202030;
	color: white;
	margin: 0px;
	padding: 0px;
    }


    .fr_container_flex {
        display: flex;
        flex-wrap: wrap;
	flex-direction: column;
    align-items: flex-start; /* alinhamento no topo no eixo vertical */
    }

    .celula_dados_container {
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	flex-shrink: 1;
	width: auto;
	font-size: 0.7em;
    }

    .titulo_da_pagina {
	padding: 10px;
	font-size: 2em;
	background-color: transparent;	
     }

    .dados_atomicos {
	padding: 5px;
	flex-shrink: 1;
	color: black;
	font-size: 0.9em;
	background-color: #00AA00;
	border-radius: 5px;
	border: 2px solid black;
	box-sizing: border-box;
    	display: inline-block;
	margin: 3px;
	width: fit-content;
    }

    .fr_evidencia {
	}
    .fr_grupo {
	color: white;
    }

    .fr_autor, .fr_identificador {
        padding: 3px;
	border-radius: 10px;
	font-size: 1.3em;
	margin: 2px;
	justify-content: flex-start; /* alinhamento à esquerda no eixo horizontal */
	}

    .fr_identificador {
	background-color: #1010AA;
        color: #CCBBB5; /* Cor do texto */
        border: 2px solid #CCBBEE; /* Cor da borda */
	}

    .fr_autor {
	background-color: #005010;
        color: white; /* Cor do texto */
        border: 2px solid orange; /* Cor da borda */
	word-wrap: break-word;
	width: auto;
	}

    .fr_evidencia {
	}

    .fr_container_flex {
	display: flex;
	flex-wrap: wrap;
	}

    .div_evidencia {
        border: 3px solid black; /* Cor da borda */
        background-color: #CCF010; /* Cor de fundo */
        color: white; /* Cor do texto */
        padding: 5px;
	border-radius: 10px;
	font-size: 0.9rem;
	color: black;
	display: inline-block;
	box-sizing: border-box;
	
     }
    .fr_evidencia {
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	align-items: flex-start; /* alinhamento no topo no eixo vertical */
	justify-content: flex-start; /* alinhamento à esquerda no eixo horizontal */
        padding: 5px;
	color: white;
	font-size: 1.1em;
	font-weight: bold;
	word-wrap: anywhere;
    }
    .fr_data {
        padding: 10px;
	color: white;
    }
    .fr_img {
        padding: 10px;
	color: white;
	max-width: 90%;
    }
    .falta{
	color: white;
	font-size: 0.9em;
	background-color: #000099;
	border-radius: 5px;
	border: 2px solid #0000CC;
	box-sizing: border-box;
    	display: inline-block;
	}
    table {
	display: block;
        width: auto;
        border-collapse: collapse;
	border-spacing: 0;
    }

    .td_principal {
	vertical-align: top;
	overflow: hidden;
	padding-top: 5px;
	padding-bottom: 5px;
    }
table tr:hover {
  background-color: #102045; /* Altera a cor da borda para vermelho */
}
.tr_principal:not(:first-child) td {
    /* Estilos CSS aqui */
        border-top: 1px solid #506010;
}

	.valor_evidencia {
		color: #AAFFFF;
		font-weight: bold;
	}
.tr_principal:nth-child(odd) {
    background-color: #002030;
}

.tr_principal:nth-child(even) {
    background-color: #001040;
}

.icone {
  max-width: 100%;  
  height: auto;    /* Mantém a altura proporcional à largura, preservando a razão de aspecto */
  flex-shrink: 1;
  flex-grow: 1;  
}
	#table_principal {
		flex-shrink: 0;
	}

@media screen and (max-width: 600px) {

	


    #cabecalio-container > * {
	width: 100px;
	font-size: 0.8rem;
	padding: 15px;
    	flex-basis: 33%;
    }
    #cria_evidencia {
        font-size: 1rem;
   	max-height: 1.2rem;
	padding: 0px;
	margin: 0px;
    }
    #label_titulo {
        font-size: 1rem;
    }
    #botao_de_percorrer {
        font-size: 1rem;
	max-height: 1.2rem;
	padding: 0px;
	margin: 0px;
    }
    .titulo_da_pagina {
	font-size: 1rem;
    }
    .dados_atomicos {
	font-size: 0.8rem;
    }
     .fr_autor, .fr_identificador {
	font-size: 0.7em;
    }
    .div_evidencia {
	/* font-size: 0.7rem; */
	width: auto;
	word-wrap: breal-all;
    }
    .fr_evidencia {
	font-size: 0.8rem;
    }
    fr_evidencia {
	width: 40vw;
    }
   
}

</style>

<script>

var min_top=1000000; // valor inicial para o top, que indicará o elemento mais acima na tela para o debugger_definitivo.php
var max_bottom=-1000000; // valor inicial para o bottom, que indicará o elemento mais abaixo na tela para o debugger_definitivo.php
var min_left=1000000; // valor inicial para o left, que indicará o elemento mais à esquerda na tela para o debugger_definitivo.php
var max_right=-1000000; // valor inicial para o right, que indicará o elemento mais à direita na tela para o debugger_definitivo.php


function enviarDadosParaServidor(dados) {
    console.log(dados);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'debugger_definitivo.php', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(dados));
}

function coletarDadosDoElemento(elemento) {
    var estilosComputados = window.getComputedStyle(elemento);
    var retangulo = elemento.getBoundingClientRect();
    let elementoParentNodeTag;
    let elementoParentNodeId;	
    let elementoParentNodeClass;
    let elementoParentElementTag;
    let elementoParentElementId;
    let elementoParentElementClass;


    if (elemento.parentNode === null) {
	elementoParentNodeTag = 'ParentNode nulo';
	elementoParentNodeId = 'ParentNode nulo';
	elementoParentNodeClass = 'ParentNode nulo';
    } else {
	elementoParentNodeTag = elemento.parentNode.tagName;
	elementoParentNodeId = elemento.parentNode.id;
	elementoParentNodeClass = elemento.parentNode.className;
    }

    if (elemento.parentElement === null) {
	elementoParentElementTag = 'ParentElement nulo';
	elementoParentElementId = 'ParentElement nulo';
	elementoParentElementClass = 'ParentElement nulo';
    } else {
	elementoParentElementTag = elemento.parentElement.tagName;
	elementoParentElementId = elemento.parentElement.id;
	elementoParentElementClass = elemento.parentElement.className;
    }

	if ( retangulo.top < min_top) {min_top=retangulo.top;}
	if ( retangulo.bottom > max_bottom) {max_bottom=retangulo.bottom;}
	if ( retangulo.left < min_left) {min_left=retangulo.left;}
	if ( retangulo.right > max_right) {max_right=retangulo.right;}

    return {
        tag: elemento.tagName,
        id: elemento.id,
	type: elemento.type,
        class: elemento.className,
	tag_no_pai: elementoParentNodeTag,
	id_no_pai: elementoParentNodeId, 
	class_no_pai: elementoParentNodeClass, 
	tag_elemento_pai: elementoParentElementTag,
	id_elemento_pai: elementoParentElementId, 
	class_elemento_pai: elementoParentElementClass, 
        position: estilosComputados.position,
        display: estilosComputados.display,
        top: retangulo.top,
        left: retangulo.left,
        bottom: retangulo.bottom,
        right: retangulo.right,
        height: retangulo.height,
        width: retangulo.width,
        padding: estilosComputados.padding,
        margin: estilosComputados.margin,
	flex_shrink: estilosComputados.flexShrink,
	max_width: estilosComputados.maxWidth,
	min_width: estilosComputados.minWidth,
	overflow: estilosComputados.overflow
    };
}

function percorrerElementosDoDOM() {
    alert('vai percorrer');
    var todosElementos = document.querySelectorAll('*');
    var dadosElementos = Array.from(todosElementos).map(coletarDadosDoElemento);
    var dados = {
	min_top: min_top,
	max_bottom: max_bottom,
	min_left: min_left,
	max_right: max_right,
    };
    dadosElementos.unshift(dados);
    enviarDadosParaServidor(dadosElementos);
}

function ajustarAlturaTableContainer() {
setTimeout( function () {
    var alturaDoCabecalho = document.querySelector('#cabecalio-container').offsetHeight;
    var tableContainer = document.querySelector('#table-container');
//    tableContainer.style.height = 'calc(100vh - ' + alturaDoCabecalho + 'px)';
    tableContainer.style.maxHeight = 'calc(100vh - ' + alturaDoCabecalho + 'px)';
    }, 1000);
}

// Ajuste a altura quando a página carregar
window.onload = ajustarAlturaTableContainer;

// Ajuste a altura quando a janela for redimensionada, se necessário
window.onresize = ajustarAlturaTableContainer;

 document.addEventListener("DOMContentLoaded", function() {
 setTimeout( function () {
   document.body.style.display='block';
 
   var windowHeight = window.innerHeight || document.documentElement.clientHeight;
   var upperDivHeight_1 = document.querySelector('#cabecalio-container').offsetHeight;
   var upperDivHeight = document.querySelector('#cabecalio-container').getBoundingClientRect().height;
   var dynamicDiv = document.getElementById('table-container');
//   dynamicDiv.style.height = (windowHeight - upperDivHeight_1) + 'px';
//   dynamicDiv.style.top = upperDivHeight_1 + 'px';
//   dynamicDiv.style.left = '0px';
//   document.getElementById('cria_evidencia').style.height=upperDivHeight_1 - 15 + 'px';
//   document.getElementById('cria_evidencia').style.top= '0px';
  }, 1000);
 
 
 	document.querySelectorAll('table tr').forEach(function(tr) {
 	    tr.addEventListener('dblclick', function(event) {
 			window.open("https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/inseridencia.php?id_evidencia=" + this.getAttribute("data-id-evidencia"), "_blank");
 	        })
 	    });
 
 
 });
</script>

<?php
echo '
</div>
</body>';
echo '</html>';
?>

