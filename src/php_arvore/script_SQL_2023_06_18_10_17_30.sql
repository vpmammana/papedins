# SCRIPT que permite gerar novamente a dissertacao. Nao grava a sequencia de versoes geradas)
# Desenvolvido por Victor Mammana
# Este script nao recria as stored procedures, que estao em tese.sql



start transaction;
delete from guarda_ids_da_lixeira;
delete from ids_de_referencia;
delete from versoes;
delete from secoes;
insert into secoes values (1,'corpo_tese','raiz','',1,2, (SELECT id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao='raiz'));

call insere_a_direita_dos_filhos('corpo_tese', 'presidencia', 'Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('presidencia', 'descricao_presidencia', 'Presidência da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('presidencia', 'Gabinete', 'Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('corpo_tese', 'lixeira', 'Lixeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));


INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
