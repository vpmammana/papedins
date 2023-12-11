<?php
// Conexão com o banco de dados
include "identifica.php.cripto";

$host = "localhost";
$password = $pass; 
$dbname = $nome_base_dados; 



$pdo = new PDO('mysql:host='.$host.';dbname='.$nome_base_dados, $username ,$password);

// Abrir arquivo para escrita
$file = fopen("script_update_valido.sql", "w");
fwrite($file, "# Arquivo criado automaticamente por updateValido.php\n\n");
// Selecionar todos os registros da tabela
$sql = "SELECT id_chave_duplo_token_para_grupo_de_token, nome_duplo_token_para_grupo_de_token as nome, valido FROM duplos_tokens_para_grupos_de_tokens";
foreach ($pdo->query($sql) as $row) {
    // Aqui você define a lógica para determinar o novo valor de 'valido'
    // Por exemplo, vamos assumir que você deseja definir todos como 'sim'
    $novoValido = $row["valido"];

    // Criar comando UPDATE
    $updateCommand = "UPDATE duplos_tokens_para_grupos_de_tokens SET valido = '$novoValido' WHERE id_chave_duplo_token_para_grupo_de_token = (SELECT id_chave_duplo_token_para_grupo_de_token from duplos_tokens_para_grupos_de_tokens where nome_duplo_token_para_grupo_de_token = '{$row['nome']}');\n";

    // Escrever comando no arquivo
    fwrite($file, $updateCommand);
}

fclose($file);

echo "Script de atualização criado com sucesso.";
?>

