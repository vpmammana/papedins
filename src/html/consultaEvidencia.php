function consultaEvidencia($id_evidencia) {
global $nome_imagem_padrao;

    // Inclui o arquivo com as credenciais do banco de dados
    include "identifica.php.cripto";

    // Cria a conexão com o banco de dados
    $conexao = new mysqli("localhost", $username, $pass, $nome_base_dados);

    // Verifica se a conexão foi bem-sucedida
    if ($conexao->connect_error) {
        die("Falha na conexão: " . $conexao->connect_error);
    }

    // Prepara a consulta SQL para evitar injeção de SQL
    $stmt = $conexao->prepare("SELECT valor FROM evidencias_tipos_de_identificadores 
                               WHERE id_evidencia = ? AND id_tipo_de_identificador = 
                               (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores 
                                WHERE nome_tipo_de_identificador = 'FILE')");

    // Vincula o parâmetro à consulta preparada
    $stmt->bind_param("i", $id_evidencia);

    // Executa a consulta
    $stmt->execute();

    // Obtém o resultado da consulta
    $resultado = $stmt->get_result();

    // Verifica se algum resultado foi encontrado
    if ($resultado->num_rows > 0) {
        // Obtém o valor
        $row = $resultado->fetch_assoc();
        $valor = $row["valor"];
    } else {
        $valor = $nome_imagem_padrao;
    }

    // Fecha o statement e a conexão
    $stmt->close();
    $conexao->close();
    $valor = str_replace("/var/www/html/dev_vitor/papedins/", "../../", $valor);
    // Retorna o valor
    return $valor;
}
