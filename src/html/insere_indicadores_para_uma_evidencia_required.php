<?php
// Conexão com o banco de dados

include "identifica.php.cripto";




$host = "localhost"; // ou seu endereço de servidor de banco de dados
$dbname = $nome_base_dados;
$password = $pass;

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
    exit;
}

// Recebe o id_evidencia
$id_evidencia = $_GET['id_evidencia'] ?? '';

if (empty($id_evidencia)) {
    echo "ID da evidência é necessário.";
    exit;
}

// Busca o id_token_tipo_de_evidencia na tabela evidencias
$queryEvidencias = "SELECT id_token_tipo_de_evidencia FROM evidencias WHERE id_chave_evidencia = :id_evidencia";
$stmtEvidencias = $conn->prepare($queryEvidencias);
$stmtEvidencias->execute(['id_evidencia' => $id_evidencia]);
$id_token_tipo_de_evidencia = $stmtEvidencias->fetchColumn();

// Busca o id_grupo_de_token na tabela tokens
$queryTokens = "SELECT id_grupo_de_token FROM tokens WHERE id_chave_token = :id_token_tipo_de_evidencia";
$stmtTokens = $conn->prepare($queryTokens);
$stmtTokens->execute(['id_token_tipo_de_evidencia' => $id_token_tipo_de_evidencia]);
$id_grupo_de_token = $stmtTokens->fetchColumn();

// Busca os tipos de identificadores
$queryIdentificadores = "SELECT t.id_chave_tipo_de_identificador, t.nome_tipo_de_identificador,requerido, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo  
                         FROM grupos_vs_identificadores g
                         INNER JOIN tipos_de_identificadores t ON g.id_tipo_de_identificador = t.id_chave_tipo_de_identificador
                         WHERE g.id_grupo_de_token = :id_grupo_de_token";
$stmtIdentificadores = $conn->prepare($queryIdentificadores);
$stmtIdentificadores->execute(['id_grupo_de_token' => $id_grupo_de_token]);
$tiposDeIdentificadores = $stmtIdentificadores->fetchAll(PDO::FETCH_ASSOC);

// Processamento do formulário
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    foreach ($tiposDeIdentificadores as $tipo) {
        $valor = $_POST['valor_' . $tipo['id_chave_tipo_de_identificador']] ?? '';
        $insertQuery = "INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) VALUES (?, ?, ?, ?)";
        $insertStmt = $conn->prepare($insertQuery);
        $insertStmt->execute([$tipo['nome_tipo_de_identificador'], $tipo['id_chave_tipo_de_identificador'], $id_evidencia, $valor]);
    }

    echo "Dados inseridos com sucesso!";
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Formulário de Identificadores</title>
</head>
<body>
    <form action="" method="post" class="clearfix">
        <div>
            <?php foreach ($tiposDeIdentificadores as $tipo): ?>
                <label for="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>">
                    <?= $tipo['nome_tipo_de_identificador']; ?>
                </label>
                <?php if (!is_null($tipo["tabela_externa"])): ?>
                    <div id='drop_<?= $tipo['id_chave_tipo_de_identificador']; ?>' class='dropdown-wrapper campo' data-sql='SELECT  <?= $tipo["nome_campo_do_nome_externo"] ?>,<?= $tipo["nome_campo_da_chave_primaria_externa"] ?> FROM <?= $tipo["tabela_externa"] ?> WHERE <?= $tipo["nome_campo_do_nome_externo"] ?> LIKE ?;'>
                        <input id='input_<?= $tipo['id_chave_tipo_de_identificador']?>' type='text' class='search-input' autocomplete='off' name='valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>' placeholder='Digite para buscar...' data-tabela='evidencias_tipos_de_identificadores' data-campo='valor' data-tabela-externa='<?= $tipo["tabela_externa"] ?>' data-campo-nome-externo='<?= $tipo["nome_campo_do_nome_externo"] ?>' data-id-externo='<?= $tipo['nome_campo_da_chave_primaria_externa']?>' data-companion-id='id_identificador_<?= $tipo['id_chave_tipo_de_identificador']?>' data-companion-results='results_<?= $tipo['id_chave_tipo_de_identificador']?>'>
                        <input id='id_identificador_<?= $tipo['id_chave_tipo_de_identificador']?>' type='hidden' name='id_<?= $tipo['id_chave_tipo_de_identificador']; ?>' value=''>
                        <div id='results_<?= $tipo['id_chave_tipo_de_identificador']?>' class='results' tabindex='-1'></div>
                    </div>
                <?php else: ?>
                    <input type="text" 
                           name="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>" 
                           id="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>"
                           class="<?= $tipo['requerido'] ? 'required-field' : ''; ?>"
                           <?= $tipo['requerido'] ? 'required' : ''; ?>>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>
        <button type="submit">Enviar</button>
    </form>
</body>
</html>

