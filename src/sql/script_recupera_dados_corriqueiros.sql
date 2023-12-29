# ===========================

# insert into evidencias

INSERT INTO evidencias (nome_evidencia, id_token_tipo_de_evidencia, id_token_tipo_de_veiculo, latitude, longitude, data, time_stamp) VALUES 
("Teste início ", (select id_chave_token from tokens where nome_token = "artigo"), (select id_chave_token from tokens where nome_token="periódico"), -23.55582180, -46.67660200, "2023-12-29", "2023-12-29 06:32:38.934868");





# ===========================

# insert into autores_evidencias

INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("ADRIANA_Teste_2_1", (select id_chave_evidencia from evidencias where nome_evidencia="Teste início " and data="2023-12-29"), (select id_chave_pessoa from pessoas where nome_pessoa = "ADRIANA CUNHA BELASCO"), "2023-12-29 06:32:48.230931");





# ===========================

# insert into evidencias_tipos_de_identificadores

INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste_HASH_FILE_1_6", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="HASH_FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "7cbb7222a46baaae087193d760de5e63d7743292f276566efe831d28a07aa1cc", NULL, "2023-12-29 06:33:06.498422");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("Teste_FILE_1_9", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="FILE"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "/var/www/html/dev_vitor/papedins/imagens/17038423665401904635030627326401.jpg", NULL, "2023-12-29 06:33:06.563466");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("TITULO_PERIODICO_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="TITULO_PERIODICO"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "5273", NULL, "2023-12-29 06:33:47.812492");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("VOLUME_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="VOLUME"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "1", NULL, "2023-12-29 06:33:47.827919");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("NUMERO_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="NUMERO"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "2", NULL, "2023-12-29 06:33:47.828983");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("PAGINA_INICIAL_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="PAGINA_INICIAL"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "3", NULL, "2023-12-29 06:33:47.830046");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("PAGINA_FINAL_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="PAGINA_FINAL"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "4", NULL, "2023-12-29 06:33:47.830506");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("ISBN_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="ISBN"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "5", NULL, "2023-12-29 06:33:47.830915");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("DOI_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="DOI"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "6", NULL, "2023-12-29 06:33:47.831331");


INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES 
("URL_1", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador="URL"), (select id_chave_evidencia from evidencias where nome_evidencia = "Teste início " and data = "2023-12-29"), "7", NULL, "2023-12-29 06:33:47.831703");





# ===========================

# insert into enderecos_do_OSM

INSERT INTO enderecos_do_OSM (id_chave_endereco_do_OSM, place_id, licence, osm_type, osm_id, tipo, latitude, longitude, descricao, pais, codigo_pais, estado, codigo_estado, ISO3166_2, cidade, rua, bairro, regiao_do_estado, regiao_do_pais, importancia_nominatim, postcode, id_pais, id_estado, id_municipio, limite_sul, limite_norte, limite_oeste, limite_leste, class, time_stamp) VALUES 
("1", "7761799", "Data © OpenStreetMap contributors, ODbL 1.0. http://osm.org/copyright", "way", "419602224", "yes", "-23.55580125", "-46.67638907", "Edifício Capote Valente, 668, Rua Capote Valente, Jardim Paulista, São Paulo, Região Imediata de São Paulo, Região Metropolitana de São Paulo, Região Geográfica Intermediária de São Paulo, São Paulo, Southeast Region, 05409-002, Brazil", "Brazil", "br", "São Paulo", "BR-SP", "BR-SP", "São Paulo", "Rua Capote Valente", "", "Região Metropolitana de São Paulo", "Southeast Region", "0.00001000", "05409-002",(SELECT id_chave_pais FROM paises WHERE nome_pais="Brazil"), (SELECT id_chave_estado FROM estados WHERE codigo_iso3166_2 = "BR-SP"), (SELECT id_chave_municipio FROM municipios WHERE nome_municipio = "São Paulo" and nome_uf = "São Paulo"), "-23.55594240", "-23.55565360", "-46.67655240", "-46.67623130", "building", "2023-12-29 06:32:42");





# ===========================

# insert into enderecos_evidencias

INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Teste início " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "419602224" and class = "building"), "2023-12-29 06:32:42");


