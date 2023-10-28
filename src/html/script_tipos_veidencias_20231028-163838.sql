# script que preenche as tabelas tipos_de_evidencias e tipos_de_veiculos. Esse script é gerado a cada acesso à página arvore_de_tokens.php

start transaction;

delete from tipos_de_evidencias;

delete from tipos_de_veiculos;


INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('análise',(SELECT id_chave_token FROM tokens WHERE nome_token = 'análise'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('aplicativo',(SELECT id_chave_token FROM tokens WHERE nome_token = 'aplicativo'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('apostila',(SELECT id_chave_token FROM tokens WHERE nome_token = 'apostila'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('apostilamento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'apostilamento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('apresentação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'apresentação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('artigo',(SELECT id_chave_token FROM tokens WHERE nome_token = 'artigo'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('avaliação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'avaliação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('banca',(SELECT id_chave_token FROM tokens WHERE nome_token = 'banca'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('bibliografia',(SELECT id_chave_token FROM tokens WHERE nome_token = 'bibliografia'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('bolsista',(SELECT id_chave_token FROM tokens WHERE nome_token = 'bolsista'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('capítulo',(SELECT id_chave_token FROM tokens WHERE nome_token = 'capítulo'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('cartilha',(SELECT id_chave_token FROM tokens WHERE nome_token = 'cartilha'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('codificação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'codificação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('código',(SELECT id_chave_token FROM tokens WHERE nome_token = 'código'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('colaboração',(SELECT id_chave_token FROM tokens WHERE nome_token = 'colaboração'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('comissão',(SELECT id_chave_token FROM tokens WHERE nome_token = 'comissão'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('compra',(SELECT id_chave_token FROM tokens WHERE nome_token = 'compra'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('conferência', (SELECT id_chave_token FROM tokens WHERE nome_token ='conferência'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('congresso', (SELECT id_chave_token FROM tokens WHERE nome_token ='congresso'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('conselho',(SELECT id_chave_token FROM tokens WHERE nome_token = 'conselho'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('conteúdo',(SELECT id_chave_token FROM tokens WHERE nome_token = 'conteúdo'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('contratação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'contratação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('contrato',(SELECT id_chave_token FROM tokens WHERE nome_token = 'contrato'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('convenção', (SELECT id_chave_token FROM tokens WHERE nome_token ='convenção'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('correição',(SELECT id_chave_token FROM tokens WHERE nome_token = 'correição'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('credencial',(SELECT id_chave_token FROM tokens WHERE nome_token = 'credencial'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('credenciamento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'credenciamento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('curso',(SELECT id_chave_token FROM tokens WHERE nome_token = 'curso'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('dado',(SELECT id_chave_token FROM tokens WHERE nome_token = 'dado'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('debate',(SELECT id_chave_token FROM tokens WHERE nome_token = 'debate'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('demanda',(SELECT id_chave_token FROM tokens WHERE nome_token = 'demanda'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('desenvolvimento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'desenvolvimento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('diretriz',(SELECT id_chave_token FROM tokens WHERE nome_token = 'diretriz'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('disciplina',(SELECT id_chave_token FROM tokens WHERE nome_token = 'disciplina'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('doutorado',(SELECT id_chave_token FROM tokens WHERE nome_token = 'doutorado'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('EPI',(SELECT id_chave_token FROM tokens WHERE nome_token = 'EPI'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('equipamento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'equipamento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('especificação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'especificação'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('evento', (SELECT id_chave_token FROM tokens WHERE nome_token ='evento'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('extensão', (SELECT id_chave_token FROM tokens WHERE nome_token ='extensão'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('fomento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'fomento'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('fórum', (SELECT id_chave_token FROM tokens WHERE nome_token ='fórum'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('graduação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'graduação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('indexação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'indexação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('infraestrutura',(SELECT id_chave_token FROM tokens WHERE nome_token = 'infraestrutura'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('iniciação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'iniciação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('instrumento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'instrumento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('laboratório',(SELECT id_chave_token FROM tokens WHERE nome_token = 'laboratório'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('livro',(SELECT id_chave_token FROM tokens WHERE nome_token = 'livro'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('material',(SELECT id_chave_token FROM tokens WHERE nome_token = 'material'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('mestrado',(SELECT id_chave_token FROM tokens WHERE nome_token = 'mestrado'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('método',(SELECT id_chave_token FROM tokens WHERE nome_token = 'método'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('norma',(SELECT id_chave_token FROM tokens WHERE nome_token = 'norma'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('oficina', (SELECT id_chave_token FROM tokens WHERE nome_token ='oficina'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('palestra',(SELECT id_chave_token FROM tokens WHERE nome_token = 'palestra'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('parecer',(SELECT id_chave_token FROM tokens WHERE nome_token = 'parecer'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('peça',(SELECT id_chave_token FROM tokens WHERE nome_token = 'peça'));
INSERT INTO tipos_de_veiculos (nome_tipo_de_veiculo, id_token) VALUES ('periódico', (SELECT id_chave_token FROM tokens WHERE nome_token ='periódico'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('planejamento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'planejamento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('plano',(SELECT id_chave_token FROM tokens WHERE nome_token = 'plano'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('pós-graduação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'pós-graduação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('procedimento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'procedimento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('processamento',(SELECT id_chave_token FROM tokens WHERE nome_token = 'processamento'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('processo',(SELECT id_chave_token FROM tokens WHERE nome_token = 'processo'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('programa',(SELECT id_chave_token FROM tokens WHERE nome_token = 'programa'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('projeção',(SELECT id_chave_token FROM tokens WHERE nome_token = 'projeção'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('proposição',(SELECT id_chave_token FROM tokens WHERE nome_token = 'proposição'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('proposta',(SELECT id_chave_token FROM tokens WHERE nome_token = 'proposta'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('publicação',(SELECT id_chave_token FROM tokens WHERE nome_token = 'publicação'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('relato',(SELECT id_chave_token FROM tokens WHERE nome_token = 'relato'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('relatório',(SELECT id_chave_token FROM tokens WHERE nome_token = 'relatório'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('reunião',(SELECT id_chave_token FROM tokens WHERE nome_token = 'reunião'));
INSERT INTO tipos_de_evidencias (nome_tipo_de_evidencia, id_token) VALUES ('revisão',(SELECT id_chave_token FROM tokens WHERE nome_token = 'revisão'));
commit;