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
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-12_18:56:38.352', 'Exemplo: "publicar trabalho científico em revista indexada"', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-13_12:30:58.119', '10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo_flexao_definida'));
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-09_19:51:40.850', '10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-09-09_19:51:40.850', 'auto_2023-09-09_19:52:19.499539', 'Exemplo: "Organizar reunião científica em território nacional"', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_1', 'verbo_sentenca_1', '14', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'verbo_flexao_definida'));
call insere_a_direita_dos_filhos('sentenca_1', 'auto_2023-09-13_12:30:34.486', '14', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'verbo_flexao_definida'));
call insere_a_direita_dos_filhos('corpo_tese', 'sentenca_2', '2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('sentenca_2', 'descricao', 'Sentença com sujeito, verbo e objeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_2', 'substantivo_sentenca_2', '2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo_flexao_definida'));
call insere_a_direita_dos_filhos('corpo_tese', 'lixeira', '12', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));


INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
