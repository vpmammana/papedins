SELECT
    CONCAT('<', gdt.acentuada, '>') AS primeira_coluna,
    sub_colchetes.elemento_colchetes,
    sub_chaves.elemento_chaves
FROM
    grupos_de_tokens AS gdt
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token,
         CONCAT('[', t.nome_token, ']') AS elemento_colchetes
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     GROUP BY t.id_grupo_de_token, t.nome_token) AS sub_colchetes ON gdt.id_chave_grupo_de_token = sub_colchetes.id_grupo_de_token
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token,
         CONCAT('{', t.nome_token, '}') AS elemento_chaves
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     GROUP BY t.id_grupo_de_token, t.nome_token) AS sub_chaves ON gdt.id_chave_grupo_de_token = sub_chaves.id_grupo_de_token
WHERE
    sub_colchetes.elemento_colchetes IS NOT NULL AND sub_chaves.elemento_chaves IS NOT NULL
GROUP BY
    gdt.acentuada, sub_colchetes.elemento_colchetes, sub_chaves.elemento_chaves
ORDER BY
    gdt.acentuada, sub_colchetes.elemento_colchetes, sub_chaves.elemento_chaves;

