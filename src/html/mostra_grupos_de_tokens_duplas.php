<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duplokens</title>
    <style>
        /* Você pode adicionar estilos CSS aqui se precisar */
/* Estilo geral da página */
body {
    background-color: #1a1a1a; /* fundo escuro */
    color: white;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

/* Estilo do cabeçalho */
header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    background-color: #121212; /* fundo um pouco mais claro que o body */
    display: flex;
    align-items: center;
    padding-left: 20px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.5); /* sombra sutil */
}

header img {
    height: 40px; /* altura do logo */
    margin-right: 15px; /* espaço entre o logo e o título */
}

header h1 {
    margin: 0;
    font-size: 20px;
}

/* Estilo da tabela principal */
.tabela_grupos {
    margin-top: 70px; /* espaço para não ficar abaixo do cabeçalho fixo */
    border-collapse: collapse;
    width: 99%;
}

.tabela_grupos td {
    vertical-align: top;
    border-top: 2px solid rgba(255, 255, 255, 0.5);
    padding: 10px;
    overflow: auto;
}

.linha_nome_grupo {
    /* width: 20%; coluna mais estreita */
	font-weight: bold;
}

/* Estilo dos divs dentro da célula à direita */
.linha_tokens_internos {
    display: flex;
    flex-wrap: wrap; /* permite que os divs ocupem múltiplas linhas se necessário */
}

.div_tokens_internos {
    background-color: #333;
    border: 1px solid #444;
    border-radius: 4px; /* cantos arredondados */
    margin: 10px;
    padding: 5px 10px;
}

.rotulo_valido {
    margin-left: 10px;
    font-size: 12px;
    color: #ccc;
}
.label_evidencia {
    color: #ffaa00;
    font-weight: bold;
}
.label_veiculo {
    color: #00ffcc;
}
	</style>
    <script>
        // Se você precisar de algum JavaScript, pode adicioná-lo aqui
   
function gravaScript() {
    fetch('updateValido.php')
    .then(response => response.text())
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));
}

 
function atualizarValido(checkboxElem) {
    var valido = checkboxElem.checked ? "sim" : "nao";
    var idChave = checkboxElem.getAttribute("data-id-chave-duplo");

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
           // Tratar a resposta do PHP, se necessário
	   verificarValido(checkboxElem.getAttribute('data-id-chave-duplo'), checkboxElem, function (resposta) { checkboxElem.checked = (resposta.trim().toLowerCase() === "sim"); });
	   //setTimeout(function () { verificarValido(checkboxElem.getAttribute('data-id-chave-duplo'), checkboxElem, function (resposta) { checkboxElem.checked = (resposta === "sim"); console.log(resposta); }); },
        }
    };
    xhttp.open("POST", "atualiza_valido.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("valido=" + valido + "&id_chave_duplo_token_para_grupo_de_token=" + idChave);
}

function verificarValido(idChave, checkboxElem, callback) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            callback(this.responseText);
        }
    };
    xhttp.open("POST", "getValido.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("id_chave_duplo_token_para_grupo_de_token=" + idChave);
}



    </script>
</head>
<body>
<header>
    <img src="logo_fundacentro.jpeg" alt="Logo da Fundacentro">
    <h1>Grupos de Tokens</h1>
    <input type="button" value="grava script: script_update_valido.sql" onclick="gravaScript()">	
</header>

<?php

include "identifica.php.cripto";
file_put_contents("duplas_relacionadas_a_grupos.txt", "<table>\n\n");
$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados; 

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Checar conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

//$sql = "SELECT 
//	    '<tr>' AS TR1,
//            CONCAT('<tr><td class=\"linha_nome_grupo\">', acentuada, '</td>') as primeira_coluna, 
//            CONCAT('<td class=\"linha_tokens_internos\">', GROUP_CONCAT(CONCAT('<div class=\"div_tokens_internos\">', t1.nome_token, '</div>') SEPARATOR ''), '</td>') as segunda_coluna, 
//            CONCAT('<td class=\"linha_tokens_internos\">', GROUP_CONCAT(CONCAT('<div class=\"div_tokens_internos\">', t2.nome_token, '</div>') SEPARATOR ''), '</td></tr>') as terceira_coluna, 
//	    '</tr>' AS TR2        
//FROM 
//            tipos_de_evidencias as te, tokens as t1, tokens as t2, grupos_de_tokens, tipos_de_veiculos as tv
//        WHERE 
//            t1.id_chave_token = te.id_token AND 
//            t1.id_grupo_de_token = id_chave_grupo_de_token AND
//	    t2.id_chave_token = tv.id_token AND
//	    t2.id_grupo_de_token = id_chave_grupo_de_token 
//        GROUP BY 
//            nome_grupo_de_token 
//        ORDER BY 
//            nome_grupo_de_token";


//$sql = "SELECT
//    '<tr>' AS TR1, 
//    CONCAT('<td class=\"linha_nome_grupo\">', acentuada, '</td>') AS primeira_coluna, 
//    CONCAT('<td><div class=\"linha_tokens_internos\">', GROUP_CONCAT(DISTINCT CONCAT('<div class=\"div_tokens_internos\">', t1.nome_token, '</div>') SEPARATOR ''), '</div></td>') AS segunda_coluna, 
//    CONCAT('<td><div class=\"linha_tokens_internos\">', GROUP_CONCAT(DISTINCT CONCAT('<div class=\"div_tokens_internos\">', t2.nome_token, '</div>') SEPARATOR ''), '</div></td>') AS terceira_coluna,
//    '</tr>' AS TR2 
//
//FROM 
//    grupos_de_tokens
//LEFT JOIN tokens AS t1 ON t1.id_grupo_de_token = grupos_de_tokens.id_chave_grupo_de_token
//LEFT JOIN tipos_de_evidencias AS te ON t1.id_chave_token = te.id_token
//LEFT JOIN tokens AS t2 ON t2.id_grupo_de_token = grupos_de_tokens.id_chave_grupo_de_token
//LEFT JOIN tipos_de_veiculos AS tv ON t2.id_chave_token = tv.id_token
//GROUP BY 
//    nome_grupo_de_token 
//ORDER BY 
//    nome_grupo_de_token;
//";

// $sql="SELECT 
//     CONCAT('<td class=\"linha_nome_grupo\">',gdt.acentuada,'</td>') AS primeira_coluna,
//     (SELECT CONCAT('<td><div class=\"linha_tokens_internos\">', GROUP_CONCAT(DISTINCT CONCAT('<div class=\"div_tokens_internos\">',t.nome_token,'</div>') ORDER BY t.nome_token SEPARATOR ''), '</div></td>')
//      FROM tokens AS t
//      JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
//      WHERE t.id_grupo_de_token = gdt.id_chave_grupo_de_token) AS segunda_coluna,
//     (SELECT  CONCAT('<td><div class=\"linha_tokens_internos\">',  GROUP_CONCAT(DISTINCT CONCAT('<div class=\"div_tokens_internos\">' ,t.nome_token,'</div>')  ORDER BY t.nome_token SEPARATOR ''),  '</div></td>')
//      FROM tokens AS t
//      JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
//      WHERE t.id_grupo_de_token = gdt.id_chave_grupo_de_token) AS terceira_coluna
// FROM 
//     grupos_de_tokens AS gdt
// GROUP BY 
//     gdt.acentuada
// ORDER BY 
//     gdt.acentuada;";

$sql = " 
select
	concat('<td class=\"linha_nome_grupo\">', acentuada, '</td>') as primeira_coluna,
	nome_grupo_de_token,
	concat('<td><div class=\"linha_tokens_internos\">', group_concat(concat('<div class=\"div_tokens_internos\"><label class=\"label_evidencia\">', e.nome_token,'</label> - <label class=\"label_veiculo\">', v.nome_token,'</label><label class=\"rotulo_valido\">válido</label><input id=\"check_',id_chave_duplo_token_para_grupo_de_token,'\" type=\"checkbox\" value=\"\" data-id-chave-duplo=\"',id_chave_duplo_token_para_grupo_de_token,'\"', CASE WHEN valido='sim' THEN 'checked' ELSE '' END  ,' onclick=\"atualizarValido(this);\"></div>') order by e.nome_token,v.nome_token separator ''), '</div></td>') as segunda_coluna, 
	group_concat(concat('[',e.nome_token, '-', v.nome_token, ']')) 
from 
	duplos_tokens_para_grupos_de_tokens as dt, 
	tokens as e, 
	tokens as v, 
	grupos_de_tokens as gt 
where 
	id_token_evidencia = e.id_chave_token and 
	id_token_veiculo = v.id_chave_token and 
	dt.id_grupo_de_token = id_chave_grupo_de_token 
group by id_chave_grupo_de_token;
";



$result = $conn->query($sql);

echo "<table class='tabela_grupos'>";
echo "<tr><th>Grupos</th><th>Evidências</th><th>Veículos</th></tr>";
if ($result->num_rows > 0) {
    // Imprimir dados de cada linha
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo $row["primeira_coluna"];
        echo $row["segunda_coluna"] ?? "<td></td>";
        //echo $row["terceira_coluna"] ?? "<td></td>";

        echo "</tr>";

	file_put_contents("duplas_relacionadas_a_grupos.txt", "<tr>".$row["primeira_coluna"]."\n".$row["segunda_coluna"]."\n</tr>"."\n\n\n", FILE_APPEND);
    }
} else {
    echo "<tr><td>Nenhum resultado encontrado</td></tr>";
}

echo "</table>";

$conn->close();
file_put_contents("teste.txt", "</table>\n\n", FILE_APPEND);
?>

</body>
</html>

