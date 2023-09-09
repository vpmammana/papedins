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
call insere_a_direita_dos_filhos('capa_da_tese', 'titulo_da_tese', 'FUNDACENTRO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titulo'));
call insere_a_direita_dos_filhos('corpo_tese', 'descricao_presidencia', 'Presidência da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'foto_presidente', 'PedroTourinho2.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'Gabinete', 'Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-11_08:44:25.789269', 'Gabinete da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-12_09:04:50.545', 'Victor.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-12_08:31:56.338', 'Serviço de Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-12_08:32:08.605113', 'Serviço de Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-12_08:32:35.925', 'Setor de Apoio à Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-12_08:33:06.462247', 'Setor de Apoio à Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_08:31:37.157', 'Auditoria Interna', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-11_08:44:49.797060', 'Auditoria Interna da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_08:32:37.321', 'Procuradoria Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-11_08:45:21.502454', 'Procuradoria Federal junto à Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_08:36:39.137', 'Corregedoria', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-11_08:45:49.624017', 'Corregedoria da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-12_08:14:22.042', 'Coordenação Geral de Gestão Corporativa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:16:06.548282', 'Coordenação Geral de Gestão Corporativa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:20:07.146', 'Setor de Apoio à CGGC I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:07.146', 'auto_2023-05-12_08:20:18.504105', 'Setor de Apoio à CGGC I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:20:39.070', 'Setor de Apoio à CGGC II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:39.070', 'auto_2023-05-12_08:21:19.725645', 'Setor de Apoio à CGGC II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:22:23.236', 'Serviço de Administração de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-12_08:22:35.462795', 'Serviço de Administração de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:28:08.921', 'Serviço de Desenvolvimento de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-12_08:28:20.408105', 'Serviço de Desenvolvimento de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:16:44.629', 'Coordenação de Planejamento Estratégico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-12_08:17:37.721085', 'Coordenação de Planejamento Estratégico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:17:03.325', 'Coordenação de Gestão de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-12_08:18:14.109130', 'Coordenação de Gestão de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-12_08:30:02.557', 'Coordenação de Inovação e Parcerias', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-12_08:30:21.529887', 'Coordenação de Inovação e Parcerias', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_08:37:49.478', 'Diretoria de Conhecimento e Tecnologia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_08:46:38.620964', 'Diretoria de Conhecimento e Tecnologia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_09:28:18.162', 'Setor de Apoio à DCT', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:28:18.162', 'auto_2023-05-11_09:28:51.626056', 'Setor de Apoio à DCT', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_09:29:54.725', 'Coordenação de Difusão do Conhecimento e Educação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_09:30:22.644365', 'Coordenação de Difusão do Conhecimento e Educação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_09:41:21.884', 'Serviço de Biblioteca e Documentação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:41:21.884', 'auto_2023-05-11_09:41:42.631299', 'Serviço de Biblioteca e Documentação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_10:27:30.123', 'Serviço de Cursos e Eventos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:27:30.123', 'auto_2023-05-11_10:27:41.316067', 'Serviço de Cursos e Eventos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_10:28:33.974', 'Serviço de Publicação e RBSO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:28:33.974', 'auto_2023-05-11_10:28:55.135526', 'Serviço de Publicação e RBSO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_10:29:32.038', 'Coordenação de Tecnologia da Informação e Comunicação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-11_10:30:06.343191', 'Coordenação de Tecnologia da Informação e Comunicação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-11_10:30:49.526', 'Serviço de Tecnologia Infraestrutura e Operações', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:30:49.526', 'auto_2023-05-11_10:31:07.310350', 'Serviço de Tecnologia Infraestrutura e Operações', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-11_10:31:42.968', 'Serviço de Tecnologia Desenvolvimento e Negócios', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:31:42.968', 'auto_2023-05-11_10:32:05.287225', 'Serviço de Tecnologia Desenvolvimento e Negócios', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_09:31:16.427', 'Diretoria de Administração e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_09:32:33.985667', 'Diretoria de Administração e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:35:34.395', 'Setor de Apoio À DAF I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:35:34.395', 'auto_2023-05-11_10:35:54.635837', 'Setor de Apoio à DAF I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:36:24.385', 'Setor de Apoio à DAF II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:36:24.385', 'auto_2023-05-11_10:37:34.282563', 'Setor de Apoio à DAF II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:37:59.577', 'Setor de Apoio à DAF III', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:37:59.577', 'auto_2023-05-11_10:38:11.859535', 'Setor de Apoio à DAF III', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:41:42.153', 'Coordenação de Administração', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:41:42.153', 'auto_2023-05-11_10:44:27.861131', 'Coordenação de Administração', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:44:56.255', 'Coordenação de Orçamento e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-11_10:46:19.486501', 'Coordenação de Orçamento e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-11_10:47:26.477', 'Serviço de Execução Orçamentária e Financeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:47:26.477', 'auto_2023-05-11_10:48:04.325605', 'Serviço de Execução Orçamentária e Financeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-11_10:48:45.584', 'Serviço de Contabilidade', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:48:45.584', 'auto_2023-05-11_10:48:58.434543', 'Serviço de Contabilidade', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_09:33:05.510', 'Diretoria de Pesquisa Aplicada', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-11_09:33:20.606661', 'Diretoria de Administração e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-12_09:07:59.518', 'Rogerio.jpeg', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-11_10:53:16.333', 'Coordenação de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_10:53:33.810567', 'Coordenação de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_10:55:53.700', 'Serviço de Laboratório de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:55:53.700', 'auto_2023-05-11_10:56:14.406875', 'Serviço de Laboratório de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_10:59:42.229', 'Serviço de Laboratório de EPI', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:59:42.229', 'auto_2023-05-11_10:59:55.891797', 'Serviço de Laboratório de EPI', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_11:00:36.666', 'Serviço de Epidemiologia e Estatística', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_11:00:36.666', 'auto_2023-05-11_11:01:18.408616', 'Serviço de Epidemiologia e Estatística', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-11_10:53:54.204', 'Coordenação Geral de Projetos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:54.204', 'auto_2023-05-11_10:54:09.590590', 'Coordenação Geral de Projetos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:54.204', 'auto_2023-05-11_10:54:45.232', 'Serviço de Apoio Técnico e Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:54:45.232', 'auto_2023-05-11_10:55:11.008468', 'Serviço de Apoio Técnico e Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'lixeira', 'Lixeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'topico'));

INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
