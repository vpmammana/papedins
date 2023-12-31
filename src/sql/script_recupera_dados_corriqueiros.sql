# ===========================

# insert into evidencias

INSERT INTO evidencias (nome_evidencia, id_token_tipo_de_evidencia, id_token_tipo_de_veiculo, latitude, longitude, data, time_stamp) VALUES 
("Teste 1", (select id_chave_token from tokens where nome_token = "artigo"), (select id_chave_token from tokens where nome_token="periódico"), -22.82372740, -47.07616190, "2023-12-31", "2023-12-31 15:44:58.836798");


INSERT INTO evidencias (nome_evidencia, id_token_tipo_de_evidencia, id_token_tipo_de_veiculo, latitude, longitude, data, time_stamp) VALUES 
("Teste3", (select id_chave_token from tokens where nome_token = "artigo"), (select id_chave_token from tokens where nome_token="periódico"), -22.82372800, -47.07616140, "2023-12-31", "2023-12-31 16:09:36.377902");


INSERT INTO evidencias (nome_evidencia, id_token_tipo_de_evidencia, id_token_tipo_de_veiculo, latitude, longitude, data, time_stamp) VALUES 
("Teste 4", (select id_chave_token from tokens where nome_token = "artigo"), (select id_chave_token from tokens where nome_token="periódico"), -22.82373960, -47.07615310, "2023-12-31", "2023-12-31 16:12:00.594162");





# ===========================

# insert into autores_evidencias

INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("ADIR_Teste_1_4", (select id_chave_evidencia from evidencias where nome_evidencia="Teste 1" and data="2023-12-31"), (select id_chave_pessoa from pessoas where nome_pessoa = "ADIR DE SOUZA"), "2023-12-31 15:45:48.252121");


INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("ADRIANO_Teste3_3_2", (select id_chave_evidencia from evidencias where nome_evidencia="Teste3" and data="2023-12-31"), (select id_chave_pessoa from pessoas where nome_pessoa = "ADRIANO MYOTIN"), "2023-12-31 16:10:07.729757");





# ===========================

# insert into evidencias_tipos_de_identificadores

INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste_HASH_FILE_4_6", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="HASH_FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 1" and data = "2023-12-31"), "21727a51ec8c747c9330bd0400374ca98a19f38712e2af70f2bcbd24ed6bde73", NULL, "2023-12-31 15:47:26.059233");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste_FILE_4_9", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 1" and data = "2023-12-31"), "/var/www/html/dev_vitor/papedins/imagens/IMG-20231231-WA2430.jpg", NULL, "2023-12-31 15:47:26.060771");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste3_HASH_FILE_2_6", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="HASH_FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste3" and data = "2023-12-31"), "5a73bb3b11b0941105931103fbb93cf858e8b0dd404e5d7043e19eb502a4a816", NULL, "2023-12-31 16:10:59.917658");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste3_FILE_2_9", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste3" and data = "2023-12-31"), "/var/www/html/dev_vitor/papedins/imagens/17040498442423563667579947957243.jpg", NULL, "2023-12-31 16:10:59.919805");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("TITULO_PERIODICO_2", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="TITULO_PERIODICO"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste3" and data = "2023-12-31"), "3781", NULL, "2023-12-31 16:11:31.543228");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("TITULO_PERIODICO_3", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="TITULO_PERIODICO"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "13846", NULL, "2023-12-31 16:12:20.991511");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("VOLUME_3", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="VOLUME"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "1", NULL, "2023-12-31 16:12:20.992913");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("NUMERO_3", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="NUMERO"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "2", NULL, "2023-12-31 16:12:20.994303");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("DOI_3", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="DOI"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "3", NULL, "2023-12-31 16:12:20.994771");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("URL_3", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="URL"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "4", NULL, "2023-12-31 16:12:20.995201");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste_HASH_FILE_3_6", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="HASH_FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "6240ad4f3693d26cf673db33a8362fbd36fa682222394d767b2a7dc773c67b3e", NULL, "2023-12-31 17:57:13.322144");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste_FILE_3_9", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste 4" and data = "2023-12-31"), "/var/www/html/dev_vitor/papedins/imagens/marker2.png", NULL, "2023-12-31 17:57:13.323683");





# ===========================

# insert into enderecos_do_OSM

INSERT INTO enderecos_do_OSM (id_chave_endereco_do_OSM, place_id, licence, osm_type, osm_id, tipo, latitude, longitude, descricao, pais, codigo_pais, estado, codigo_estado, ISO3166_2, cidade, rua, bairro, regiao_do_estado, regiao_do_pais, importancia_nominatim, postcode, id_pais, id_estado, id_municipio, limite_sul, limite_norte, limite_oeste, limite_leste, class, time_stamp) VALUES 
("2", "40919684", "Data © OpenStreetMap contributors, ODbL 1.0. http://osm.org/copyright", "way", "75259404", "residential", "-22.82381337", "-47.07626789", "Rua Deusdeti Martins Gomes, Barão Geraldo, Campinas, Região Imediata de Campinas, Região Metropolitana de Campinas, Região Geográfica Intermediária de Campinas, São Paulo, Southeast Region, 13085-350, Brazil", "Brazil", "br", "São Paulo", "BR-SP", "BR-SP", "Campinas", "Rua Deusdeti Martins Gomes", "Barão Geraldo", "Região Metropolitana de Campinas", "Southeast Region", "0.10001000", "13085-350",(SELECT id_chave_pais FROM paises WHERE nome_pais="Brazil"), (SELECT id_chave_estado FROM estados WHERE codigo_iso3166_2 = "BR-SP"), (SELECT id_chave_municipio FROM municipios WHERE nome_municipio = "Campinas" and nome_uf = "São Paulo"), "-22.82434970", "-22.82277380", "-47.07721170", "-47.07583290", "highway", "2023-12-31 15:45:13");





# ===========================

# insert into enderecos_evidencias

INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Teste 1" and data="2023-12-31"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "75259404" and class = "highway"), "2023-12-31 15:45:13");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Teste3" and data="2023-12-31"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "75259404" and class = "highway"), "2023-12-31 16:09:38");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Teste 4" and data="2023-12-31"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "75259404" and class = "highway"), "2023-12-31 16:12:01");


