<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta ao Banco</title>
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
    width: 100%;
}

.tabela_grupos td {
    vertical-align: top;
    border: 1px solid rgba(255, 255, 255, 0.1);
    padding: 10px;
}

.linha_nome_grupo {
    width: 20%; /* coluna mais estreita */
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

$servername = "localhost";
$password = $pass;
$dbname = $nome_base_dados; 

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Checar conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$sql = "SELECT 
            CONCAT('<tr><td class=\"linha_nome_grupo\">', acentuada, '</td>') as primeira_coluna, 
            CONCAT('<td class=\"linha_tokens_internos\">', GROUP_CONCAT(CONCAT('<div class=\"div_tokens_internos\">', nome_token, '</div>') SEPARATOR ''), '</td></tr>') as segunda_coluna 
        FROM 
            tipos_de_evidencias, tokens, grupos_de_tokens 
        WHERE 
            id_chave_token = id_token AND 
            id_grupo_de_token = id_chave_grupo_de_token 
        GROUP BY 
            nome_grupo_de_token 
        ORDER BY 
            nome_grupo_de_token";

$result = $conn->query($sql);

echo "<table class='tabela_grupos'>";

if ($result->num_rows > 0) {
    // Imprimir dados de cada linha
    while($row = $result->fetch_assoc()) {
        echo $row["primeira_coluna"];
        echo $row["segunda_coluna"];
    }
} else {
    echo "<tr><td>Nenhum resultado encontrado</td></tr>";
}

echo "</table>";

$conn->close();
?>

</body>
</html>

