<?php
// Conexão com o banco de dados
file_put_contents("log_verifica_bug_insere_indicadores.txt","insere_indicadores_para_uma_evidencia_required.php\n");
include "identifica.php.cripto";
    file_put_contents("debug_insere_indicadores.txt","Inicio");

function consultaEvidencia_externa($id_evidencia, $id_tipo_identificador, $mostra_tabela_externa_interna) {

    // Inclui o arquivo com as credenciais do banco de dados
    include "identifica.php.cripto";

    // Cria a conexão com o banco de dados
    $conexao = new mysqli("localhost", $username, $pass, $nome_base_dados);

    // Verifica se a conexão foi bem-sucedida
    if ($conexao->connect_error) {
        die("Falha na conexão: " . $conexao->connect_error);
    }

    // Prepara a consulta SQL
    $stmt = $conexao->prepare("SELECT valor, tabela_externa, nome_campo_do_nome_externo, nome_campo_da_chave_primaria_externa FROM evidencias_tipos_de_identificadores, tipos_de_identificadores WHERE id_evidencia = ? AND id_tipo_de_identificador = ? and id_chave_tipo_de_identificador = ?");

    // Vincula o parâmetro à consulta preparada
    $stmt->bind_param("iii", $id_evidencia, $id_tipo_identificador, $id_tipo_identificador);

    // Executa a consulta
    $stmt->execute();

    // Obtém o resultado da consulta
    $resultado = $stmt->get_result();

    // Verifica se algum resultado foi encontrado
    if ($resultado->num_rows > 0) {
        // Obtém o valor
        $row = $resultado->fetch_assoc();
        $valor = $row["valor"];
  	$tabela_externa = $row["tabela_externa"];
        $nome_campo_do_nome_externo = $row["nome_campo_do_nome_externo"];
	$nome_campo_da_chave_primaria_externa = $row["nome_campo_da_chave_primaria_externa"];
        // Verifica as condições para buscar valor da tabela externa
        if ($tabela_externa !== null && $mostra_tabela_externa_interna === "externa") {
            // Aqui você deve adicionar o código para buscar o valor do campo externo
            // Este é um exemplo genérico
           $stmt_externo = $conexao->prepare("SELECT $nome_campo_do_nome_externo FROM $tabela_externa WHERE $nome_campo_da_chave_primaria_externa = ?");
           if ($stmt_externo) { 
		$stmt_externo->bind_param("i", $valor); // Supondo que o id_evidencia é usado para buscar na tabela externa
            	$stmt_externo->execute();
            	$resultado_externo = $stmt_externo->get_result();
            	if ($resultado_externo->num_rows > 0) {
                	$row_externo = $resultado_externo->fetch_assoc();
                	$valor = $row_externo[$nome_campo_do_nome_externo];
            	} else {
        		$valor = "consulta à tabela externa inconforme"; // nao deu erro com o statement, mas nao encontrou o valor
    		}
	   } else {
		$valor = "consulta à tabela externa inconforme"; // deu algum erro com o SQL statement
	   }
	    
            $stmt_externo->close();
        } else {} // se nao tem tabela externa, ou se o caller deseja o valor interno, $valor já está definido como $row["valor"]

    } else {
	$valor = ""; // se não existe identificador definido para este id_evidencia, entao retorna vazio
    }
    // Fecha o statement e a conexão
    $stmt->close();
    $conexao->close();

    // Retorna o valor
    return $valor;
} // fim consultaEvidencia_externa


function consultaEvidencia($id_evidencia, $id_tipo_identificador, $mostra_tabela_externa_interna) {

    // Inclui o arquivo com as credenciais do banco de dados
    include "identifica.php.cripto";

    // Cria a conexão com o banco de dados
    $conexao = new mysqli("localhost", $username, $pass, $nome_base_dados);

    // Verifica se a conexão foi bem-sucedida
    if ($conexao->connect_error) {
        die("Falha na conexão: " . $conexao->connect_error);
    }

    // Prepara a consulta SQL para evitar injeção de SQL
    // $stmt = $conexao->prepare("SELECT valor FROM evidencias_tipos_de_identificadores WHERE id_evidencia = ? AND id_tipo_de_identificador = ?");
    $stmt = $conexao->prepare("SELECT valor, tabela_externa, nome_campo_do_nome_externo, nome_campo_da_chave_primaria_externa FROM evidencias_tipos_de_identificadores, tipos_de_identificadores WHERE id_evidencia = ? AND id_tipo_de_identificador = ? and id_chave_tipo_de_identificador = ?");

    // Vincula o parâmetro à consulta preparada
    $stmt->bind_param("iii", $id_evidencia, $id_tipo_identificador, $id_tipo_identificador);

    // Executa a consulta
    $stmt->execute();

    // Obtém o resultado da consulta
    $resultado = $stmt->get_result();

    // Verifica se algum resultado foi encontrado
    if ($resultado->num_rows > 0) {
        // Obtém o valor
        $row = $resultado->fetch_assoc();
        $valor = $row["valor"];
        $tabela_externa = $row["tabela_externa"];
        $nome_campo_do_nome_externo = $row["nome_campo_do_nome_externo"];
        $nome_campo_da_chave_primaria_externa = $row["nome_campo_da_chave_primaria_externa"];
    } else {
        $valor = "";
    }

    // Fecha o statement e a conexão
    $stmt->close();
    $conexao->close();
    // Retorna o valor
    return $valor;
}


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
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$id_evidencia = $_POST['id_evidencia'];
}
	
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$id_evidencia = $_GET['id_evidencia'];
}



if (empty($id_evidencia)) {
    echo "ID da evidência é necessário.";
    exit;
}

// Busca o id_token_tipo_de_evidencia na tabela evidencias
$queryEvidencias = "SELECT id_token_tipo_de_evidencia, id_token_tipo_de_veiculo FROM evidencias WHERE id_chave_evidencia = :id_evidencia";
$stmtEvidencias = $conn->prepare($queryEvidencias);
$stmtEvidencias->execute(['id_evidencia' => $id_evidencia]);
//$id_token_tipo_de_evidencia = $stmtEvidencias->fetchColumn();

$row = $stmtEvidencias->fetch(PDO::FETCH_ASSOC);
$id_token_tipo_de_evidencia = $row['id_token_tipo_de_evidencia'];
$id_token_tipo_de_veiculo = $row['id_token_tipo_de_veiculo'];

// Busca o id_grupo_de_token na tabela tokens
$queryTokens = "SELECT id_grupo_de_token FROM duplos_tokens_para_grupos_de_tokens WHERE id_token_evidencia = :id_token_tipo_de_evidencia AND id_token_veiculo = :id_token_tipo_de_veiculo";
$stmtTokens = $conn->prepare($queryTokens);
$stmtTokens->execute(['id_token_tipo_de_evidencia' => $id_token_tipo_de_evidencia, 'id_token_tipo_de_veiculo' => $id_token_tipo_de_veiculo]);
$id_grupo_de_token = $stmtTokens->fetchColumn();

// Busca os tipos de identificadores
// cuidado com regexp em MySQL porque é palavra reservada
$queryIdentificadores = "SELECT t.id_chave_tipo_de_identificador, t.nome_tipo_de_identificador,requerido, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo, t.id_tipo_de_validacao_regexp  as id_tipo_de_validacao_regexp, tvr.regexp tvrregexp, ordem_exposicao, exemplo_de_preenchimento                          FROM grupos_vs_identificadores g                          INNER JOIN tipos_de_identificadores t ON g.id_tipo_de_identificador = t.id_chave_tipo_de_identificador left join tipos_de_validacoes_regexp as tvr on id_tipo_de_validacao_regexp = id_chave_tipo_de_validacao_regexp                         WHERE g.id_grupo_de_token = :id_grupo_de_token ORDER BY ordem_exposicao;";

//$queryIdentificadores = "SELECT t.id_chave_tipo_de_identificador, t.nome_tipo_de_identificador,requerido, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo, t.id_tipo_de_validacao_regexp  as id_tipo_de_validacao_regexp
//                         FROM grupos_vs_identificadores g
//                         INNER JOIN tipos_de_identificadores t ON g.id_tipo_de_identificador = t.id_chave_tipo_de_identificador
//                         WHERE g.id_grupo_de_token = :id_grupo_de_token ORDER BY tabela_externa DESC";

$stmtIdentificadores = $conn->prepare($queryIdentificadores);
$stmtIdentificadores->execute(['id_grupo_de_token' => $id_grupo_de_token]);
$tiposDeIdentificadores = $stmtIdentificadores->fetchAll(PDO::FETCH_ASSOC);

file_put_contents('debug_insere_indicadores.txt', print_r($_SERVER, true), FILE_APPEND);

// Processamento do formulário
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    file_put_contents("debug_insere_indicadores.txt","Entrou no POST", FILE_APPEND);
    file_put_contents("debug_insere_indicadores.txt",print_r($_POST, true), FILE_APPEND);
    foreach ($tiposDeIdentificadores as $tipo) {
	if ($tipo['tabela_externa'] == null) {
        	$valor = $_POST['valor_' . $tipo['id_chave_tipo_de_identificador']];
	} else {
		$valor = $_POST['id_' . $tipo['id_chave_tipo_de_identificador']];
	}
	if (strlen($valor) > 0) {	
        $insertQuery = "INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE valor = VALUES(valor)";
        $insertStmt = $conn->prepare($insertQuery);
        $insertStmt->execute([$tipo['nome_tipo_de_identificador']."_".$id_evidencia, $tipo['id_chave_tipo_de_identificador'], $id_evidencia, $valor]);
	}
    }
    header('Location: inseridencia.php');
    echo "Dados inseridos com sucesso!";
    exit;
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Formulário de Identificadores</title>
</head>
<body>
    <form id="form_de_identificadores" action="insere_indicadores_para_uma_evidencia_required.php" method="post" class="clearfix container_identificadores">
            <?php foreach ($tiposDeIdentificadores as $tipo): ?>
		<?php file_put_contents("log_verifica_bug_insere_indicadores.txt",implode(", ",$tipo)."\n",FILE_APPEND);?>
                <?php if (!is_null($tipo["tabela_externa"])): ?>
                    <?php file_put_contents("log_verifica_bug_insere_indicadores.txt","\tTABELA EXTERNA: ".$tipo["tabela_externa"]."\n",FILE_APPEND);?>
                    <?php file_put_contents("log_verifica_bug_insere_indicadores.txt","\tNOME CAMPO DO NOME EXTERNO: ".$tipo["nome_campo_do_nome_externo"]."\n",FILE_APPEND);?>
                    <?php file_put_contents("log_verifica_bug_insere_indicadores.txt","\tNOME CAMPO DA CHAVE EXTERNA: ".$tipo["nome_campo_da_chave_primaria_externa"]."\n",FILE_APPEND);?>
                    <?php file_put_contents("log_verifica_bug_insere_indicadores.txt","\tid_chave_tipo_de_identificador: ".$tipo["id_chave_tipo_de_identificador"]."\n",FILE_APPEND);?>
                    <div id='drop_<?= $tipo['id_chave_tipo_de_identificador']; ?>' class='dropdown-wrapper campo' data-sql='SELECT  <?= $tipo["nome_campo_do_nome_externo"] ?> as nome_tipo,<?= $tipo["nome_campo_da_chave_primaria_externa"] ?> as id_token FROM <?= $tipo["tabela_externa"] ?> WHERE <?= $tipo["nome_campo_do_nome_externo"] ?> LIKE ? ORDER BY  <?= $tipo["nome_campo_do_nome_externo"] ?> LIMIT 100;'>
                <label for="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>">
                    <?= $tipo['nome_tipo_de_identificador']; ?>
                </label>

		<input id='input_<?= $tipo['id_chave_tipo_de_identificador']?>' type='text' class='search-input' autocomplete='off' name='valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>' placeholder='Digite para buscar...' data-tabela='evidencias_tipos_de_identificadores' data-campo='valor' data-tabela-externa='<?= $tipo["tabela_externa"] ?>' data-campo-nome-externo='<?= $tipo["nome_campo_do_nome_externo"] ?>' data-id-externo='<?= $tipo['nome_campo_da_chave_primaria_externa']?>' data-companion-id='id_identificador_<?= $tipo['id_chave_tipo_de_identificador']?>' data-companion-results='results_<?= $tipo['id_chave_tipo_de_identificador']?>' 
 <?= (strlen(consultaEvidencia_externa($id_evidencia, $tipo['id_chave_tipo_de_identificador'], "externa")) > 0) ? "data-default='".consultaEvidencia_externa($id_evidencia, $tipo['id_chave_tipo_de_identificador'], "externa")."'" : "" ?> value='<?= consultaEvidencia_externa($id_evidencia, $tipo['id_chave_tipo_de_identificador'], "externa");?>' <?= (strlen(consultaEvidencia_externa($id_evidencia, $tipo['id_chave_tipo_de_identificador'], "externa")) > 0) ? "data-selecionou='sim'" : "" ?> >
                        <input id='id_evidencia' type='hidden' name='id_evidencia' value='<?= $id_evidencia ?>'>
                        <input id='id_identificador_<?= $tipo['id_chave_tipo_de_identificador']?>' type='hidden' name='id_<?= $tipo['id_chave_tipo_de_identificador']; ?>' value='<?= consultaEvidencia_externa($id_evidencia, $tipo['id_chave_tipo_de_identificador'], "interna");?>'>
                    	<div id='results_<?= $tipo['id_chave_tipo_de_identificador']?>' class='results' tabindex='-1' ></div>
                    </div>
                <?php else: ?>
		<div class='campo' id='div_campo_<?= $tipo['id_chave_tipo_de_identificador']; ?>'>
                <label for="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>">
                    <?= $tipo['nome_tipo_de_identificador']; ?>
                </label>
                    <input type="text" 
                           name="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>" 
                           id="valor_<?= $tipo['id_chave_tipo_de_identificador']; ?>"
                           class="<?= $tipo['requerido'] ? 'required-field' : ''; ?>"
                           <?= $tipo['requerido'] ? 'required' : ''; ?>
		 	   value='<?= consultaEvidencia_externa($id_evidencia, $tipo['id_chave_tipo_de_identificador'],"interna");?>'	
			   data-teste='<?= 'sera_'.$tipo['id_tipo_de_validacao_regexp']?>'
			   <?php if (!is_null($tipo['id_tipo_de_validacao_regexp'])): ?>
			   oninput='validarInputInline(this, "<?= "/".addslashes($tipo['tvrregexp'])."/" ?>", "Acerte o preenchimento do campo <?= $tipo['nome_tipo_de_identificador'] ?>")'
			   placeholder='<?= $tipo["exemplo_de_preenchimento"] ?>'
			   <?php endif; ?>
		    >
		</div>
                <?php endif; ?>
            <?php endforeach; ?>
        <button type="submit">Enviar</button>
    </form>
</body>
</html>

