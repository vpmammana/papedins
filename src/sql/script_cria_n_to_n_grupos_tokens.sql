# MariaDB [papedins_db]> desc tipos_de_evidencias;
# +----------------------------+--------------+------+-----+----------------------+--------------------------------+
# | Field                      | Type         | Null | Key | Default              | Extra                          |
# +----------------------------+--------------+------+-----+----------------------+--------------------------------+
# | id_chave_tipo_de_evidencia | int(11)      | NO   | PRI | NULL                 | auto_increment                 |
# | nome_tipo_de_evidencia     | varchar(200) | YES  | UNI | NULL                 |                                |
# | descricao                  | varchar(500) | YES  |     | NULL                 |                                |
# | id_token                   | int(11)      | YES  | UNI | NULL                 |                                |
# | time_stamp                 | timestamp(6) | NO   |     | current_timestamp(6) | on update current_timestamp(6) |
# +----------------------------+--------------+------+-----+----------------------+--------------------------------+



DROP TABLE IF EXISTS grupos_vs_tipos_de_evidencias_n_to_n;
DROP TABLE IF EXISTS grupos_vs_tipos_de_veiculos_n_to_n;


CREATE TABLE grupos_vs_tipos_de_evidencias_n_to_n (
        id_chave_grupo_vs_tipo_de_evidencia_n_to_n INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome_grupo_vs_tipo_de_evidencia_n_to_n varchar(200),
	nome_grupo_de_token varchar(200),
	id_grupo_de_token int,
	nome_tipo_de_evidencia varchar(200),
	id_tipo_de_evidencia int,
        time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        unique(nome_grupo_vs_tipo_de_evidencia_n_to_n),
        FOREIGN KEY (nome_grupo_de_token) REFERENCES grupos_de_tokens(nome_grupo_de_token), 
	FOREIGN KEY (nome_tipo_de_evidencia) REFERENCES tipos_de_evidencias(nome_tipo_de_evidencia),
	FOREIGN KEY (id_grupo_de_token) REFERENCES grupos_de_tokens(id_chave_grupo_de_token),
	FOREIGN KEY (id_tipo_de_evidencia) REFERENCES tipos_de_evidencias(id_chave_tipo_de_evidencia)
);
CREATE TABLE grupos_vs_tipos_de_veiculos_n_to_n (
        id_chave_grupo_vs_tipo_de_veiculo_n_to_n INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome_grupo_vs_tipo_de_veiculo_n_to_n varchar(200),
	nome_grupo_de_token varchar(200),
	id_grupo_de_token int,
	nome_tipo_de_veiculo varchar(200),
	id_tipo_de_veiculo int,
        time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        unique(nome_grupo_vs_tipo_de_veiculo_n_to_n),
        FOREIGN KEY (nome_grupo_de_token) REFERENCES grupos_de_tokens(nome_grupo_de_token), 
	FOREIGN KEY (nome_tipo_de_veiculo) REFERENCES tipos_de_veiculos(nome_tipo_de_veiculo),
	FOREIGN KEY (id_grupo_de_token) REFERENCES grupos_de_tokens(id_chave_grupo_de_token),
	FOREIGN KEY (id_tipo_de_veiculo) REFERENCES tipos_de_veiculos(id_chave_tipo_de_veiculo)
);


INSERT INTO grupos_vs_tipos_de_evidencias_n_to_n (nome_grupo_vs_tipo_de_evidencia_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_evidencia, id_tipo_de_evidencia) SELECT CONCAT("<",nome_grupo_de_token,">[",nome_tipo_de_evidencia,"]"), nome_grupo_de_token, id_chave_grupo_de_token, nome_tipo_de_evidencia, id_chave_tipo_de_evidencia FROM tipos_de_evidencias, grupos_de_tokens, tokens WHERE id_grupo_de_token = id_chave_grupo_de_token AND id_token = id_chave_token;

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) SELECT CONCAT("<",nome_grupo_de_token,">[",nome_tipo_de_veiculo,"]"), nome_grupo_de_token, id_chave_grupo_de_token, nome_tipo_de_veiculo, id_chave_tipo_de_veiculo FROM tipos_de_veiculos, grupos_de_tokens, tokens WHERE id_grupo_de_token = id_chave_grupo_de_token AND id_token = id_chave_token;

SELECT "vai inserir um novos grupos para tokens com grupos ja definidos";

INSERT INTO grupos_vs_tipos_de_evidencias_n_to_n (nome_grupo_vs_tipo_de_evidencia_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_evidencia, id_tipo_de_evidencia) VALUES ("<publicacoes_em_eventos>[artigo]","publicacoes_em_eventos",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"),"artigo", (SELECT id_chave_tipo_de_evidencia FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia = "artigo"));

INSERT INTO grupos_vs_tipos_de_evidencias_n_to_n (nome_grupo_vs_tipo_de_evidencia_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_evidencia, id_tipo_de_evidencia) VALUES ("<Serviço Público>[artigo]","servico_publico",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"),"reunião", (SELECT id_chave_tipo_de_evidencia FROM tipos_de_evidencias WHERE nome_tipo_de_evidencia = "reunião"));


INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Infraestruturas>[SEI]","infraestruturas",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "infraestruturas"),"SEI", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "SEI"));

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Eventos>[Congresso]","Eventos",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"),"congresso", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "congresso"));

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Eventos>[conferência]","Eventos",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"),"conferência", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "conferência"));

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Material Didático>[editoração]","material_didatico",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "material_didatico"),"editoração", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "editoração"));

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Produtos Tecnológicos>[SEI]","produtos_tecnologicos",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "produtos_tecnologicos"),"SEI", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "SEI"));

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Processos>[SEI]","processos",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "processos"),"SEI", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "SEI"));

INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Orientações>[editoração]","orientacoes",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"),"editoração", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "editoração"));

# INSERT INTO grupos_vs_tipos_de_veiculos_n_to_n (nome_grupo_vs_tipo_de_veiculo_n_to_n, nome_grupo_de_token, id_grupo_de_token, nome_tipo_de_veiculo, id_tipo_de_veiculo) VALUES ("<Orientações>[banca]","orientacoes",(SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"),"banca", (SELECT id_chave_tipo_de_veiculo FROM tipos_de_veiculos WHERE nome_tipo_de_veiculo = "banca"));

