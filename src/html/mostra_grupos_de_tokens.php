<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta ao Banco</title>
    <style>
        /* Você pode adicionar estilos CSS aqui se precisar */

/* Estilizando a tabela principal */
.tabela_grupos {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #2a2a2a;
    font-family: Arial, sans-serif;
    background-color: #333;
    color: white;
}

.tabela_grupos td {
    padding: 8px;
    vertical-align: top;
    border: 1px solid #2a2a2a;
}

.tabela_grupos tr:nth-child(odd) {
    background-color: #444;
}

.tabela_grupos tr:hover {
    background-color: #555;
}

/* Estilizando a classe linha_nome_grupo */
.linha_nome_grupo {
    font-weight: bold;
    font-size: 1.1em;
    text-align: left;
    vertical-align: top;
}

/* Estilizando a tabela interna */
.tabela_tokens_internos {
    width: 100%;
    border-collapse: collapse;
}

.tabela_tokens_internos td {
    padding: 4px;
    border: 1px solid #2a2a2a;
}

.tabela_tokens_internos tr:nth-child(odd) {
    background-color: #3a3a3a;
}

.tabela_tokens_internos tr:hover {
    background-color: #4a4a4a;
}

	</style>
    <script>
        // Se você precisar de algum JavaScript, pode adicioná-lo aqui
    </script>
</head>
<body>

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
            CONCAT('<tr><td class=`linha_nome_grupo`>', nome_grupo_de_token, '</td>') as primeira_coluna, 
            CONCAT('<td><table class=`tabela_tokens_internos`>', GROUP_CONCAT(CONCAT('<tr><td class=`linha_tokens_internos`>', nome_token, '</td></tr>') SEPARATOR ''), '</table></td></tr>') as segunda_coluna 
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

