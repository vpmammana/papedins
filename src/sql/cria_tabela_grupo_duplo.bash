echo " 
DROP TABLE IF EXISTS duplos_tokens_para_grupos_de_tokens;

CREATE TABLE duplos_tokens_para_grupos_de_tokens ( # tabela que relaciona uma dupla de tokens (evidencia, veiculo) com cada grupo de tokens
        id_chave_duplo_token_para_grupo_de_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome_duplo_token_para_grupo_de_token varchar(200),
        id_grupo_de_token int, 
        id_token_evidencia int,
        id_token_veiculo int,
        time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        unique(nome_duplo_token_para_grupo_de_token),
	unique(id_grupo_de_token, id_token_evidencia, id_token_veiculo),
        FOREIGN KEY (id_grupo_de_token) REFERENCES grupos_de_tokens(id_chave_grupo_de_token), 
        FOREIGN KEY (id_token_evidencia) REFERENCES tokens(id_chave_token),
        FOREIGN KEY (id_token_veiculo) REFERENCES tokens(id_chave_token)
);
" > cria_tabela_grupo_duplo.sql




mysql -u root -ptoninho13 papedins_db -t -N -e "
SELECT
    CONCAT('<', gdt.acentuada, '>') AS primeira_coluna,
    sub_colchetes.elemento_colchetes,
    sub_chaves.elemento_chaves
FROM
    grupos_de_tokens AS gdt
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token as id_grupo_de_token,
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
" | grep -v  "\-\-" | awk '{print "# " $0;}' 


mysql -u root -ptoninho13 papedins_db -t -N -e "
SELECT
    CONCAT('<', gdt.nome_grupo_de_token, '>') AS primeira_coluna,
    CONCAT('', gdt.id_chave_grupo_de_token, '') AS primeira_coluna_B,
    sub_colchetes.elemento_colchetes,
    sub_colchetes.id_token_evidencia,
    sub_chaves.elemento_chaves,
    sub_chaves.id_token_veiculo
FROM
    grupos_de_tokens AS gdt
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token as id_grupo_de_token_evidencia,
	 t.id_chave_token as id_token_evidencia,
         CONCAT('[', t.nome_token, ']') AS elemento_colchetes
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     GROUP BY t.id_grupo_de_token, t.nome_token) AS sub_colchetes ON gdt.id_chave_grupo_de_token = sub_colchetes.id_grupo_de_token_evidencia
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token as id_grupo_de_token_veiculo,
	 t.id_chave_token as id_token_veiculo,
         CONCAT('{', t.nome_token, '}') AS elemento_chaves
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     GROUP BY t.id_grupo_de_token, t.nome_token) AS sub_chaves ON gdt.id_chave_grupo_de_token = sub_chaves.id_grupo_de_token_veiculo
WHERE
    sub_colchetes.elemento_colchetes IS NOT NULL AND sub_chaves.elemento_chaves IS NOT NULL
GROUP BY
    gdt.acentuada, sub_colchetes.elemento_colchetes, sub_chaves.elemento_chaves
ORDER BY
    gdt.acentuada, sub_colchetes.elemento_colchetes, sub_chaves.elemento_chaves;
" | grep -v  "\-\-" 

mysql -u root -ptoninho13 papedins_db -t -N -e "
SELECT
    CONCAT('<', gdt.nome_grupo_de_token, '>') AS primeira_coluna,
    CONCAT('', gdt.id_chave_grupo_de_token, '') AS primeira_coluna_B,
    sub_colchetes.elemento_colchetes,
    sub_colchetes.id_token_evidencia,
    sub_chaves.elemento_chaves,
    sub_chaves.id_token_veiculo
FROM
    grupos_de_tokens AS gdt
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token as id_grupo_de_token_evidencia,
	 t.id_chave_token as id_token_evidencia,
         CONCAT('[', t.nome_token, ']') AS elemento_colchetes
     FROM tokens AS t
     JOIN tipos_de_evidencias AS te ON t.id_chave_token = te.id_token
     GROUP BY t.id_grupo_de_token, t.nome_token) AS sub_colchetes ON gdt.id_chave_grupo_de_token = sub_colchetes.id_grupo_de_token_evidencia
LEFT JOIN
    (SELECT 
         t.id_grupo_de_token as id_grupo_de_token_veiculo,
	 t.id_chave_token as id_token_veiculo,
         CONCAT('{', t.nome_token, '}') AS elemento_chaves
     FROM tokens AS t
     JOIN tipos_de_veiculos AS tv ON t.id_chave_token = tv.id_token
     GROUP BY t.id_grupo_de_token, t.nome_token) AS sub_chaves ON gdt.id_chave_grupo_de_token = sub_chaves.id_grupo_de_token_veiculo
WHERE
    sub_colchetes.elemento_colchetes IS NOT NULL AND sub_chaves.elemento_chaves IS NOT NULL
GROUP BY
    gdt.acentuada, sub_colchetes.elemento_colchetes, sub_chaves.elemento_chaves
ORDER BY
    gdt.acentuada, sub_colchetes.elemento_colchetes, sub_chaves.elemento_chaves;
" | grep -v  "\-\-" | awk 'BEGIN{FS="|"}{gsub(/ /,"",$2); gsub(/ /,"", $4); gsub(/ /,"",$6); print "INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES (\""$2 $4 $6"\","$3","$5","$7");";  }' >> cria_tabela_grupo_duplo.sql


mysql -u root -ptoninho13 papedins_db < cria_tabela_grupo_duplo.sql
