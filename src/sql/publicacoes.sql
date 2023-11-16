DROP TABLE IF EXISTS autores_evidencias;
DROP TABLE IF EXISTS veiculos_tipos_de_identificadores;
DROP TABLE IF EXISTS evidencias_tipos_de_identificadores;
DROP TABLE IF EXISTS evidencias;
DROP TABLE IF EXISTS veiculos; 
DROP TABLE IF EXISTS tipos_de_identificadores; 
DROP TABLE IF EXISTS tipos_de_veiculos; 
DROP TABLE IF EXISTS tipos_de_evidencias; 


CREATE TABLE tipos_de_evidencias ( # tipos de evidencias que estao presentes na tabela de tokens (artigo, paper, resumo, etc.) 
		id_chave_tipo_de_evidencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_tipo_de_evidencia varchar(200),
		descricao varchar(500),
		id_token int,
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_tipo_de_evidencia),
		unique(id_token),
	    FOREIGN KEY (id_token) REFERENCES tokens(id_chave_token)
);

CREATE TABLE tipos_de_veiculos ( # tipos de veiculos que estao presentes na tabela de tokens (artigo, paper, resumo, etc.) 
		id_chave_tipo_de_veiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_tipo_de_veiculo varchar(200),
		descricao varchar(500),
		id_token int,
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_tipo_de_veiculo),
		unique (id_token),
	    FOREIGN KEY (id_token) REFERENCES tokens(id_chave_token)
);

CREATE TABLE tipos_de_identificadores ( # identificadores de evidencias e veiculos (ISBN, ISSN, DOI, etc)
		id_chave_tipo_de_identificador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_tipo_de_identificador varchar(200),
		requerido boolean DEFAULT FALSE, # se o identificador é requerido ou não (e.g. ISBN é requerido, volume não é)
		descricao varchar(500),
		tabela_externa varchar(255) DEFAULT NULL, # pode ocorrer de se tratar de uma chave externa
		nome_campo_da_chave_primaria_externa varchar(255) DEFAULT NULL,
		nome_campo_do_nome_externo varchar(255) DEFAULT NULL,
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_tipo_de_identificador)
);


CREATE TABLE veiculos ( # veiculos de publicação "Journal of Vacuum Science and Technology"
		id_chave_veiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_veiculo varchar(200),
		descricao varchar(500),
		id_tipo_de_veiculo int, # aponta para um token que representa o tipo de veiculo (Revista, Magazine, Journal, congresso, SEI, etc.)
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_veiculo),
	    FOREIGN KEY (id_tipo_de_veiculo) REFERENCES tipos_de_veiculos(id_chave_tipo_de_veiculo)
);

CREATE TABLE evidencias ( # evidencia em si, quando sabemos o titulo e data e autores.
		id_chave_evidencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_evidencia varchar(500), #titulo da evidencia
		id_token_tipo_de_evidencia int, #aponta para o token que indica o tipo de evidência (publicação, paper, artigo, etc). So que esse numero eh achado atraves da tabela tipos_de_evidencias
		id_token_tipo_de_veiculo int, #aponta para o token que indica o tipo de veiculo (revista, magazine, journal). So que esse numero eh achado atraves da tabela tipos_de_evidencias
		data date,
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_evidencia, data),
	    FOREIGN KEY (id_token_tipo_de_evidencia) REFERENCES tokens(id_chave_token),
	    FOREIGN KEY (id_token_tipo_de_veiculo) REFERENCES tokens(id_chave_token)
);

CREATE TABLE evidencias_tipos_de_identificadores (
		id_chave_evidencia_tipo_de_identificador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_evidencia_tipo_de_identificador varchar(200),
		id_tipo_de_identificador int,
		id_evidencia int,
		valor varchar(255), # este valor pode ser atribuido diretamente ou pode ser obtido da tabela_externa
		id_chave_externa int, # este é o id da chave externa, obtido do campo nome_campo_da_chave_primaria_externa
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_evidencia_tipo_de_identificador),
		unique (id_evidencia, id_tipo_de_identificador), # porque cada evidencia so pode ter um arquivo, um ISBN, etc.
	    FOREIGN KEY (id_tipo_de_identificador) REFERENCES tipos_de_identificadores(id_chave_tipo_de_identificador),
	    FOREIGN KEY (id_evidencia) REFERENCES evidencias(id_chave_evidencia)
);

CREATE TABLE veiculos_tipos_de_identificadores (
		id_chave_veiculo_tipo_de_identificador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_veiculo_tipo_de_identificador varchar(200),
		id_tipo_de_identificador int,
		id_veiculo int,
		valor varchar(255),
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_veiculo_tipo_de_identificador),
		unique (valor),
	    FOREIGN KEY (id_tipo_de_identificador) REFERENCES tipos_de_identificadores(id_chave_tipo_de_identificador),
	    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_chave_veiculo)
);

CREATE TABLE autores_evidencias ( 
		id_chave_autor_evidencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_autor_evidencia varchar(500), #titulo da autor_evidencia
		id_evidencia int, 
		id_pessoa int, 
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_autor_evidencia),
		unique(id_pessoa, id_evidencia),
	    FOREIGN KEY (id_evidencia) REFERENCES evidencias(id_chave_evidencia),
	    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_chave_pessoa)
);

# grupos_de_tokens
# +-------------------------+--------------+------+-----+----------------------+--------------------------------+
# | Field                   | Type         | Null | Key | Default              | Extra                          |
# +-------------------------+--------------+------+-----+----------------------+--------------------------------+
# | id_chave_grupo_de_token | int(11)      | NO   | PRI | NULL                 | auto_increment                 |
# | nome_grupo_de_token     | varchar(200) | YES  | UNI | NULL                 |                                |
# | acentuada               | varchar(200) | YES  |     | NULL                 |                                |
# | tipo                    | varchar(200) | YES  |     | NULL                 |                                |
# | pontuacao               | int(11)      | YES  |     | NULL                 |                                |
# | time_stamp              | timestamp(6) | NO   |     | current_timestamp(6) | on update current_timestamp(6) |
# +-------------------------+--------------+------+-----+----------------------+--------------------------------+



CREATE TABLE grupos_vs_identificadores ( 
		id_chave_grupo_vs_identificador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_grupo_vs_identificador varchar(500), #titulo da grupo_vs_identificador
		id_grupo_de_token int, 
		id_tipo_de_identificador int, 
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_grupo_vs_identificador),
		unique(id_grupo_de_token, id_tipo_de_identificador),
	    FOREIGN KEY (id_tipo_de_identificador) REFERENCES tipos_de_identificadores(id_chave_tipo_de_identificador),
	    FOREIGN KEY (id_grupo_de_token) REFERENCES grupos_de_tokens(id_chave_grupo_de_token)
);


# O trigger abaixo é para verificar se o HASH que se está tentando entrar já existe na tabela evidencias_tipos_de_identificadores

DELIMITER //

CREATE TRIGGER before_insert_evidencias_tipos_de_identificadores
BEFORE INSERT ON evidencias_tipos_de_identificadores 
FOR EACH ROW 
BEGIN 
    DECLARE hashExist INT;
    DECLARE hashType INT;
    DECLARE existing_evidencia_name VARCHAR(255);
    DECLARE existing_id_chave_evidencia INT;

    SET hashType = (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = 'HASH_FILE');

    IF NEW.id_tipo_de_identificador = hashType THEN
        SELECT COUNT(*), nome_evidencia, id_chave_evidencia INTO hashExist, existing_evidencia_name, existing_id_chave_evidencia 
        FROM evidencias_tipos_de_identificadores 
        INNER JOIN evidencias ON evidencias.id_chave_evidencia = evidencias_tipos_de_identificadores.id_evidencia
        WHERE valor = NEW.valor AND id_tipo_de_identificador = hashType;

        IF hashExist > 0 THEN 
            SET @errMsg = CONCAT('Detectado valor de HASH_FILE duplicado. Esse HASH já está vinculado à evidencia: ', existing_evidencia_name, ' com identificador ', existing_id_chave_evidencia);
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @errMsg;
        END IF;
    END IF;
END //

DELIMITER ;

# tipos_de_identificadores;
# +--------------------------------------+--------------+------+-----+----------------------+--------------------------------+
# | Field                                | Type         | Null | Key | Default              | Extra                          |
# +--------------------------------------+--------------+------+-----+----------------------+--------------------------------+
# | id_chave_tipo_de_identificador       | int(11)      | NO   | PRI | NULL                 | auto_increment                 |
# | nome_tipo_de_identificador           | varchar(200) | YES  | UNI | NULL                 |                                |
# | requerido			    	 | boolean	| YES  |     | 0                    |                                |	
# | descricao                            | varchar(500) | YES  |     | NULL                 |                                |
# | tabela_externa                       | varchar(255) | YES  |     | NULL                 |                                |
# | nome_campo_da_chave_primaria_externa | varchar(255) | YES  |     | NULL                 |                                |
# | nome_campo_do_nome_externo           | varchar(255) | YES  |     | NULL                 |                                |
# | time_stamp                           | timestamp(6) | NO   |     | current_timestamp(6) | on update current_timestamp(6) |
# +--------------------------------------+--------------+------+-----+----------------------+--------------------------------+


INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("ISBN", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("DOI", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("ISSN", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("SEI", TRUE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("TIPO_DOCUMENTO", TRUE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("HASH_FILE", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("HASH_URL", TRUE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("URL", TRUE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("FILE", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("ESTADO", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("CIDADE", 	FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("PAIS", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("VOLUME", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("NUMERO", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("NUMERO_DE_PAGINAS", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("EDICAO", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("PAGINA_INICIAL", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("PAGINA_FINAL", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("ANO", TRUE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("MES", TRUE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("DIA", FALSE);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo) VALUES ("TITULO_PERIODICO", TRUE, "journals", "id_chave_journal", "nome_journal");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido) VALUES ("DATA_INICIAL_EVENTO", TRUE);	
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo) VALUES ("INSTITUICAO_RESPONSAVEL", TRUE, "instituicoes", "id_chave_instituicao", "nome_instituicao");

# +-------------------------+---------------------------+-----------------------------+-----------+-----------+----------------------------+
# | id_chave_grupo_de_token | nome_grupo_de_token       | acentuada                   | tipo      | pontuacao | time_stamp                 |
# +-------------------------+---------------------------+-----------------------------+-----------+-----------+----------------------------+
# |                       1 | artigos                   | Artigos                     | evidencia |       100 | 2023-11-08 22:54:31.291018 |
# |                       2 | capacitacoes              | Participações em Reunião    | evidencia |       100 | 2023-11-08 22:54:31.291658 |
# |                       3 | apresentacoes             | Apresentações               | evidencia |       100 | 2023-11-08 22:54:31.291957 |
# |                       4 | capitulos_de_livro        | Capítulos de Livros         | evidencia |       100 | 2023-11-08 22:54:31.292361 |
# |                       5 | livros                    | Livros                      | evidencia |       100 | 2023-11-08 22:54:31.294081 |
# |                       6 | infraestruturas           | Infraestruturas             | evidencia |       100 | 2023-11-08 22:54:31.295055 |
# |                       7 | documentos                | Documentos                  | evidencia |       100 | 2023-11-08 22:54:31.295377 |
# |                       8 | propriedades_intelectuais | Propriedades Intelectuais   | evidencia |       100 | 2023-11-08 22:54:31.295644 |
# |                       9 | orientacoes               | Orientações                 | evidencia |       100 | 2023-11-08 22:54:31.295950 |
# |                      10 | material_didatico         | Material Didático           | evidencia |       100 | 2023-11-08 22:54:31.296217 |
# |                      11 | processos                 | Processos                   | evidencia |       100 | 2023-11-08 22:54:31.296455 |
# |                      12 | produtos_tecnologicos     | Produtos Tecnológicos       | evidencia |       100 | 2023-11-08 22:54:31.296752 |
# |                      13 | formacoes                 | Formações                   | evidencia |       100 | 2023-11-08 22:54:31.297734 |
# |                      14 | periodicos                | Periódicos                  | veiculo   |       100 | 2023-11-08 22:54:31.298061 |
# |                      15 | INPI                      | INPI                        | veiculo   |       100 | 2023-11-08 22:54:31.298683 |
# |                      16 | SEI                       | SEI                         | veiculo   |       100 | 2023-11-08 22:54:31.298981 |
# |                      17 | eventos                   | Eventos                     | veiculo   |       100 | 2023-11-08 22:54:31.299290 |
# |                      18 | imprensa                  | Imprensa                    | veiculo   |       100 | 2023-11-08 22:54:31.299545 |
# |                      19 | imprensa oficial          | Imprensa                    | veiculo   |       100 | 2023-11-08 22:54:31.300432 |
# |                      20 | redes_sociais             | Redes Sociais               | veiculo   |       100 | 2023-11-08 22:54:31.300790 |
# +-------------------------+---------------------------+-----------------------------+-----------+-----------+----------------------------+


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_ISBN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISBN"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_VOLUME", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "VOLUME"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_NUMERO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_PAGINA_INICIAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_INICIAL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_PAGINA_FINAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_FINAL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_ANO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ANO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_MES", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "MES"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_DIA", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DIA"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_TITULO_PERIODICO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_PERIODICO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("artigos_TITULO_ARTIGO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "artigos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_ARTIGO"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("servico_publico_CIDADE", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "CIDADE"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("servico_publico_ESTADO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ESTADO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("servico_publico_PAIS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAIS"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("servico_publico_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("servico_publico_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_CIDADE", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "CIDADE"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_ESTADO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ESTADO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_PAIS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAIS"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_DIA", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DIA"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_MES", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "MES"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_ANO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ANO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("apresentacoes_TITULO_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "apresentacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_EVENTO"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_ISBN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISBN"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_VOLUME", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "VOLUME"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_NUMERO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_PAGINA_INICIAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_INICIAL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_PAGINA_FINAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_FINAL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_ANO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ANO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_MES", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "MES"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_DIA", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DIA"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("capitulos_de_livro_TITULO_LIVRO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "capitulos_de_livro"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_LIVRO"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_ISBN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISBN"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_VOLUME", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "VOLUME"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_NUMERO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_NUMERO_DE_PAGINAS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO_DE_PAGINAS"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_EDICAO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "EDICAO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_ANO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ANO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_MES", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "MES"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_DIA", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DIA"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("periodicos_ISSN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISSN"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "SEI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_TIPO_DOCUMENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TIPO_DOCUMENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_CIDADE", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "CIDADE"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_PAIS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAIS"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));





