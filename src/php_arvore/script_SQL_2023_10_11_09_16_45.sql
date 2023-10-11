# SCRIPT que permite gerar novamente a dissertacao. Nao grava a sequencia de versoes geradas)
# Desenvolvido por Victor Mammana
# Este script nao recria as stored procedures, que estao em tese.sql



start transaction;
delete from guarda_ids_da_lixeira;
delete from ids_de_referencia;
delete from versoes;
delete from secoes;
insert into secoes values (1,'corpo_tese','raiz','',1,2, (SELECT id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao='raiz'));

call insere_a_direita_dos_filhos('corpo_tese', 'descricao_das_sentencas', 'A lista abaixo traz todas as estruturas de sentenças para avaliação de atividades da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'sentenca_1', '1', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-17_19:36:56.826', 'Sentença com predicado, objeto direto e objeto indireto.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-18_15:58:01.442', 'Exemplo: "Elaborar projeto completo para órgão fomentador"', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-17_10:14:49.595', '7', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-09-17_10:14:49.595', 'auto_2023-09-17_10:21:42.239665', 'Exemplo: "Publicar artigo científico em revista indexada"', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-09-17_10:14:49.595', 'auto_2023-09-17_19:35:31.913', '11', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'verbo_flexao_definida'));
call insere_a_direita_dos_filhos('auto_2023-09-17_10:14:49.595', 'auto_2023-09-17_19:39:17.835', '10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:39:17.835', 'auto_2023-09-17_19:42:40.326822', 'Exemplo: "um resumo estendido"', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:39:17.835', 'auto_2023-09-17_20:03:05.260', 'substantivo do objeto direto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:39:17.835', 'auto_2023-09-18_15:35:27.566', 'adjetivo do objeto direto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'adjetivo'));
call insere_a_direita_dos_filhos('auto_2023-09-17_10:14:49.595', 'auto_2023-09-17_19:42:24.007', '11', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:42:24.007', 'auto_2023-09-17_19:43:01.420619', 'Exemplo: "para um congresso científico"', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:42:24.007', 'auto_2023-09-18_15:46:42.999', 'preposição do objeto indireto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'preposicao'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:42:24.007', 'auto_2023-09-18_15:48:58.704', 'substantivo do objeto indireto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo'));
call insere_a_direita_dos_filhos('auto_2023-09-17_19:42:24.007', 'auto_2023-09-18_15:49:21.558', 'adjetivo do objeto indireto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'adjetivo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-09-26_17:04:34.201', '13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:04:45.116536', 'Expressão nominal, sem verbos, baseada numa substantivação da ação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:17:48.880', '8', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo_flexao_definida'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:29:31.463', 'preposição, mais frequentemente de', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'preposicao'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:30:08.108', 'substantivos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:33:29.989', 'adjetivo', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'adjetivo'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:30:47.028', 'preposição, mais frequentemente me', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'preposicao'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:31:21.171', 'substantivos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo'));
call insere_a_direita_dos_filhos('auto_2023-09-26_17:04:34.201', 'auto_2023-09-26_17:33:06.292', 'adjetivo', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'adjetivo'));
call insere_a_direita_dos_filhos('corpo_tese', 'lixeira', '12', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-09-18_15:48:29.633', 'artigo do objeto indireto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'artigo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-09-17_19:47:18.988', 'artigo do objeto direto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'artigo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-09-17_19:34:45.654', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));


INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
