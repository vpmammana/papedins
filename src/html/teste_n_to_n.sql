# +--------------------------------------------+--------------+------+-----+----------------------+--------------------------------+
# | Field                                      | Type         | Null | Key | Default              | Extra                          |
# +--------------------------------------------+--------------+------+-----+----------------------+--------------------------------+
# | id_chave_grupo_vs_tipo_de_evidencia_n_to_n | int(11)      | NO   | PRI | NULL                 | auto_increment                 |
# | nome_grupo_vs_tipo_de_evidencia_n_to_n     | varchar(200) | YES  | UNI | NULL                 |                                |
# | nome_grupo_de_token                        | varchar(200) | YES  | MUL | NULL                 |                                |
# | id_grupo_de_token                          | int(11)      | YES  | MUL | NULL                 |                                |
# | nome_tipo_de_evidencia                     | varchar(200) | YES  | MUL | NULL                 |                                |
# | id_tipo_de_evidencia                       | int(11)      | YES  | MUL | NULL                 |                                |
# | time_stamp                                 | timestamp(6) | NO   |     | current_timestamp(6) | on update current_timestamp(6) |
# +--------------------------------------------+--------------+------+-----+----------------------+--------------------------------+

# MariaDB [papedins_db]> desc tipos_de_evidencias;
# +----------------------------+--------------+------+-----+----------------------+--------------------------------+
# | Field                      | Type         | Null | Key | Default              | Extra                          |
# +----------------------------+--------------+------+-----+----------------------+--------------------------------+
# | id_chave_tipo_de_evidencia | int(11)      | NO   | PRI | NULL                 | auto_increment                 |
# | nome_tipo_de_evidencia     | varchar(200) | YES  | UNI | NULL                 |                                |
# | descricao                  | varchar(500) | YES  |     | NULL                 |                                |
# | id_token                   | int(11)      | YES  | UNI | NULL                 |                                |
# | time_stamp                 | timestamp(6) | NO   |     | current_timestamp(6) | on update current_timestamp(6) |
# +----------------------------+--------------+------+-----+----------------------+--------------------------------+

SELECT
    CONCAT('<',gdt.acentuada,'>') AS primeira_coluna,
    (SELECT CONCAT('[', GROUP_CONCAT(DISTINCT CONCAT('{',t.nome_token,'}') ORDER BY t.nome_token SEPARATOR ''), ']')
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     JOIN grupos_vs_tipos_de_evidencias_n_to_n AS gvtd ON te.id_chave_tipo_de_evidencia = gvtd.id_tipo_de_evidencia
     JOIN grupos_de_tokens AS gdt2 ON gvtd.id_grupo_de_token = gdt2.id_chave_grupo_de_token 
     WHERE  gdt2.id_chave_grupo_de_token = gdt.id_chave_grupo_de_token) AS segunda_coluna,
    (SELECT  CONCAT('[',  GROUP_CONCAT(DISTINCT CONCAT('{' ,t.nome_token,'}')  ORDER BY t.nome_token SEPARATOR ''),  ']')
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     JOIN grupos_vs_tipos_de_veiculos_n_to_n AS gvtd ON tv.id_chave_tipo_de_veiculo = gvtd.id_tipo_de_veiculo
     JOIN grupos_de_tokens AS gdt3 ON gvtd.id_grupo_de_token = gdt3.id_chave_grupo_de_token 
     WHERE  gdt3.id_chave_grupo_de_token = gdt.id_chave_grupo_de_token) AS terceira_coluna
FROM
    grupos_de_tokens AS gdt
GROUP BY
    gdt.acentuada
ORDER BY
    gdt.acentuada;

