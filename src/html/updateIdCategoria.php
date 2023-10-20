function updateIdCategoria($ordem, $id_tipo_sintatico, $pdo) {

global $array_categorias;
global $nome_arquivo_script;

    // Primeiro, obtenha todos os id_chave_frase com base no id_tipo_elemento_sintatico fornecido
    $query = "SELECT id_chave_frase, id_tipo_elemento_sintatico FROM frases WHERE id_tipo_elemento_sintatico = :id_tipo_sintatico";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id_tipo_sintatico', $id_tipo_sintatico, PDO::PARAM_INT);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($rows) {
        $totalUpdated = 0;

        foreach ($rows as $row) {
            $id_frase = $row['id_chave_frase'];
            $id_tipo_elemento_sintatico = $row['id_tipo_elemento_sintatico'];

            // Faça o update na tabela tokens_nas_frases para cada id_frase
            $queryUpdate = "UPDATE tokens_nas_frases SET id_categoria = :id_categoria WHERE ordem = :ordem AND id_frase = :id_frase";
            $stmtUpdate = $pdo->prepare($queryUpdate);
            $stmtUpdate->bindParam(':id_categoria', $array_categoria[$id_tipo_elemento_sintatico][$ordem], PDO::PARAM_INT);
            $stmtUpdate->bindParam(':ordem', $ordem, PDO::PARAM_INT);
            $stmtUpdate->bindParam(':id_frase', $id_frase, PDO::PARAM_INT);
            $stmtUpdate->execute();
            $totalUpdated += $stmtUpdate->rowCount();
        }

       put_file_content($nome_arquivo_script, "// Total de registros atualizados: " . $totalUpdated."\n", FILE_APPEND);

    } else {
        echo "Nenhum id_chave_frase encontrado com o id_tipo_elemento_sintatico fornecido.";
    }
}
