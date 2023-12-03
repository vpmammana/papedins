SELECT 
    CONCAT('<',gdt.acentuada,'>') AS primeira_coluna,
    (SELECT CONCAT('[', GROUP_CONCAT( CONCAT('<',t.nome_token,'>') ORDER BY t.nome_token SEPARATOR ''), ']')
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     WHERE t.id_grupo_de_token = gdt.id_chave_grupo_de_token) AS segunda_coluna,
    (SELECT  CONCAT('{',  GROUP_CONCAT( CONCAT('<' ,t.nome_token,'>')  ORDER BY t.nome_token SEPARATOR ''),  '}')
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     WHERE t.id_grupo_de_token = gdt.id_chave_grupo_de_token) AS terceira_coluna
FROM 
    grupos_de_tokens AS gdt
GROUP BY 
    gdt.acentuada
ORDER BY 
    gdt.acentuada;
