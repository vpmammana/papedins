INSERT INTO versoes (id_secao, trecho) VALUES (17,  IFNULL((select id_chave_tipo_flexao from tipos_flexoes where nome_tipo_flexao= 'passado'), 'passado') );
