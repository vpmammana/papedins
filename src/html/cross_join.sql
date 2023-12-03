SELECT
    @id:=gdt.id_chave_grupo_de_token AS id_grupo_de_token,
    CONCAT('<', gdt.acentuada, '>') AS primeira_coluna,
    CONCAT('<', tokens_colchetes.nome_token, '>') AS elemento_colchetes,
    CONCAT('<', tokens_chaves.nome_token, '>') AS elemento_chaves
FROM
    grupos_de_tokens AS gdt
CROSS JOIN
    (SELECT t.nome_token
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     WHERE t.id_grupo_de_token = @id
     GROUP BY t.nome_token) AS tokens_colchetes
CROSS JOIN
    (SELECT t.nome_token
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     WHERE t.id_grupo_de_token = @id
     GROUP BY t.nome_token) AS tokens_chaves
GROUP BY
    gdt.acentuada, tokens_colchetes.nome_token, tokens_chaves.nome_token
ORDER BY
    gdt.acentuada, tokens_colchetes.nome_token, tokens_chaves.nome_token;

