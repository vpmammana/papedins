# insert into autores_evidencias

INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("CEZAR_Teste_20_1", (select id_chave_evidencia from evidencias where nome_evidencia="Teste " and data="2023-12-29"), (select id_chave_pessoa from pessoas where nome_pessoa = "CEZAR AKIYOSHI SAITO"), "2023-12-29 13:05:06.120269");


INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("ADRIANO_De_4_2", (select id_chave_evidencia from evidencias where nome_evidencia="De novo " and data="2023-12-29"), (select id_chave_pessoa from pessoas where nome_pessoa = "ADRIANO ROGERIO CHINELLATO CAMARDELLA"), "2023-12-29 13:07:13.406463");


INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("PEDRO_Será_160_3", (select id_chave_evidencia from evidencias where nome_evidencia="Será que volta " and data="2023-12-29"), (select id_chave_pessoa from pessoas where nome_pessoa = "PEDRO TOURINHO DE SIQUEIRA"), "2023-12-29 13:40:44.142966");


INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES 
("ADIR_Km_1_4", (select id_chave_evidencia from evidencias where nome_evidencia="Km 26" and data="2023-12-29"), (select id_chave_pessoa from pessoas where nome_pessoa = "ADIR DE SOUZA"), "2023-12-29 15:27:01.220169");





# insert into enderecos_evidencias

INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Teste " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "node" and osm_id = "5700093393" and class = "place"), "2023-12-29 13:04:58");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="De novo " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "node" and osm_id = "5700093412" and class = "place"), "2023-12-29 13:07:04");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Será que volta " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "419602312" and class = "amenity"), "2023-12-29 13:40:36");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Km 26" and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "4312746" and class = "highway"), "2023-12-29 15:25:27");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Frango Assado " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "318201129" and class = "amenity"), "2023-12-29 15:30:28");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Km 56" and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "340383063" and class = "highway"), "2023-12-29 15:41:58");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Praça " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "89827479" and class = "highway"), "2023-12-29 16:09:59");


INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES 
((select id_chave_evidencia from evidencias where nome_evidencia="Serra do navio " and data="2023-12-29"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = "way" and osm_id = "150430744" and class = "highway"), "2023-12-29 16:14:30");


