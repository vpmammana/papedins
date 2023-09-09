# SCRIPT que permite gerar novamente a dissertacao. Nao grava a sequencia de versoes geradas)
# Desenvolvido por Victor Mammana
# Este script nao recria as stored procedures, que estao em tese.sql



start transaction;
#delete from guarda_ids_da_lixeira;
delete from ids_de_referencia;
delete from versoes;
delete from secoes;
insert into secoes values (1,'corpo_tese','raiz','',1,2, (SELECT id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao='raiz'));

call insere_a_direita_dos_filhos('corpo_tese', 'descricao_das_sentencas', 'A lista abaixo traz todas as estruturas de sentenças para avaliação de atividades da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'sentenca_1', '1', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('sentencao_1', 'descricao_sentenca_1', 'Sentença sem sujeito, que denota ação no infinitivo sobre objeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_1', 'verbo_sentenca_1', '1', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'verbo_flexao_definida'));
call insere_a_direita_dos_filhos('corpo_tese', 'sentenca_2', '2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('sentenca_2', 'descricao', 'Sentença com sujeito, verbo e objeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('sentenca_2', 'substantivo_sentenca_2', '2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'substantivo_flexao_definida'));
call insere_a_direita_dos_filhos('corpo_tese', 'lixeira', (select id_chave_tipo_elemento_sintatico from tipos_elementos_sintaticos where nome_tipo_elemento_sintatico= 'Lixeira'), '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-15_10:32:51.391', 'f593e444-b2e4-456b-a94c-efd8413ab3f9.jpeg', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-18_08:30:36.455_copia_922', 'Preencher
', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));


INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
