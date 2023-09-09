# SCRIPT que permite gerar novamente a dissertacao. Nao grava a sequencia de versoes geradas)
# Desenvolvido por Victor Mammana
# Este script nao recria as stored procedures, que estao em tese.sql



start transaction;
delete from guarda_ids_da_lixeira;
delete from ids_de_referencia;
delete from versoes;
delete from secoes;
insert into secoes values (1,'corpo_tese','raiz','',1,2, (SELECT id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao='raiz'));

call insere_a_direita_dos_filhos('corpo_tese', 'capa_da_tese', 'Capa da Tese', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'capa'));
call insere_a_direita_dos_filhos('capa_da_tese', 'titulo_da_tese', 'CARACTERIZAÇÃO DO PROGRAMA Workshop Aficionados por Software e Hardware (WASH)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titulo'));
call insere_a_direita_dos_filhos('capa_da_tese', 'sub_titulo_da_tese', 'HISTÓRIA, MÉTODOS E RESULTADOS', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sub_titulo'));
call insere_a_direita_dos_filhos('capa_da_tese', 'autor_da_tese', 'Elaine da Silva Tozzi', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'autor'));
call insere_a_direita_dos_filhos('capa_da_tese', 'autor_abreviatura', 'Tozzi, E.S.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'autor_abr'));
call insere_a_direita_dos_filhos('capa_da_tese', 'autor_ficha_catalografica', 'Tozzi, Elaine da Silva', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'autor_ficha'));
call insere_a_direita_dos_filhos('capa_da_tese', 'titulo_do_abstract', 'Characterization of the Hardware and Software for Geeks Program ', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titulo_abstract'));
call insere_a_direita_dos_filhos('capa_da_tese', 'orientador_da_tese', 'Paulo Sérgio Camargo', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'orientador'));
call insere_a_direita_dos_filhos('capa_da_tese', 'orientador_ficha_catalografica', 'Camargo, Paulo Sérgio', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'orientador_ficha'));
call insere_a_direita_dos_filhos('capa_da_tese', 'programa_de_pos_graduacao', 'Programa de Pós-Graduação da UTFPR', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'programa_pos'));
call insere_a_direita_dos_filhos('capa_da_tese', 'programa_de_pos_graduacao_maiusculas', 'PROGRAMA DE PÓS-GRADUAÇÃO DA UTFPR', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'programa_pos_maiuscula'));
call insere_a_direita_dos_filhos('capa_da_tese', 'curso_matriculado', 'Curso de Pós-Graduação em Licenciatura', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'curso'));
call insere_a_direita_dos_filhos('capa_da_tese', 'curso_matriculado_maiuscula', 'CURSO DE PÓS-GRADUAÇÃO EM LICENCIATURA', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'curso_maiuscula'));
call insere_a_direita_dos_filhos('capa_da_tese', 'indique_mestre_ou_doutor', 'Mestre', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'mestre_ou_doutor'));
call insere_a_direita_dos_filhos('capa_da_tese', 'titulo_da_pos_graduacao', 'Mestre em Licenciatura', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titulo_pos'));
call insere_a_direita_dos_filhos('capa_da_tese', 'nome_da_universidade', 'Universidade Tecnológica Federal do Paraná', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'universidade'));
call insere_a_direita_dos_filhos('capa_da_tese', 'nome_da_universidade_maiuscula', 'UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'universidade_maiuscula'));
call insere_a_direita_dos_filhos('capa_da_tese', 'nome_da_unidade', 'Faculdade de Educação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'unidade_faculdade'));
call insere_a_direita_dos_filhos('capa_da_tese', 'nome_da_unidade_maiuscula', 'FACULDADE DE EDUCAÇÃO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'unidade_faculdade_maiuscula'));
call insere_a_direita_dos_filhos('capa_da_tese', 'nome_da_localidade', 'Londrina', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'localidade'));
call insere_a_direita_dos_filhos('capa_da_tese', 'lista_palavras_chave', 'Papert, STEAM, STEM, WASH', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'palavras_chave'));
call insere_a_direita_dos_filhos('capa_da_tese', 'frase_epigrafe', 'Ciência é a compreensão que o outro constrói sobre o conhecimento de alguém.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'epigrafe'));
call insere_a_direita_dos_filhos('capa_da_tese', 'frase_dedicatoria', 'Dedico esta dissertação aos meus pais.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'dedicatoria'));
call insere_a_direita_dos_filhos('capa_da_tese', 'ano_de_defesa', '2022', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'ano'));
call insere_a_direita_dos_filhos('corpo_tese', 'agradecimento_da_tese', 'Agradecimentos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'agradecimento'));
call insere_a_direita_dos_filhos('agradecimento_da_tese', 'paragrafo_agradecimento_1', 'Gostaria de agradecer meus pais por tudo que me propiciaram.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_agradecimento'));
call insere_a_direita_dos_filhos('corpo_tese', 'resumo_da_tese', 'RESUMO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'resumo'));
call insere_a_direita_dos_filhos('resumo_da_tese', 'paragrafo_res_1', 'Neste trabalho o Programa Workshop de Aficcionados em Software e Hardware será caracterizado quanto à sua história, métodos e resultados.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_resumo'));
call insere_a_direita_dos_filhos('corpo_tese', 'presidencia', 'Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('presidencia', 'descricao_presidencia', 'Presidência da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('presidencia', 'Gabinete', 'Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:31:07.327', 'Gabinete da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:31:37.157', 'Auditoria Interna', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:32:22.134', 'Auditoria Interna da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:32:37.321', 'Procuradoria Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:32:51.679', 'Procuradoria Federal junto à Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:36:39.137', 'Corregedoria', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:36:49.866', 'Corregedoria da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('presidencia', 'auto_2023-05-11_08:37:49.478', 'Diretoria de Conhecimento e Tecnologia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_08:38:32.629002', 'Setor de Apoio à DCT', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));

call insere_a_direita_dos_filhos("corpo_tese", "lixeira", "Lixeira" , "",(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "topico"));

INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
