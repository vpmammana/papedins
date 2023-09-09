# SCRIPT que permite gerar novamente a dissertacao. Nao grava a sequencia de versoes geradas)
# Desenvolvido por Victor Mammana
# Este script nao recria as stored procedures, que estao em tese.sql



start transaction;
delete from guarda_ids_da_lixeira;
delete from ids_de_referencia;
delete from versoes;
delete from secoes;
insert into secoes values (1,'corpo_tese','raiz','',1,2, (SELECT id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao='raiz'));

call insere_a_direita_dos_filhos('corpo_tese', 'descricao_presidencia', 'Presidência da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-13_17:52:08.396', 'Art 4o da Portaria 752 e Art. 4o do Decreto 10.096', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-15_11:31:56.443', 'Presidente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-15_11:26:28.716', 'CCE 1.17', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-15_11:38:50.345', 'Pedro Tourinho de Siqueira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('corpo_tese', 'foto_presidente', 'PedroTourinho2.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'regimento', 'portaria-752-regimento-2022.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-13_17:17:13.099', 'Seção de Apoio ao Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:17:13.099', 'auto_2023-05-13_17:17:27.326389', 'Seção de Apoio ao Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:17:13.099', 'auto_2023-05-13_17:41:26.179', 'ANEXO II do Art. 39', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:17:13.099', 'auto_2023-05-15_11:31:34.386', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:17:13.099', 'auto_2023-05-15_11:31:02.302', 'FCE 1.03', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:17:13.099', 'auto_2023-05-15_11:38:30.699', 'Rita de Cássia Brisighello', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:17:13.099', 'auto_2023-05-13_17:21:37.755', 'rita_brisi.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'Gabinete', 'Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-11_08:44:25.789269', 'Gabinete da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-13_17:37:32.922', 'alínea (a) do item II do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-15_11:40:15.838', 'Chefe de Gabinete', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-15_11:43:10.390', 'FCE 1.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-15_11:40:31.110', 'Victor Pellegrini Mammana', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-05-12_09:04:50.545', 'Victor.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('Gabinete', 'auto_2023-06-05_19:22:43.559', 'Ouvidoria', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:22:43.559', 'auto_2023-06-05_19:22:57.650850', 'Ouvidoria', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:22:43.559', 'auto_2023-06-05_19:36:46.451', 'Minutas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:36:46.451', 'auto_2023-06-05_19:37:03.490632', 'Minutas para estabelecimento da Ouvidoria', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:36:46.451', 'auto_2023-06-05_19:39:06.631', 'Indicacao_Ouvidoria_SEI_47648.000273_2023_15.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:36:46.451', 'auto_2023-06-05_19:48:44.674', 'Plano_capacitação_SEI_47648.000254_2023_81.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:36:46.451', 'auto_2023-06-05_19:58:14.718', 'regulamentar_ouvidoria.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:36:46.451', 'auto_2023-06-05_21:24:44.593', 'SEI_47648.000493_2023_31.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('corpo_tese', 'assessores', 'Assessores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('assessores', 'auto_2023-05-12_09:27:46.638', 'Assessor da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:27:46.638', 'auto_2023-05-12_09:27:57.750222', 'Assessor da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:27:46.638', 'auto_2023-05-13_17:38:44.076', 'ANEXO II do Art. 39', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:27:46.638', 'auto_2023-05-15_11:40:52.315', 'Assessor', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:27:46.638', 'auto_2023-05-15_11:43:31.089', 'FCE 2.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:27:46.638', 'auto_2023-05-15_11:41:30.791', 'Vitor Araújo Filgueiras', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:27:46.638', 'auto_2023-05-12_09:28:34.574', 'vitor.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('assessores', 'auto_2023-05-12_09:23:16.546', 'Assessor da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:23:16.546', 'auto_2023-05-12_09:23:28.233355', 'Assessor da Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:23:16.546', 'auto_2023-05-13_17:39:03.653', 'ANEXO II do Art. 39', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:23:16.546', 'auto_2023-05-15_11:41:46.732', 'Assessor', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:23:16.546', 'auto_2023-05-15_11:43:50.114', 'CCE 2.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:23:16.546', 'auto_2023-05-15_11:42:02.158', 'Rafael Mônico Silva', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_09:23:16.546', 'auto_2023-05-12_09:25:03.318', 'rafael.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'gerentes_de_projeto', 'Gerentes de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('gerentes_de_projeto', 'auto_2023-05-13_17:15:30.879', 'Gerente de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:15:30.879', 'auto_2023-05-13_17:15:43.031891', 'Gerente de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:15:30.879', 'auto_2023-05-13_17:39:52.251', 'ANEXO II do Art. 39', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:15:30.879', 'auto_2023-05-15_11:42:43.699', 'Gerente de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:15:30.879', 'auto_2023-05-15_11:44:09.363', 'CCE 3.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('gerentes_de_projeto', 'auto_2023-05-13_17:16:11.477', 'Gerente de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:16:11.477', 'auto_2023-05-13_17:16:22.983231', 'Gerente de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:16:11.477', 'auto_2023-05-13_17:40:00.723', 'ANEXO II do Art. 39', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:16:11.477', 'auto_2023-05-15_11:44:48.984', 'Gerente de Projeto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:16:11.477', 'auto_2023-05-15_11:45:12.581', 'FCE 3.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:16:11.477', 'auto_2023-05-15_13:06:29.681', 'Guilherme Masaaki Koreeda', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-13_17:16:11.477', 'auto_2023-05-15_13:08:13.928', 'Substituto(a): José Leonardo Padilha', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-12_08:31:56.338', 'Serviço de Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-12_08:32:08.605113', 'Serviço de Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-13_17:41:05.473', 'alínea (d) do item II do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-15_11:46:09.923', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-15_11:46:27.147', 'FCE 1.06', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-15_12:34:27.882', 'Cristiane Oliveira Reimberg', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-12_09:41:19.853', 'cristiane.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:31:56.338', 'auto_2023-05-12_08:32:35.925', 'Setor de Apoio à Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-12_08:33:06.462247', 'Setor de Apoio à Comunicação Institucional', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-13_17:55:40.074', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-15_12:34:57.325', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-15_12:35:18.802', 'FCE 1.02', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-15_12:35:44.449', 'Débora Maria Santos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:32:35.925', 'auto_2023-05-15_12:38:48.903', 'debora.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'controle_interno', 'Controle Interno', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('controle_interno', 'auto_2023-05-11_08:31:37.157', 'Auditoria Interna', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-11_08:44:49.797060', 'Auditoria Interna da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-13_17:43:11.398', 'alínea (b) do item III do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-15_12:39:20.523', 'Auditor-Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-15_12:40:12.481', 'FCE 1.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-15_12:40:47.957', 'Benedito Silva Guimarães Filho', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-15_12:49:52.661', 'Substituto Eventual: Gustavo Holzbach Haibara', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:31:37.157', 'auto_2023-05-15_12:46:49.106', 'Assistente Técnico da Auditoria Interna', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:46:49.106', 'auto_2023-05-15_12:47:00.446625', 'Assistente Técnico da Auditoria Interna', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:46:49.106', 'auto_2023-05-15_12:47:23.863', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:46:49.106', 'auto_2023-05-15_12:47:35.518', 'Assistente Técnico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:46:49.106', 'auto_2023-05-15_12:48:02.518', 'FCE 2.06', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:46:49.106', 'auto_2023-05-15_12:49:27.860', 'Gustavo Holzbach Haibara', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('controle_interno', 'auto_2023-05-11_08:32:37.321', 'Procuradoria Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-11_08:45:21.502454', 'Procuradoria Federal junto à Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-13_17:43:35.153', 'alínea (a) do item III do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-15_12:41:45.541', 'Procurador(a)-Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-15_12:43:04.439', 'FCE 1.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-15_12:43:36.785', 'Estefânia Medeiros Castro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:32:37.321', 'auto_2023-05-15_12:44:15.386', 'Assistente da Procuradoria Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:44:15.386', 'auto_2023-05-15_12:44:30.795937', 'Assistente da Procuradoria Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:44:15.386', 'auto_2023-05-15_12:45:04.309', 'ANEXO II do Art. 39', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:44:15.386', 'auto_2023-05-15_12:45:54.636', 'Assistente Técnico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_12:44:15.386', 'auto_2023-05-15_12:46:13.458', 'FCE 2.06', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('controle_interno', 'auto_2023-05-11_08:36:39.137', 'Corregedoria', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-11_08:45:49.624017', 'Corregedoria da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-13_17:43:52.553', 'alínea (c) do item III do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-15_12:50:26.407', 'Corregedor', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-15_12:50:48.071', 'FCE 1.10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-15_12:51:31.031', 'Dalton Cria Cusciano', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:36:39.137', 'auto_2023-05-12_09:38:20.582', 'dalton.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-12_08:14:22.042', 'Coordenação Geral de Gestão Corporativa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:16:06.548282', 'Coordenação Geral de Gestão Corporativa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-13_17:45:05.739', 'alínea (c) do item II do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-15_12:52:41.865', 'Coordenador(a)-Geral', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-15_12:52:56.724', 'FCE 1.13', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-15_12:53:31.633', 'vago', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-15_12:53:55.101', 'Substituto(a) Eventual: Vânia Gaebler', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_09:45:20.017', 'vania.png', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:20:07.146', 'Setor de Apoio à CGGC I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:07.146', 'auto_2023-05-12_08:20:18.504105', 'Setor de Apoio à CGGC I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:07.146', 'auto_2023-05-13_17:56:35.606', 'Sustentação Institucional: ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:07.146', 'auto_2023-05-15_13:03:24.210', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:07.146', 'auto_2023-05-15_13:03:41.579', 'FCE 1.02', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:20:39.070', 'Setor de Apoio à CGGC II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:39.070', 'auto_2023-05-12_08:21:19.725645', 'Setor de Apoio à CGGC II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:39.070', 'auto_2023-05-13_17:56:41.710', 'Sustentação Institucional: ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:39.070', 'auto_2023-05-15_13:03:53.281', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:20:39.070', 'auto_2023-05-15_13:04:07.799', 'FCE 1.02', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:22:23.236', 'Serviço de Administração de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-12_08:22:35.462795', 'Serviço de Administração de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-13_17:58:54.634', 'Sustentação Institucional: ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-15_13:00:49.240', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-15_13:01:46.360', 'FCE 1.05', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-15_13:02:18.379', 'vago', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:22:23.236', 'auto_2023-05-15_13:02:37.495', 'Substituto(a): Roseclair Rodrigues de Campos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:28:08.921', 'Serviço de Desenvolvimento de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-12_08:28:20.408105', 'Serviço de Desenvolvimento de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-13_17:58:26.768', 'Sustentação Institucional: ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-15_12:58:52.382', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-15_12:59:06.306', 'FCE 1.05', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-15_12:59:43.775', 'Viviane Maciel Trevisan', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:28:08.921', 'auto_2023-05-15_13:00:01.272', 'Substituto(a): Angela Salete Genaro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:16:44.629', 'Coordenação de Planejamento Estratégico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-12_08:17:37.721085', 'Coordenação de Planejamento Estratégico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-13_18:00:30.654', 'item 2 da alínea (c) do item II do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-15_12:57:02.291', 'Coordenador', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-15_12:57:30.990', 'FCE 1.10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-15_12:57:50.374', 'Thais Monteiro Andrade da Silva', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-05-15_12:58:09.174', 'Substituto(a): Angela Salete Genaro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:12:32.310', 'Carta Compromisso documento da Fcentro em que a instituição se compromete a atender as diretrizes da CGU. Essa carta tem 12 itens. Apoio da Alta Administração ao Programa de Integridade (periodicidade). Capacitações em temas que fortaleçam a integridade (Lista de cursos). Plano de integridade contempla a caracterização da instituição. Plano de integridade contempla a avaliaçào de risco? Responsividade: UGI (Unidade Gestora de Integridade = CPE) monuitora o plano de integridade. Como o plano de integridade será reportado para administração? Os resultados do acompanhamento são reportados para o dirigente máximo? A organização possui iniciativas para expansão de seu alcance  para políticas públicas?', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:12:52.097', 'CGRC - Colegiado', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:13:33.387', 'Relatório de Gerenciamento e Iniciativas: são monitorados pela CPE que faz a divulgação interna e externa dessas atividades. Deve existir ou não? Para a CPE como as iniciativas são controladas é assunto das diretorias (assunto quente na DPA é ampliar o ciclo trimestral)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:58:34.366', 'Revisão da periodicidade da RGI na portaria 725.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:59:09.777', 'Revisão do Planejamento: verificar se tem entulho ideológico. Planejamento Estratégico: prazo é final do ano. Encaminhar o PE atual para todos os diretores. Proposta da Tati: elaborar minuta que será submetida para destaques. Rogério:', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:33:47.034', 'Falta plano de risco.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:16:44.629', 'auto_2023-06-06_14:37:42.590', 'Verificar com a Comissão de Ética participação da Thaís.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:14:22.042', 'auto_2023-05-12_08:17:03.325', 'Coordenação de Gestão de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-12_08:18:14.109130', 'Coordenação de Gestão de Pessoas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-13_18:02:28.742', 'item 1 da alínea (c) do item II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-15_12:55:14.425', 'Coordenador', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-15_12:55:38.733', 'FCE 1.10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-15_12:55:58.891', 'vago', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:17:03.325', 'auto_2023-05-15_12:56:27.434', 'Substituto(a): Tatiana Gonçalves', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-12_08:30:02.557', 'Coordenação de Inovação e Parcerias', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-12_08:30:21.529887', 'Coordenação de Inovação e Parcerias', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-13_17:45:42.899', 'alínea (b) do item II do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-15_13:05:15.625', 'Coordenador', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-15_13:05:34.961', 'FCE 1.10', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-15_13:09:26.869', 'José Leonardo Padilha', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-05-15_13:09:53.602', 'Substituto(a): Lucia Silva da Rocha', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-06-05_20:25:12.060', 'Ofícios Direcionados à Presidência', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:25:12.060', 'auto_2023-06-05_20:25:48.010896', 'Ofícios recebidos pela Presidência da CIP', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:25:12.060', 'auto_2023-06-05_20:28:09.005', 'Acordos-em-vigencia-falta-atualizar.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('auto_2023-05-12_08:30:02.557', 'auto_2023-06-05_20:17:43.437', 'Minutas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:17:43.437', 'auto_2023-06-05_20:20:19.271176', 'Minutas para estabelecimento de parceriais', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:17:43.437', 'auto_2023-06-05_20:20:56.857', 'Protocolo_Enamat_Fundacentro.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_08:37:49.478', 'Diretoria de Conhecimento e Tecnologia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_08:46:38.620964', 'Diretoria de Conhecimento e Tecnologia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-13_17:48:26.313', 'alínea (c) do item IV do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-15_13:11:05.783', 'Diretor', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-15_13:11:21.850', 'CCE 1.15', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-15_13:11:36.911', 'Remígio Todeschini', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-12_09:14:15.839', 'remidio.jpg', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_09:28:18.162', 'Setor de Apoio à DCT', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:28:18.162', 'auto_2023-05-11_09:28:51.626056', 'Setor de Apoio à DCT', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:28:18.162', 'auto_2023-05-13_18:05:44.157', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_09:29:54.725', 'Coordenação de Difusão de Conhecimento e Educação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_09:30:22.644365', 'Coordenação de Difusão do Conhecimento e Educação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-13_18:18:29.183', 'item 2 da alínea (c) do item IV do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_09:41:21.884', 'Serviço de Biblioteca e Documentação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:41:21.884', 'auto_2023-05-11_09:41:42.631299', 'Serviço de Biblioteca e Documentação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:41:21.884', 'auto_2023-05-13_18:30:59.704', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:41:21.884', 'auto_2023-05-23_14:56:19.368', 'Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'cargo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:41:21.884', 'auto_2023-05-23_14:56:49.232', 'FCE 1.05', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'comissionamento'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:41:21.884', 'auto_2023-05-23_14:43:23.900', 'Erika Alves dos Santos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_10:27:30.123', 'Serviço de Cursos e Eventos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:27:30.123', 'auto_2023-05-11_10:27:41.316067', 'Serviço de Cursos e Eventos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:27:30.123', 'auto_2023-05-13_18:32:17.633', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:29:54.725', 'auto_2023-05-11_10:28:33.974', 'Serviço de Publicação e RBSO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:28:33.974', 'auto_2023-05-11_10:28:55.135526', 'Serviço de Publicação e RBSO', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:28:33.974', 'auto_2023-05-13_18:34:06.489', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_08:37:49.478', 'auto_2023-05-11_10:29:32.038', 'Coordenação de Tecnologia da Informação e Comunicação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-11_10:30:06.343191', 'Coordenação de Tecnologia da Informação e Comunicação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-13_18:19:34.489', 'item 1 da alínea (c) do item IV do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-11_10:30:49.526', 'Serviço de Tecnologia Infraestrutura e Operações', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:30:49.526', 'auto_2023-05-11_10:31:07.310350', 'Serviço de Tecnologia Infraestrutura e Operações', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:30:49.526', 'auto_2023-05-13_18:35:19.907', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:29:32.038', 'auto_2023-05-11_10:31:42.968', 'Serviço de Tecnologia Desenvolvimento e Negócios', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:31:42.968', 'auto_2023-05-11_10:32:05.287225', 'Serviço de Tecnologia Desenvolvimento e Negócios', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:31:42.968', 'auto_2023-05-13_18:35:48.844', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_09:31:16.427', 'Diretoria de Administração e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_09:32:33.985667', 'Diretoria de Administração e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-13_17:49:02.778', 'alínea (a) do item IV do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-13_18:21:02.217', 'Assessor Técnico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-13_18:21:02.217', 'auto_2023-05-13_18:21:14.879828', 'Assessor Técnico', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_18:21:02.217', 'auto_2023-05-13_18:21:53.245', 'ANEXO II do Art.39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:35:34.395', 'Setor de Apoio À DAF I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:35:34.395', 'auto_2023-05-11_10:35:54.635837', 'Setor de Apoio à DAF I', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:35:34.395', 'auto_2023-05-13_18:22:40.165', 'ANEXO II do Art.39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:36:24.385', 'Setor de Apoio à DAF II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:36:24.385', 'auto_2023-05-11_10:37:34.282563', 'Setor de Apoio à DAF II', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:36:24.385', 'auto_2023-05-13_18:22:49.489', 'ANEXO II do Art.39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:37:59.577', 'Setor de Apoio à DAF III', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:37:59.577', 'auto_2023-05-11_10:38:11.859535', 'Setor de Apoio à DAF III', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:37:59.577', 'auto_2023-05-13_18:24:05.219', 'ANEXO II do Art.39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:41:42.153', 'Coordenação de Administração', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:41:42.153', 'auto_2023-05-11_10:44:27.861131', 'Coordenação de Administração', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:41:42.153', 'auto_2023-05-13_18:25:22.961', 'item 1 da alínea (a) do Item IV do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:31:16.427', 'auto_2023-05-11_10:44:56.255', 'Coordenação de Orçamento e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-11_10:46:19.486501', 'Coordenação de Orçamento e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-13_18:26:13.556', 'item 2 da alínea (a) do item IV do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-11_10:47:26.477', 'Serviço de Execução Orçamentária e Financeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:47:26.477', 'auto_2023-05-11_10:48:04.325605', 'Serviço de Execução Orçamentária e Financeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:47:26.477', 'auto_2023-05-13_18:36:42.319', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:44:56.255', 'auto_2023-05-11_10:48:45.584', 'Serviço de Contabilidade', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:48:45.584', 'auto_2023-05-11_10:48:58.434543', 'Serviço de Contabilidade', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:48:45.584', 'auto_2023-05-13_18:37:23.953', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-11_09:33:05.510', 'Diretoria de Pesquisa Aplicada', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-11_09:33:20.606661', 'Diretoria de Administração e Finanças', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-13_17:49:17.714', 'alínea (b) do item IV do Art. 3o do Regimento Interno (Portaria No. 725).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-12_09:07:59.518', 'Rogerio.jpeg', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'imagem'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-13_18:38:26.514', 'Setor de Apoio à Diretoria de Pesquisa Aplicada', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-13_18:38:26.514', 'auto_2023-05-13_18:38:54.191346', 'Setor de Apoio à Diretoria de Pesquisa Aplicada', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-13_18:38:26.514', 'auto_2023-05-13_18:40:35.275', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-11_10:53:16.333', 'Coordenação de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_10:53:33.810567', 'Coordenação de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-13_18:28:46.711', 'item 2 da alínea (b) do Item IV do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_10:55:53.700', 'Serviço de Laboratórios de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:55:53.700', 'auto_2023-05-11_10:56:14.406875', 'Serviço de Laboratório de Apoio à Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:55:53.700', 'auto_2023-05-13_18:41:48.646', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_10:59:42.229', 'Serviço de Laboratório de EPI', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:59:42.229', 'auto_2023-05-11_10:59:55.891797', 'Serviço de Laboratório de EPI', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:59:42.229', 'auto_2023-05-13_18:42:07.624', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:16.333', 'auto_2023-05-11_11:00:36.666', 'Serviço de Epidemiologia e Estatística', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_11:00:36.666', 'auto_2023-05-11_11:01:18.408616', 'Serviço de Epidemiologia e Estatística', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_11:00:36.666', 'auto_2023-05-13_18:42:32.390', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_09:33:05.510', 'auto_2023-05-11_10:53:54.204', 'Coordenação Geral de Projetos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:54.204', 'auto_2023-05-11_10:54:09.590590', 'Coordenação Geral de Projetos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:54.204', 'auto_2023-05-13_18:27:42.656', 'item 1 da alínea (b) do Item IV do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:53:54.204', 'auto_2023-05-11_10:54:45.232', 'Serviço de Apoio Técnico e Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:54:45.232', 'auto_2023-05-11_10:55:11.008468', 'Serviço de Apoio Técnico e Pesquisa', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-11_10:54:45.232', 'auto_2023-05-13_18:43:19.255', 'ANEXO II do Art. 39 da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-15_10:29:44.307', 'Unidades Descentralizadas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:29:44.307', 'auto_2023-05-15_10:30:03.048386', 'Unidades Descentralizadas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:29:44.307', 'auto_2023-05-15_10:30:44.992', 'item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:29:44.307', 'auto_2023-05-15_10:31:31.398', 'Escritórios Avançados', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:32:19.596633', 'Escritórios Avançados', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:41:53.213', 'alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:43:02.282', 'Escritório Avançado do Estado de Pernambuco', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:43:02.282', 'auto_2023-05-15_10:43:24.897273', 'Escritório Avançado do Estado de Pernambuco', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:43:02.282', 'auto_2023-05-15_11:00:13.418', 'item 1 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:43:50.095', 'Escritório Avançado do Distrito Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:43:50.095', 'auto_2023-05-15_10:48:09.064543', 'Escritório Avançado do Distrito Federal', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:43:50.095', 'auto_2023-05-15_11:00:30.383', 'item 2 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:45:10.488', 'Escritório Avançado do Estado de Minas Gerais', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:10.488', 'auto_2023-05-15_10:48:35.681659', 'Escritório Avançado do Estado de Minas Gerais', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:10.488', 'auto_2023-05-15_11:00:42.281', 'item 3 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:45:25.549', 'Escritório Avançado do Estado do Rio de Janeiro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:25.549', 'auto_2023-05-15_10:49:07.894598', 'Escritório Avançado do Estado do Rio de Janeiro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:25.549', 'auto_2023-05-15_11:00:53.770', 'item 4 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:45:40.573', 'Escritório Avançado do Estado de Santa Catarina', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:40.573', 'auto_2023-05-15_10:49:28.177013', 'Escritório Avançado do Estado de Santa Catarina', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:40.573', 'auto_2023-05-15_11:01:04.785', 'item 5 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:45:51.304', 'Escritório Avançado do Estado do Pará', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:51.304', 'auto_2023-05-15_10:53:53.439208', 'Escritório Avançado do Estado do Pará', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:45:51.304', 'auto_2023-05-15_11:01:13.399', 'item 6 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:46:13.243', 'Escritório Avançado do Estado da Bahia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:46:13.243', 'auto_2023-05-15_10:54:27.155744', 'Escritório Avançado do Estado da Bahia', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:46:13.243', 'auto_2023-05-15_11:01:31.456', 'item 7 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:46:32.515', 'Escritório Avançado do Estado do Espírito Santo', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:46:32.515', 'auto_2023-05-15_10:54:50.708115', 'Escritório Avançado do Estado do Espírito Santo', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:46:32.515', 'auto_2023-05-15_11:01:39.759', 'item 8 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:46:49.044', 'Escritório Avançado do Estado do Paraná', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:46:49.044', 'auto_2023-05-15_10:55:09.791248', 'Escritório Avançado do Estado do Paraná', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:46:49.044', 'auto_2023-05-15_11:02:17.191', 'item 9 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:31:31.398', 'auto_2023-05-15_10:47:08.826', 'Escritório Avançado do Estado do Rio Grande do Sul', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:47:08.826', 'auto_2023-05-15_10:55:29.401375', 'Escritório Avançado do Estado do Rio Grande do Sul', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:47:08.826', 'auto_2023-05-15_11:02:29.037', 'item 10 da alínea (a) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:29:44.307', 'auto_2023-05-15_10:32:02.531', 'Unidades Descentralizadas em Extinção', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:32:02.531', 'auto_2023-05-15_10:41:05.322367', 'Unidades Descentralizadas em extinção', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:32:02.531', 'auto_2023-05-15_10:42:35.829', 'alínea (b) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:32:02.531', 'auto_2023-05-15_10:47:30.794', 'Unidade Descentralizada em Extinção de Campinas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:47:30.794', 'auto_2023-05-15_10:55:45.212612', 'Unidade Descentralizada em Extinção de Campinas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:47:30.794', 'auto_2023-05-15_11:02:50.548', 'item 1 da alínea (b) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:32:02.531', 'auto_2023-05-15_10:47:50.503', 'Unidade Descentralizada em Extinção da Baixada Santista', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:47:50.503', 'auto_2023-05-15_10:55:59.764824', 'Unidade Descentralizada em Extinção da Baixada Santista', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:47:50.503', 'auto_2023-05-15_11:03:01.956', 'item 2 da alínea (b) do item V do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('corpo_tese', 'conselhos', 'Conselhos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('conselhos', 'auto_2023-05-15_10:14:52.509', 'Conselho Curador', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_10:15:32.021092', 'Conselho Curador', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_10:16:24.643', 'item I do Art. 3o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:30:01.589', 'serviço relevante não remunerado (parágrafo 6o do Art. 7o da Portaria 752)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:03:56.740', 'Secretário Executivo do MTE', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:03:56.740', 'auto_2023-05-15_11:04:03.090102', 'Secretário Executivo do MTE', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:03:56.740', 'auto_2023-05-15_11:13:36.510', 'item I do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:04:19.328', 'Presidente da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:04:19.328', 'auto_2023-05-15_11:04:33.065737', 'Presidente da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:04:19.328', 'auto_2023-05-15_11:14:03.510', 'item II do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:04:49.727', 'Diretor da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:04:49.727', 'auto_2023-05-15_11:05:02.185517', 'Diretor da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:04:49.727', 'auto_2023-05-15_11:14:12.731', 'item III do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:05:30.999', 'Membro I Indicado pelo MTE', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:05:30.999', 'auto_2023-05-15_11:05:50.390608', 'Membro I Indicado pelo MTE', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:05:30.999', 'auto_2023-05-15_11:14:23.805', 'item IV do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:06:00.545', 'Membro II Indicado pelo MTE', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:06:00.545', 'auto_2023-05-15_11:06:08.356484', 'Membro II Indicado pelo MTE', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:06:00.545', 'auto_2023-05-15_11:14:49.211', 'item IV do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:10:08.262', 'Representante I dos Empregadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:10:08.262', 'auto_2023-05-15_11:10:18.888500', 'Representante I dos Empregadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:10:08.262', 'auto_2023-05-15_11:15:06.843', 'item V do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:10:27.585', 'Representante II dos Empregadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:10:27.585', 'auto_2023-05-15_11:10:41.137211', 'Representante II dos Empregadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:10:27.585', 'auto_2023-05-15_11:15:24.300', 'item V do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:12:36.305', 'Representante I dos Trabalhadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:12:36.305', 'auto_2023-05-15_11:12:47.183239', 'Representante I dos Trabalhadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:12:36.305', 'auto_2023-05-15_11:15:37.000', 'item VI do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:12:57.398', 'Representante II dos Trabalhadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:12:57.398', 'auto_2023-05-15_11:13:07.530151', 'Representante II dos Trabalhadores', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:12:57.398', 'auto_2023-05-15_11:15:53.416', 'item VI do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_10:14:52.509', 'auto_2023-05-15_11:17:20.654', 'Membros sem direito a voto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:17:20.654', 'auto_2023-05-15_11:17:52.202495', 'Sem direito a voto', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:17:20.654', 'auto_2023-05-15_11:18:16.994', 'Membro Diretor II da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:18:16.994', 'auto_2023-05-15_11:19:17.986898', 'Diretor II da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:18:16.994', 'auto_2023-05-15_11:20:53.746', 'parágrafo 1o do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:17:20.654', 'auto_2023-05-15_11:18:28.417', 'Membro Diretor III da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:18:28.417', 'auto_2023-05-15_11:19:33.774074', 'Diretor III da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:18:28.417', 'auto_2023-05-15_11:21:08.860', 'parágrafo 1o do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:17:20.654', 'auto_2023-05-15_11:18:44.572', 'Membro Procurador Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:18:44.572', 'auto_2023-05-15_11:20:04.018635', 'Procurador Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:18:44.572', 'auto_2023-05-15_11:21:13.826', 'parágrafo 1o do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:17:20.654', 'auto_2023-05-15_11:19:02.548', 'Membro Auditor Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:19:02.548', 'auto_2023-05-15_11:20:18.533407', 'Auditor Chefe', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-15_11:19:02.548', 'auto_2023-05-15_11:21:18.086', 'parágrafo 1o do Art. 5o da Portaria 752', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-23_15:02:12.871', 'Comissões', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:02:12.871', 'auto_2023-05-23_15:02:40.619261', 'Comissões da Fundacentro.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:02:12.871', 'auto_2023-06-02_12:07:56.077', 'Comissão de Ética da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_12:08:30.242774', 'Comissão de Ética da Fundacentro.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_12:11:28.477', 'Portaria interna Fundacentro n° 070, de 1º de abril de 2008.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_12:28:59.076', 'portaria-pres-0179-2009-09-22-original.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-06_14:47:50.378', 'portaria-pres-0067-2020-03-17-1.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:04:16.703', 'Presidente(a)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:04:16.703', 'auto_2023-06-02_15:04:38.835591', 'Presidente(a)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:04:16.703', 'auto_2023-06-02_15:05:13.917', 'Roberta Granja Gonzaga', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:05:45.583', 'Membro titular_colegiado', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:05:45.583', 'auto_2023-06-02_15:05:57.838907', 'Membro titular_colegiado', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:05:45.583', 'auto_2023-06-02_15:06:31.544', 'Tatiana Gonçalves', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:06:58.633', 'Membro titular_colegiado', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:06:58.633', 'auto_2023-06-02_15:07:14.615479', 'Membro titular_colegiado', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:06:58.633', 'auto_2023-06-02_15:07:59.530', 'Adriano Myotin', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:13:32.623', 'Membro Suplente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:13:32.623', 'auto_2023-06-02_15:13:48.744429', 'Membro Suplente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:13:32.623', 'auto_2023-06-02_15:18:02.164', 'Cristiane Paim da Cunha', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:14:04.310', 'Membro Suplente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:14:04.310', 'auto_2023-06-02_15:14:15.532122', 'Membro Suplente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:14:04.310', 'auto_2023-06-02_15:19:03.558', 'Fernanda de Freitas Ventura
', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:15:06.005', 'Membro Suplente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:15:06.005', 'auto_2023-06-02_15:15:32.508209', 'Membro Suplente', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:15:06.005', 'auto_2023-06-02_15:19:46.456', 'Lúcia Silva Rocha', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_12:07:56.077', 'auto_2023-06-02_15:16:31.563', 'Secretário(a) Executivo(a)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:16:31.563', 'auto_2023-06-02_15:16:51.294249', 'Secretário(a) Executivo(a)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-02_15:16:31.563', 'auto_2023-06-02_15:20:22.325', 'Erika Alves dos Santos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'titular_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:02:12.871', 'auto_2023-06-05_19:06:02.484', 'Comitê Interno de Governança, Riscos e Controles (CGRC)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:06:02.484', 'auto_2023-06-05_19:07:13.584428', 'Comitê Interno de Governança, Riscos e Controles (CGRC), que tem caráter deliberativo (aprovar) em alguns temas.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:06:02.484', 'auto_2023-06-05_19:07:48.148', 'Portaria Nº 489, DE 16 DE dezembro DE 2019', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:06:02.484', 'auto_2023-06-05_19:10:37.362', 'Resumo: objetivo estabelecer um ambiente adequado de controle e gestão de riscos e garantir que as boas práticas de governança se desenvolvam e sejam apropriadas pela instituição de forma contínua e progressiva.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:06:02.484', 'auto_2023-06-06_14:45:11.564', 'SEI_FUNDACENTRO - 0040650 - Portaria.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-06-05_19:06:02.484', 'auto_2023-06-05_19:25:33.040', 'SEI_FUNDACENTRO - 0137021 - Portaria.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:02:12.871', 'auto_2023-05-23_15:28:17.685', 'Comissão Permanente de Avaliação de Documentos - CPAD', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:28:17.685', 'auto_2023-05-23_15:28:26.001800', 'Comissão Permanente de Avaliação de Documentos - CPAD', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:28:17.685', 'auto_2023-06-02_12:12:50.390', 'Portaria FUNDACENTRO Nº 391, DE 01 DE dezembro DE 2020.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:28:17.685', 'auto_2023-05-23_16:12:47.296', 'Resumo: elaborar códigos de classificação de documentos, aplicar e orientar a aplicação do código de classificação, orientar unidades administrativas, analisar documentos para definir destinação final, submeter listagens de eliminação de documentos para a aprovação do titular_colegiado.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:28:17.685', 'auto_2023-05-25_13:21:54.637', 'SEI-FUNDACENTRO-institui-CPAD-0081773-Portaria.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:02:12.871', 'auto_2023-05-23_16:00:43.976', 'Comissão Permanente de Avaliação de Documentos Sigilosos - CPADS', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_16:00:43.976', 'auto_2023-05-23_16:00:59.150602', 'Comissão Permanente de Avaliação de Documentos Sigilosos - CPADS', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_16:00:43.976', 'auto_2023-06-02_12:18:08.081', 'Portaria FUNDACENTRO Nº 836, DE 20 DE maio DE 2022', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_16:00:43.976', 'auto_2023-05-23_16:14:54.822', 'Resumo: Opinar sobre a informação produzida no âmbito de sua atuação para fins de classificação em qualquer grau de sigilo, assessorar a autoridade classificadora ou a autoridade hierarquicamente superior quanto à desclassificação, reclassificação ou reavaliação de informação classificada, propor destino final das informações desclassificadas, subsidiar a elaboração do rol anual de informações desclassificadas e documentos classificados.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-05-23_15:08:21.014', 'Grupos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:08:21.014', 'auto_2023-05-23_15:08:30.334079', 'Grupos criados por Portarias ou outros instrumentos, no âmbito da Fundacentro.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:08:21.014', 'auto_2023-05-23_15:13:15.034', 'Grupo Temporário de Apoio à CPAD', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:13:15.034', 'auto_2023-05-23_15:14:27.946647', 'Grupo Temporário de Apoio à Comissão Permanente de Avaliação de Documentos da Fundacentro (CPAD) e à Comissão Permanente de Avaliação de Documentos Sigilosos da Fundacentro (CPADS)', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_colegiado'));
call insere_a_direita_dos_filhos('corpo_tese', 'participacoes_externas', 'Participações Externas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'colegiado'));



call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_0", "Câmara Técnica de Saneantes - CATES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_0", "membro_0", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_0", "titular_participacoes_externas_0", "Gilmar da Cunha Trivelato", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_0", "lotacao_participacoes_externas_0", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_0", "coordenadora_participacoes_externas_0", "Agência Nacional de Vigilância Sanitária", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_0", "sustentacao_participacoes_externas_0", "Despacho nº 1/2023/GABINETE PRES/PRES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_2", "Comissão de Estudo de Equipamentos de Proteção Respiratória CB32/ABNT", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_2", "membro_2", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_2", "titular_participacoes_externas_2", "Fernanda de Freitas Ventura", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_2", "lotacao_participacoes_externas_2", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_2", "coordenadora_participacoes_externas_2", "Associação Brasileira de Normas Técnicas (ABNT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_2", "sustentacao_participacoes_externas_2", "OFÍCIO ELETRÔNICO Nº 105/2019/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_2", "membro_3", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_3", "titular_participacoes_externas_3", "Silvia Helena de Araujo Nicolai", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_3", "lotacao_participacoes_externas_3", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_3", "coordenadora_participacoes_externas_3", "Associação Brasileira de Normas Técnicas (ABNT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_3", "sustentacao_participacoes_externas_3", "OFÍCIO Nº 030/CPT-DTE, DE 22 DE SETEMBRO DE 2017", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_4", "Comissão de Estudos Especiais de Nanotecnologia CEE-089/ABNT", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_4", "membro_4", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_4", "titular_participacoes_externas_4", "Arline Sydneia Abel Arcuri", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_4", "lotacao_participacoes_externas_4", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_4", "coordenadora_participacoes_externas_4", "Associação Brasileira de Normas Técnicas (ABNT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_4", "sustentacao_participacoes_externas_4", "DESPACHO Nº 489/2021/GABINETE PRES/PRES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_4", "membro_5", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_5", "titular_participacoes_externas_5", "José Renato Alves Schmidt", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_5", "lotacao_participacoes_externas_5", "EASC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_5", "coordenadora_participacoes_externas_5", "Associação Brasileira de Normas Técnicas (ABNT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_5", "sustentacao_participacoes_externas_5", "DESPACHO Nº 489/2021/GABINETE PRES/PRES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_4", "membro_6", "Membro 3", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_6", "titular_participacoes_externas_6", "Luis Renato Balbão Andrade", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_6", "lotacao_participacoes_externas_6", "EARS", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_6", "coordenadora_participacoes_externas_6", "Associação Brasileira de Normas Técnicas (ABNT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_6", "sustentacao_participacoes_externas_6", "DESPACHO Nº 489/2021/GABINETE PRES/PRES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_7", "Comissão Intersetorial de Saúde do Trabalhador e da Trabalhadora (CISTT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_7", "membro_7", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_7", "titular_participacoes_externas_7", "Emerson José Almeida da Fonseca", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_7", "lotacao_participacoes_externas_7", "EAES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_7", "coordenadora_participacoes_externas_7", "Conselho Estadual de Saúde - CES/ES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_7", "sustentacao_participacoes_externas_7", "OFÍCIO ELETRÔNICO Nº 108/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_7", "membro_8", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_8", "titular_participacoes_externas_8", "Maria Ângela Pizzani Cruz", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_8", "lotacao_participacoes_externas_8", "EAES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_8", "coordenadora_participacoes_externas_8", "Conselho Estadual de Saúde - CES/ES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_8", "sustentacao_participacoes_externas_8", "OFÍCIO ELETRÔNICO Nº 108/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_9", "Comissão Intersetorial do Ambiente e de Outros Minerais - CIAM", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_9", "membro_9", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_9", "titular_participacoes_externas_9", "André Luis Santiago Maia", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_9", "lotacao_participacoes_externas_9", "EABA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_9", "coordenadora_participacoes_externas_9", "Diretoria de Vigilância e Atenção à Saúde do Trabalhador - DIVAST - Secretaria da Saúde - BA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_9", "sustentacao_participacoes_externas_9", "OF/FUNDACENTRO/CRBA/GAB/007/2015", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_10", "Comissão Tripartite Paritária Permanente - CTPP", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_10", "membro_10", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_10", "titular_participacoes_externas_10", "Cezar Akiyoshi Saito", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_10", "lotacao_participacoes_externas_10", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_10", "coordenadora_participacoes_externas_10", "Ministério do Trabalho e Emprego", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_10", "sustentacao_participacoes_externas_10", "PORTARIA MTE Nº 2.053, DE 2 DE JUNHO DE 2023", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_10", "membro_11", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_11", "titular_participacoes_externas_11", "Pedro Tourinho de Siqueira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_11", "lotacao_participacoes_externas_11", "CTN ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_11", "coordenadora_participacoes_externas_11", "Ministério do Trabalho e Emprego", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_11", "sustentacao_participacoes_externas_11", "PORTARIA MTE Nº 2.053, DE 2 DE JUNHO DE 2023", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_12", "Comitê de Riscos e Controles, Integridade e Transparência do Ministério do Trabalho e Previdência", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_12", "membro_12", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_12", "titular_participacoes_externas_12", "Diego Fernando Ferreira de Oliveira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_12", "lotacao_participacoes_externas_12", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_12", "coordenadora_participacoes_externas_12", "Assessoria Especial de Controle Interno do MTP", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_12", "sustentacao_participacoes_externas_12", "OFÍCIO ELETRÔNICO Nº 54/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_12", "membro_13", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_13", "titular_participacoes_externas_13", "Thais Monteiro Andrade da Silva", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_13", "lotacao_participacoes_externas_13", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_13", "coordenadora_participacoes_externas_13", "Assessoria Especial de Controle Interno do MTP", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_13", "sustentacao_participacoes_externas_13", "OFÍCIO ELETRÔNICO Nº 54/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_14", "Comitê Permanente Regional do Estado de São Paulo - CPR-SP/NR-18", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_14", "membro_14", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_14", "titular_participacoes_externas_14", "Artur Carlos da Silva Moreira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_14", "lotacao_participacoes_externas_14", "EASC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_14", "coordenadora_participacoes_externas_14", "Superintendência Regional do Trabalho do Estado de São Paulo (SRTB-SP-SEGUR)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_14", "sustentacao_participacoes_externas_14", " OFÍCIO ELETRÔNICO Nº 71/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_14", "membro_15", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_15", "titular_participacoes_externas_15", "Maria Christina Félix", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_15", "lotacao_participacoes_externas_15", "EARJ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_15", "coordenadora_participacoes_externas_15", "Superintendência Regional do Trabalho do Estado de São Paulo (SRTB-SP-SEGUR)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_15", "sustentacao_participacoes_externas_15", "OFÍCIO ELETRÔNICO Nº 71/2021/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_16", "Fórum de Engenharia do Trabalho", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_16", "membro_16", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_16", "titular_participacoes_externas_16", "Thais Maria Santiago de Moraes Barros", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_16", "lotacao_participacoes_externas_16", "UDCA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_16", "coordenadora_participacoes_externas_16", "Ministério Público do Trabalho -  15ª região", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_16", "sustentacao_participacoes_externas_16", "DESPACHO Nº 429/2020/GABINETE PRES/PRES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_17", "Fórum Saúde e Segurança do Trabalhador no Estado de Santa Catarina - FSST/SC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_17", "membro_17", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_17", "titular_participacoes_externas_17", "Ricardo Luiz Lorenzi", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_17", "lotacao_participacoes_externas_17", "EASC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_17", "coordenadora_participacoes_externas_17", "Ministério Público do Trabalho", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_17", "sustentacao_participacoes_externas_17", "OFÍCIO ELETRÔNICO Nº 50/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_18", "GETRIN 10", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_18", "membro_18", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_18", "titular_participacoes_externas_18", "Swylmar dos Santos Ferreira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_18", "lotacao_participacoes_externas_18", "EADF", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_18", "coordenadora_participacoes_externas_18", "Tribunal Regional do Trabalho TRT-10", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_18", "sustentacao_participacoes_externas_18", "ID SEI Nº 0014792", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_19", "Grupo de Estudo Tripartite sobre Riscos Psicossociais", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_19", "membro_19", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_19", "titular_participacoes_externas_19", "Juliana Andrade Oliveira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_19", "lotacao_participacoes_externas_19", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_19", "coordenadora_participacoes_externas_19", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_19", "sustentacao_participacoes_externas_19", "PARECER Nº 34/2021/GABINETE DPA/DPA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_20", "Grupo de Revisão da NR 10 - Segurança em Instalações e Serviços em Eletricidade", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_20", "membro_20", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_20", "titular_participacoes_externas_20", "Airton Tavares de Almeida Junior", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_20", "lotacao_participacoes_externas_20", "EARS", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_20", "coordenadora_participacoes_externas_20", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_20", "sustentacao_participacoes_externas_20", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_20", "membro_21", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_21", "titular_participacoes_externas_21", "Swylmar dos Santos Ferreira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_21", "lotacao_participacoes_externas_21", "EADF", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_21", "coordenadora_participacoes_externas_21", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_21", "sustentacao_participacoes_externas_21", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_22", "Grupo de Revisão da NR 11 - Transporte, Movimentação, Armazenagem e Manuseio de Materiais", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_22", "membro_22", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_22", "titular_participacoes_externas_22", "Flávio Maldonado Bentes", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_22", "lotacao_participacoes_externas_22", "EARS", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_22", "coordenadora_participacoes_externas_22", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_22", "sustentacao_participacoes_externas_22", "OFÍCIO ELETRÔNICO Nº 56/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_22", "membro_23", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_23", "titular_participacoes_externas_23", "Gustavo Braga Senra", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_23", "lotacao_participacoes_externas_23", "EAMG", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_23", "coordenadora_participacoes_externas_23", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_23", "sustentacao_participacoes_externas_23", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_24", "Grupo de Revisão da NR 13 - Caldeiras, Vasos de Pressão, Tubulações e Tanques Metálicos de Armazenamento", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_24", "membro_24", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_24", "titular_participacoes_externas_24", "Flávio Maldonado Bentes", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_24", "lotacao_participacoes_externas_24", "EARS", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_24", "coordenadora_participacoes_externas_24", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_24", "sustentacao_participacoes_externas_24", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_24", "membro_25", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_25", "titular_participacoes_externas_25", "Rodrigo Cauduro Roscani", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_25", "lotacao_participacoes_externas_25", "UDCA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_25", "coordenadora_participacoes_externas_25", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_25", "sustentacao_participacoes_externas_25", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_26", "Grupo de Revisão da NR 15 - Atividades e Operações Insalubres (calor)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_26", "membro_26", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_26", "titular_participacoes_externas_26", "Elisa Kayo Shibuya", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_26", "lotacao_participacoes_externas_26", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_26", "coordenadora_participacoes_externas_26", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_26", "sustentacao_participacoes_externas_26", "OFÍCIO ELETRÔNICO Nº 47/2019/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_27", "Grupo de Revisão da NR 17 - Ergonomia", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_27", "membro_27", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_27", "titular_participacoes_externas_27", "José Marçal Jackson Filho", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_27", "lotacao_participacoes_externas_27", "EAPR", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_27", "coordenadora_participacoes_externas_27", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_27", "sustentacao_participacoes_externas_27", "OFÍCIO ELETRÔNICO Nº 48/2019/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_28", "Grupo de Revisão da NR 22 - Segurança e Saúde Ocupacional na Mineração", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_28", "membro_28", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_28", "titular_participacoes_externas_28", "Lênio Sérvio Amaral", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_28", "lotacao_participacoes_externas_28", "EAMG", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_28", "coordenadora_participacoes_externas_28", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_28", "sustentacao_participacoes_externas_28", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_28", "membro_29", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_29", "titular_participacoes_externas_29", "Leonidas Ramos Pandaggis", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_29", "lotacao_participacoes_externas_29", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_29", "coordenadora_participacoes_externas_29", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_29", "sustentacao_participacoes_externas_29", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_30", "Grupo de Revisão da NR 29 - Trabalho Portuário", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_30", "membro_30", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_30", "titular_participacoes_externas_30", "Cristiane Paim da Cunha", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_30", "lotacao_participacoes_externas_30", "EARS", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_30", "coordenadora_participacoes_externas_30", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_30", "sustentacao_participacoes_externas_30", "OFÍCIO ELETRÔNICO Nº 33/2020/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_31", "Grupo de Revisão da NR 30 - Aquaviário", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_31", "membro_31", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_31", "titular_participacoes_externas_31", "Antônio Lincoln Colucci", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_31", "lotacao_participacoes_externas_31", "EARJ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_31", "coordenadora_participacoes_externas_31", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_31", "sustentacao_participacoes_externas_31", "OFÍCIO ELETRÔNICO Nº 139/2019/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_32", "Grupo de Revisão da NR 31 - Segurança e Saúde no Trabalho na Agricultura, Pecuária, Silvicultura, Exploração Florestal e Aquicultura", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_32", "membro_32", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_32", "titular_participacoes_externas_32", "Armando Barbosa Xavier Filho", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_32", "lotacao_participacoes_externas_32", "EABA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_32", "coordenadora_participacoes_externas_32", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_32", "sustentacao_participacoes_externas_32", "OFÍCIO ELETRÔNICO Nº 8/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_32", "membro_33", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_33", "titular_participacoes_externas_33", "Felipe Morais Santos", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_33", "lotacao_participacoes_externas_33", "EARS ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_33", "coordenadora_participacoes_externas_33", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_33", "sustentacao_participacoes_externas_33", " OFÍCIO ELETRÔNICO Nº 8/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_34", "Grupo de Revisão da NR 32 - Segurança e Saúde no Trabalho em Serviços de Saúde", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_34", "membro_34", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_34", "titular_participacoes_externas_34", "Érica Lui Reinhardt", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_34", "lotacao_participacoes_externas_34", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_34", "coordenadora_participacoes_externas_34", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_34", "sustentacao_participacoes_externas_34", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_34", "membro_35", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_35", "titular_participacoes_externas_35", "Maria de Fátima Torres Faria Viegas", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_35", "lotacao_participacoes_externas_35", "EARJ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_35", "coordenadora_participacoes_externas_35", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_35", "sustentacao_participacoes_externas_35", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_36", "Grupo de Revisão da NR 33 - Segurança e Saúde nos Trabalhos em Espaços Confinados", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_36", "membro_36", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_36", "titular_participacoes_externas_36", "Cristiane Paim da Cunha", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_36", "lotacao_participacoes_externas_36", "EARS", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_36", "coordenadora_participacoes_externas_36", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_36", "sustentacao_participacoes_externas_36", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_37", "Grupo de Revisão da NR 34 - Condições e Meio Ambiente de Trabalho na Indústria da Construção, Reparação e Desmonte Naval", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_37", "membro_37", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_37", "titular_participacoes_externas_37", "Gustavo Braga Senra", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_37", "lotacao_participacoes_externas_37", "EAMG", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_37", "coordenadora_participacoes_externas_37", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_37", "sustentacao_participacoes_externas_37", "OFÍCIO ELETRÔNICO Nº 68/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_37", "membro_38", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_38", "titular_participacoes_externas_38", "Maria Christina Félix", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_38", "lotacao_participacoes_externas_38", "EARJ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_38", "coordenadora_participacoes_externas_38", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_38", "sustentacao_participacoes_externas_38", "OFÍCIO ELETRÔNICO Nº 68/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_39", "Grupo de Revisão da NR 35 - Trabalho em Altura", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_39", "membro_39", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_39", "titular_participacoes_externas_39", "Diego Fernando Ferreira de Oliveira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_39", "lotacao_participacoes_externas_39", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_39", "coordenadora_participacoes_externas_39", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_39", "sustentacao_participacoes_externas_39", "OFÍCIO ELETRÔNICO Nº 56/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_39", "membro_40", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_40", "titular_participacoes_externas_40", "Lênio Sérvio Amaral", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_40", "lotacao_participacoes_externas_40", "EAMG", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_40", "coordenadora_participacoes_externas_40", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_40", "sustentacao_participacoes_externas_40", "OFÍCIO ELETRÔNICO Nº 56/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_41", "Grupo de Revisão da NR 36 - Segurança e Saúde no Trabalho em Empresas de Abate e Processamento de Carnes e Derivados", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_41", "membro_41", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_41", "titular_participacoes_externas_41", "Celso Amorim Salim", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_41", "lotacao_participacoes_externas_41", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_41", "coordenadora_participacoes_externas_41", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_41", "sustentacao_participacoes_externas_41", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_41", "membro_42", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_42", "titular_participacoes_externas_42", "Erika Alvim de Sá e Benevides", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_42", "lotacao_participacoes_externas_42", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_42", "coordenadora_participacoes_externas_42", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_42", "sustentacao_participacoes_externas_42", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_43", "Grupo de Revisão da NR 37 - Segurança e Saúde em Plataformas de Petróleo", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_43", "membro_43", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_43", "titular_participacoes_externas_43", "José Marçal Jackson Filho", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_43", "lotacao_participacoes_externas_43", "EAPR", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_43", "coordenadora_participacoes_externas_43", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_43", "sustentacao_participacoes_externas_43", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_44", "Grupo de Revisão da NR 4 - SESMT", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_44", "membro_44", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_44", "titular_participacoes_externas_44", "Swylmar dos Santos Ferreira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_44", "lotacao_participacoes_externas_44", "EADF", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_44", "coordenadora_participacoes_externas_44", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_44", "sustentacao_participacoes_externas_44", "OFÍCIO ELETRÔNICO Nº 70/2019/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_45", "Grupo de Revisão da NR 5 - CIPA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_45", "membro_45", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_45", "titular_participacoes_externas_45", "Swylmar dos Santos Ferreira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_45", "lotacao_participacoes_externas_45", "EADF", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_45", "coordenadora_participacoes_externas_45", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_45", "sustentacao_participacoes_externas_45", "OFÍCIO ELETRÔNICO Nº 71/2019/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_46", "Grupo de Revisão da NR 6 - Equipamentos de Proteção Individual", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_46", "membro_46", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_46", "titular_participacoes_externas_46", "José Damásio de Aquino", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_46", "lotacao_participacoes_externas_46", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_46", "coordenadora_participacoes_externas_46", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_46", "sustentacao_participacoes_externas_46", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_46", "membro_47", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_47", "titular_participacoes_externas_47", "Silvia Helena de Araujo Nicolai", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_47", "lotacao_participacoes_externas_47", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_47", "coordenadora_participacoes_externas_47", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_47", "sustentacao_participacoes_externas_47", "OFÍCIO ELETRÔNICO Nº 5/2021/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_48", "Grupo de Trabalho Interinstitucional  - GETRIN 17ª Região", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_48", "membro_48", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_48", "titular_participacoes_externas_48", "Emerson José Almeida da Fonseca", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_48", "lotacao_participacoes_externas_48", "EAES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_48", "coordenadora_participacoes_externas_48", "Tribunal Regional do Trabalho da 17ª Região", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_48", "sustentacao_participacoes_externas_48", "OFÍCIO ELETRÔNICO Nº 110/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_49", "Grupo de Trabalho Interinstitucional - GETRIN 17ª Região", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_49", "membro_49", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_49", "titular_participacoes_externas_49", "Gilcemar Antonio Pereira Endlich", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_49", "lotacao_participacoes_externas_49", "EAES", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_49", "coordenadora_participacoes_externas_49", "Tribunal Regional do Trabalho da 17ª Região", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_49", "sustentacao_participacoes_externas_49", "OFÍCIO ELETRÔNICO Nº 110/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_50", "Grupo de Trabalho Interministerial do Programa de Enfrentamento ao Escalpelamento", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_50", "membro_50", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_50", "titular_participacoes_externas_50", "Doracy Moraes de Souza", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_50", "lotacao_participacoes_externas_50", "EAPA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_50", "coordenadora_participacoes_externas_50", "Ministério do Trabalho e Previdência", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_50", "sustentacao_participacoes_externas_50", "OFÍCIO ELETRÔNICO Nº 107/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_51", "Grupo de Trabalho Tripartite - GTT de revisão dos Anexos de Agentes Químicos da Norma Regulamentadora nº 15 (NR-15) - Atividades e Operações Insalubres, bem como da inclusão dos anexos de agentes químicos e agentes químicos cancerígenos e mutagênicos, além de Apêndices de Benzeno e Asbesto, na Norma Regulamentadora nº 09 (NR-09) - Avaliação e Controle das Exposições Ocupacionais a Agentes Físicos, Químicos e Biológicos. ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_51", "membro_51", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_51", "titular_participacoes_externas_51", "Gilmar da Cunha Trivelato", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_51", "lotacao_participacoes_externas_51", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_51", "coordenadora_participacoes_externas_51", "Secretaria do Trabalho do Ministério do Trabalho e Previdência", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_51", "sustentacao_participacoes_externas_51", "PORTARIA STRAB/MTP Nº 4.035, DE 7 DE DEZEMBRO DE 2022", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_52", "Grupo de Trabalho Tripartite para acompanhamento da implementação da NR 18 - Construção", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_52", "membro_52", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_52", "titular_participacoes_externas_52", "Artur Carlos da Silva Moreira", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_52", "lotacao_participacoes_externas_52", "EASC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_52", "coordenadora_participacoes_externas_52", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_52", "sustentacao_participacoes_externas_52", "OFÍCIO ELETRÔNICO Nº 29/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_52", "membro_53", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_53", "titular_participacoes_externas_53", "Maria Christina Félix", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_53", "lotacao_participacoes_externas_53", "EARJ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_53", "coordenadora_participacoes_externas_53", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_53", "sustentacao_participacoes_externas_53", "OFÍCIO ELETRÔNICO Nº 29/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_54", "Grupo de Trabalho Tripartite para acompanhamento da implementação das NR´s Estruturantes - 01(PGR/GRO); 05(CIPA); 07(PCMSO); 09(Avaliação de Exposições Ocupacionais); e 17(Ergonomia)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_54", "membro_54", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_54", "titular_participacoes_externas_54", "Gilmar da Cunha Trivelato", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_54", "lotacao_participacoes_externas_54", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_54", "coordenadora_participacoes_externas_54", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_54", "sustentacao_participacoes_externas_54", "OFÍCIO ELETRÔNICO Nº 28/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_54", "membro_55", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_55", "titular_participacoes_externas_55", "Luis Renato Balbão Andrade", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_55", "lotacao_participacoes_externas_55", "EARS ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_55", "coordenadora_participacoes_externas_55", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_55", "sustentacao_participacoes_externas_55", "OFÍCIO ELETRÔNICO Nº 28/2022/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_56", "Grupo de Trabalho Tripartite para Elaboração da NR sobre Limpeza Urbana", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_56", "membro_56", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_56", "titular_participacoes_externas_56", "José Renato Alves Schmidt", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_56", "lotacao_participacoes_externas_56", "EASC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_56", "coordenadora_participacoes_externas_56", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_56", "sustentacao_participacoes_externas_56", "OFÍCIO ELETRÔNICO Nº 68/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_57", "Grupo de Trabalho Tripartite para elaboração da NR sobre Limpeza Urbana", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_57", "membro_57", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_57", "titular_participacoes_externas_57", "Tereza Luiza Ferreira dos Santos", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_57", "lotacao_participacoes_externas_57", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_57", "coordenadora_participacoes_externas_57", "Subsecretaria de Inspeção do Trabalho (SIT)", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_57", "sustentacao_participacoes_externas_57", "OFÍCIO ELETRÔNICO Nº 68/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_58", "Grupo Técnico Agrotóxico Estadual - VSPEA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_58", "membro_58", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_58", "titular_participacoes_externas_58", "Valéria Ramos Soares Pinto", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_58", "lotacao_participacoes_externas_58", "EASC", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_58", "coordenadora_participacoes_externas_58", "Diretoria de Vigilância Sanitária - Secretaria de Estado da Saúde de Santa Catarina", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_58", "sustentacao_participacoes_externas_58", "OFÍCIO ELETRÔNICO Nº 64/2022/GABINETE PRES/PRES-FUNDACENTRO", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_59", "Programa Bahia do Trabalho Decente", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_59", "membro_59", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_59", "titular_participacoes_externas_59", "Soraya Wingester Vasconcelos", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_59", "lotacao_participacoes_externas_59", "EABA", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_59", "coordenadora_participacoes_externas_59", "", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_59", "sustentacao_participacoes_externas_59", "OF/FUNDACENTRO/CRBA/0013/2019", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas", "participacoes_externas_60", "Subcomissão de Coordenação do Sistema de Gestão de Documentos - SUBSIGA/ME", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));

call insere_a_direita_dos_filhos("participacoes_externas_60", "membro_60", "Membro 1", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_60", "titular_participacoes_externas_60", "Sergio Antonio dos Santos", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_60", "lotacao_participacoes_externas_60", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_60", "coordenadora_participacoes_externas_60", " Ministério da Economia - SUBSIGA/ME", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_60", "sustentacao_participacoes_externas_60", "OFÍCIO ELETRÔNICO Nº 100/2020/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));


call insere_a_direita_dos_filhos("participacoes_externas_60", "membro_61", "Membro 2", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "colegiado"));
call insere_a_direita_dos_filhos("membro_61", "titular_participacoes_externas_61", "Sergio Roberto Cosmano", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "titular_colegiado"));
call insere_a_direita_dos_filhos("membro_61", "lotacao_participacoes_externas_61", "CTN", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "lotacao_titular"));
call insere_a_direita_dos_filhos("membro_61", "coordenadora_participacoes_externas_61", " Ministério da Economia - SUBSIGA/ME", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "instituicao_coordenadora"));
call insere_a_direita_dos_filhos("membro_61", "sustentacao_participacoes_externas_61", "OFÍCIO ELETRÔNICO Nº 100/2020/GABINETE PRES/PRES-FUNDACENTRO ", "", (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "sustentacao_colegiado"));





call insere_a_direita_dos_filhos('corpo_tese', 'auto_2023-06-05_20:41:46.700', 'Programas', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:41:46.700', 'auto_2023-06-05_20:50:24.922852', 'Programas de longa duração estabelecidos pela Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:41:46.700', 'auto_2023-06-05_20:50:45.680', 'Programa IDEA', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:50:45.680', 'auto_2023-06-05_20:57:15.647034', 'Programa de Bolsas IDEA', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:50:45.680', 'auto_2023-06-11_17:18:53.885', 'PORTARIA FUNDACENTRO No. 355 DE 27 DE OUTUBRO DE 2020', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:50:45.680', 'auto_2023-06-05_20:58:55.355', 'Resumo: mobilização de pesquisadores externos à FUNDACENTRO (pesquisador visitante ou bolsista) para ampliação da capacidade nacional de pesquisa sobre os temas de segurança e saúde do trabalho (SST).', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:50:45.680', 'auto_2023-06-05_20:59:57.950', 'Portaria_IDEIA.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_20:41:46.700', 'auto_2023-06-05_21:03:21.187', 'Programa BEI', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_21:03:21.187', 'auto_2023-06-05_21:07:41.520875', 'Programa de Bolsas de Estímulo à Inovação', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('auto_2023-06-05_21:03:21.187', 'auto_2023-06-05_21:08:19.434', 'PORTARIA FUNDACENTRO No 355, DE 27 DE OUTUBRO DE 2020', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_regimental'));
call insere_a_direita_dos_filhos('auto_2023-06-05_21:03:21.187', 'auto_2023-06-11_17:47:57.712', 'Programa BEI', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_21:03:21.187', 'auto_2023-06-11_17:49:12.455', 'PORTARIA FUNDACENTRO NO. 959 DE 27 DE OUTUBRO DE 2020', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'sustentacao_programa'));
call insere_a_direita_dos_filhos('auto_2023-06-05_21:03:21.187', 'auto_2023-06-05_21:09:37.263', 'Portaria_BEI.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf_programa'));
call insere_a_direita_dos_filhos('corpo_tese', 'projetos_externos', 'Projetos Externos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'projeto'));
call insere_a_direita_dos_filhos('projetos_externos', 'auto_2023-06-11_19:56:30.866', 'Projetos Externos da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_projeto'));
call insere_a_direita_dos_filhos('projetos_externos', 'projeto_expostos_agrotoxicos', 'Diagnóstico de Risco dos Agentes de Santa Catarina expostos a Agrotóxicos.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'projeto'));
call insere_a_direita_dos_filhos('projeto_expostos_agrotoxicos', 'projeto_descricao', 'Monitoramento da Saúde e Diagnóstico da Percepção de Risco dos Agentes de Combate a Endemias de Santa Catarina expostos a Agrotóxicos.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_projeto'));
call insere_a_direita_dos_filhos('corpo_tese', 'projetos_internos', 'Projetos Internos', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'projeto'));
call insere_a_direita_dos_filhos('projetos_internos', 'auto_2023-06-11_19:55:51.180353', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo_projeto'));
call insere_a_direita_dos_filhos('corpo_tese', 'lixeira', 'Lixeira', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-07_08:18:47.516', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-07_08:18:47.516', 'auto_2023-06-07_08:19:19.736724', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-07_08:34:54.540', 'teste2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-07_08:34:54.540', 'auto_2023-06-07_08:35:08.809346', 'teste2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-07_08:11:54.989', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-07_08:11:54.989', 'auto_2023-06-07_08:12:05.452027', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-07_08:11:44.228', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-07_08:11:44.228', 'auto_2023-06-07_08:16:22.611968', 'teste2', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-07_08:09:03.242', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-07_08:09:03.242', 'auto_2023-06-07_08:10:01.185443', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-05_19:09:44.201', 'portaria-pres-0067-2020-03-17-1.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-05-23_15:03:29.746', 'Comissões Temporárias', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-05-23_15:03:29.746', 'auto_2023-05-23_15:03:39.363432', 'Comissões Temporárias da Fundacentro', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-05_20:19:21.782', 'Minutas para estabelecimento de Parceriais', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-05_20:18:03.745', 'Minutas da Área de Inovação e Parcerias', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-05_19:50:31.581', 'Plano_capacitação_SEI_47648.000254_2023_81.pdf', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'pdf'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-05_19:08:50.070', 'Resumo: objetivo estabelecer um ambiente adequado de controle e gestão de riscos e garantir que as boas práticas de governança se desenvolvam e sejam apropriadas pela instituição de forma contínua e progressiva.', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-06-04_12:48:01.489', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'estrutura'));
call insere_a_direita_dos_filhos('auto_2023-06-04_12:48:01.489', 'auto_2023-06-04_12:49:02.444271', 'teste', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));
call insere_a_direita_dos_filhos('lixeira', 'auto_2023-05-23_16:01:42.681', 'Descartados', '', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = 'paragrafo'));


INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;commit;
