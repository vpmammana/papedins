<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grupokens</title>
    <style>
        /* Você pode adicionar estilos CSS aqui se precisar */
/* Estilo geral da página */
body {
    background-color: #3a3a3a; /* fundo escuro */
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
    border: 1px solid rgba(255, 255, 255, 0.1);
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
    margin: 2px;
    padding: 5px 10px;
}

	</style>
    <script>
        // Se você precisar de algum JavaScript, pode adicioná-lo aqui
    </script>
</head>
<body>
<header>
    <img src="logo_fundacentro.jpeg" alt="Logo da Fundacentro">
    <h1>Grupos de Tokens</h1>
</header>

<?php

include "identifica.php.cripto";
file_put_contents("teste.txt", "<table>\n\n");
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

$sql="
SELECT
    CONCAT('<td class=\"linha_nome_grupo\">',gdt.acentuada,'</td>') AS primeira_coluna,
    (SELECT CONCAT('<td><div class=\"linha_tokens_internos\">', GROUP_CONCAT(DISTINCT CONCAT('<div class=\"div_tokens_internos\">',t.nome_token,'</div>') ORDER BY t.nome_token SEPARATOR ''), '</div></td>')
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     JOIN grupos_vs_tipos_de_evidencias_n_to_n AS gvtd ON te.id_chave_tipo_de_evidencia = gvtd.id_tipo_de_evidencia
     JOIN grupos_de_tokens AS gdt2 ON gvtd.id_grupo_de_token = gdt2.id_chave_grupo_de_token
     WHERE  gdt2.id_chave_grupo_de_token = gdt.id_chave_grupo_de_token) AS segunda_coluna,
    (SELECT  CONCAT('<td><div class=\"linha_tokens_internos\">',  GROUP_CONCAT(DISTINCT CONCAT('<div class=\"div_tokens_internos\">' ,t.nome_token,'</div>')  ORDER BY t.nome_token SEPARATOR ''),  '</div></td>')
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     JOIN grupos_vs_tipos_de_veiculos_n_to_n AS gvtd ON tv.id_chave_tipo_de_veiculo = gvtd.id_tipo_de_veiculo
     JOIN grupos_de_tokens AS gdt3 ON gvtd.id_grupo_de_token = gdt3.id_chave_grupo_de_token
     WHERE  gdt3.id_chave_grupo_de_token = gdt.id_chave_grupo_de_token) AS terceira_coluna
FROM
    grupos_de_tokens AS gdt
GROUP BY
    gdt.acentuada
ORDER BY
    gdt.acentuada;
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
        echo $row["terceira_coluna"] ?? "<td></td>";
;
        echo "</tr>";

	file_put_contents("teste.txt", "<tr>".$row["primeira_coluna"]."\n".$row["segunda_coluna"]."\n".$row["terceira_coluna"]."</tr>"."\n\n\n", FILE_APPEND);
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

