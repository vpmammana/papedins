DROP TABLE IF EXISTS autores_evidencias;
DROP TABLE IF EXISTS veiculos_tipos_de_identificadores;
DROP TABLE IF EXISTS evidencias_tipos_de_identificadores;
DROP TABLE IF EXISTS evidencias;
DROP TABLE IF EXISTS veiculos; 
DROP TABLE IF EXISTS tipos_de_identificadores; 
DROP TABLE IF EXISTS tipos_de_veiculos; 
DROP TABLE IF EXISTS tipos_de_evidencias;
DROP TABLE IF EXISTS duplos_tokens_para_grupos_de_tokens;


CREATE TABLE duplos_tokens_para_grupos_de_tokens (
        id_chave_duplo_token_para_grupo_de_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome_duplo_token_para_grupo_de_token varchar(200),
        acentuada varchar(200),
	id_grupo_de_token int,
	id_token_evidencia int,
	id_token_veiculo int,
        time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        unique(nome_duplo_token_para_grupo_de_token),
        FOREIGN KEY (id_grupo_de_token) REFERENCES grupos_de_tokens(id_chave_grupo_de_token), 
	FOREIGN KEY (id_token_evidencia) REFERENCES tokens(id_chave_token),
	FOREIGN KEY (id_token_veiculo) REFERENCES tokens(id_chave_token)
);




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

CREATE TABLE tipos_de_validacoes_regexp (
    id_chave_tipo_de_validacao_regexp INT AUTO_INCREMENT PRIMARY KEY,
    nome_tipo_de_validacao_regexp VARCHAR(255) NOT NULL,
    nome_tipo_de_validacao_regexp_underline VARCHAR(255) NOT NULL,
    `regexp` TEXT NOT NULL,
    exemplo_de_preenchimento TEXT,
    unique(nome_tipo_de_validacao_regexp_underline)
);



CREATE TABLE tipos_de_identificadores ( # identificadores de evidencias e veiculos (ISBN, ISSN, DOI, etc)
		id_chave_tipo_de_identificador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_tipo_de_identificador varchar(200),
		requerido boolean DEFAULT FALSE, # se o identificador é requerido ou não (e.g. ISBN é requerido, volume não é)
		descricao varchar(500),
		nivel_exposicao int DEFAULT 0, # indica o nivel de exposicao do identificador (e.g. ISBN é 100, DOI é 50, URL é 0)
		ordem_exposicao int,
		tabela_externa varchar(255) DEFAULT NULL, # pode ocorrer de se tratar de uma chave externa
		nome_campo_da_chave_primaria_externa varchar(255) DEFAULT NULL,
		nome_campo_do_nome_externo varchar(255) DEFAULT NULL,
		id_tipo_de_validacao_regexp int DEFAULT NULL,
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_tipo_de_identificador),
		Foreign Key (id_tipo_de_validacao_regexp) REFERENCES tipos_de_validacoes_regexp(id_chave_tipo_de_validacao_regexp)
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
		latitude DECIMAL(10, 8), # latitude da evidencia
		longitude DECIMAL(11, 8), # longitude da evidencia
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

CREATE TABLE tipos_niveis_formacoes ( 
		id_chave_tipo_nivel_formacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_tipo_nivel_formacao varchar(500), #titulo da tipo_nivel_formacao
		descricao varchar(500),
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_tipo_nivel_formacao)
);

INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Ensino Fundamental", "Ensino Fundamental");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Ensino Médio", "Ensino Médio");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Ensino Técnico", "Ensino Técnico");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Curso Livre", "Curso Livre");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Graduação", "Graduação");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Especialização", "Especialização");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Mestrado", "Mestrado");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Doutorado", "Doutorado");
INSERT INTO tipos_niveis_formacoes (nome_tipo_nivel_formacao, descricao) VALUES ("Pós-Doutorado", "Pós-Doutorado");

INSERT INTO tipos_de_validacoes_regexp (nome_tipo_de_validacao_regexp, nome_tipo_de_validacao_regexp_underline, `regexp`, exemplo_de_preenchimento) VALUES
('Data Invertida (YYYY-MM-DD)', 'Data_Invertida_YYYY_MM_DD', '^\\d{4}-\\d{2}-\\d{2}$', '2023-01-01'),
('Data Normal (DD/MM/YYYY)', 'Data_Normal_DD_MM_YYYY', '^\\d{2}/\\d{2}/\\d{4}$', '01/01/2023'),
('CPF', 'CPF', '^\\d{11}$', '12345678901'),
('DOI', 'DOI', '^1(0(\\.\\d{0,9}(\\/[-._;()\\/:A-Za-z0-9]*)?)?)?$' , '10.1234/abcd1234'),
('ISSN', 'ISSN', '^\\d{4}-\\d{3}[\\dX]$', '0378-5955'),
('ISBN', 'ISBN', '^(?:\\d{9}[\\dX]|\\d{13})$', '978-3-16-148410-0'),
('RG', 'RG', '^\\d{7,11}$', '12345678'),
('URL', 'URL', '^(https?:\\/\\/)?([\\da-z.-]+)\\.([a-z.]{2,6})([\\/\\w .-]*)*\\/?$', 'https://www.example.com'),
('SEI', 'SEI', '^\\d{4}\\.\\d{5}/\\d{4}-\\d{2}$', '2023.00010/2023-01'),
('Processo SEI', 'Processo_SEI', '^\\d{4}-\\d{2}/\\d{6}$', '2023-01/000001');


# este regexp funciona para DOI mas ele da unmatch quando comeca digitando 1. Ele so comeca a dar match depois que digita o segundo digito /^1(0(\.\d{0,9}(\/[-._;()\/:A-Za-z0-9]*)?)?)?$/

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
		id_tipo_de_identificador int DEFAULT 0,
		relevancia int, 
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

# eu vou colocar FALSE para todos os requeridos porque isso deveria ser uma relação N para N, porque dependendo da evidência pode ser requerido ou não
# por exemplo, SEI é requerido para documentos, mas não é requerido para artigos, podendo ser útil para artigos
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("ISBN", FALSE, 100, 0, (select id_chave_tipo_de_validacao_regexp from tipos_de_validacoes_regexp where nome_tipo_de_validacao_regexp_underline = "ISBN"));
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("DOI", FALSE, 90, 5, (select id_chave_tipo_de_validacao_regexp from tipos_de_validacoes_regexp where nome_tipo_de_validacao_regexp_underline = "DOI"));
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp ) VALUES ("ISSN", FALSE, 50, 10, (select id_chave_tipo_de_validacao_regexp from tipos_de_validacoes_regexp where nome_tipo_de_validacao_regexp_underline = "ISSN"));
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("SEI", FALSE, 100, 2, (select id_chave_tipo_de_validacao_regexp from tipos_de_validacoes_regexp where nome_tipo_de_validacao_regexp_underline = "SEI"));
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("PROCESSO_SEI", FALSE, 100, 2, (select id_chave_tipo_de_validacao_regexp from tipos_de_validacoes_regexp where nome_tipo_de_validacao_regexp_underline = "PROCESSO_SEI"));
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("TIPO_DOCUMENTO", FALSE, 90,4, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("HASH_FILE", FALSE, 0,100, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("HASH_URL", FALSE, 0, 150, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("URL", FALSE, 55, 15, (select id_chave_tipo_de_validacao_regexp from tipos_de_validacoes_regexp where nome_tipo_de_validacao_regexp_underline = "URL"));
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("FILE", FALSE, 10, 200, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("ESTADO", FALSE, 90, 31, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("CIDADE", FALSE, 80, 30, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("PAIS", FALSE, 100, 32, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("VOLUME", FALSE, 0, 300, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("NUMERO", FALSE, 0, 301, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("NUMERO_DE_PAGINAS", FALSE, 0, 302, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("EDICAO", FALSE, 0, 350, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("PAGINA_INICIAL", FALSE,0, 303, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("PAGINA_FINAL", FALSE,0, 304, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("TITULO_EVENTO", FALSE, 100, 304, NULL);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo, ordem_exposicao) VALUES ("TITULO_PERIODICO", FALSE, 100, "journals", "id_chave_journal", "nome_journal", 4);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("DATA_INICIAL_EVENTO", FALSE, 100, 6, (SELECT id_chave_tipo_de_validacao_regexp FROM tipos_de_validacoes_regexp WHERE nome_tipo_de_validacao_regexp_underline = "Data_Invertida_YYYY_MM_DD"));	
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, ordem_exposicao, id_tipo_de_validacao_regexp) VALUES ("DATA_FINAL_EVENTO", FALSE, 100, 7, (SELECT id_chave_tipo_de_validacao_regexp FROM tipos_de_validacoes_regexp WHERE nome_tipo_de_validacao_regexp_underline = "Data_Invertida_YYYY_MM_DD"));	
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo, ordem_exposicao) VALUES ("INSTITUICAO_RESPONSAVEL", FALSE, 100, "instituicoes", "id_chave_instituicao", "nome_instituicao", 24);
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador, requerido, nivel_exposicao, tabela_externa, nome_campo_da_chave_primaria_externa, nome_campo_do_nome_externo, ordem_exposicao) VALUES ("NIVEL_FORMACAO", FALSE, 100, "tipos_niveis_formacoes", "id_chave_tipo_nivel_formacao", "nome_tipo_nivel_formacao", 24);

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


# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("publicacoes_em_periodicos_ISBN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISBN"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"),100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_VOLUME", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "VOLUME"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_NUMERO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_PAGINA_INICIAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_INICIAL"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_PAGINA_FINAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_FINAL"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_periodicos_TITULO_PERIODICO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_PERIODICO"), 100);

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("formacoes_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "formacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "SEI"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("formacoes_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "formacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("formacoes_DATA_FINAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "formacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_FINAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("formacoes_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "formacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("formacoes_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "formacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"),100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("formacoes_NIVEL_FORMACAO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "formacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NIVEL_FORMACAO"),100);



# publicacoes_em_eventos
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_eventos_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_eventos_TITULO_PERIODICO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_EVENTO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("publicacoes_em_eventos_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("publicacoes_em_eventos_DATA_FINAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_FINAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("publicacoes_em_eventos_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("publicacoes_em_eventos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "publicacoes_em_eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"),100);


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("servico_publico_CIDADE", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "CIDADE"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("servico_publico_ESTADO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ESTADO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("servico_publico_PAIS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAIS"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("servico_publico_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("servico_publico_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "servico_publico"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"), 100);

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("eventos_CIDADE", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "CIDADE"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("eventos_ESTADO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ESTADO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("eventos_PAIS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAIS"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("eventos_TITULO_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_EVENTO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_DATA_FINAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_FINAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("eventos_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "eventos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("orientacoes_CIDADE", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "CIDADE"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("orientacoes_ESTADO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ESTADO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("orientacoes_PAIS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAIS"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("orientacoes_TITULO_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_EVENTO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("orientacoes_DATA_INICIAL_EVENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DATA_INICIAL_EVENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("orientacoes_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "orientacoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));



INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_ISBN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISBN"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_VOLUME", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "VOLUME"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_NUMERO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_PAGINA_INICIAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_INICIAL"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_PAGINA_FINAL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PAGINA_FINAL"), -1);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_ANO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ANO"), 100);
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador, relevancia) VALUES ("capitulos_de_livro_TITULO_LIVRO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "editoracoes"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TITULO_LIVRO"), 100);

# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_ISBN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISBN"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_VOLUME", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "VOLUME"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_NUMERO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_NUMERO_DE_PAGINAS", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "NUMERO_DE_PAGINAS"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_EDICAO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "EDICAO"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_ANO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ANO"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_MES", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "MES"));
# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("livros_DIA", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "livros"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DIA"));


# INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("periodicos_ISSN", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "periodicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "ISSN"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("produtos_tecnologicos_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "produtos_tecnologicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "SEI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("produtos_tecnologicos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "produtos_tecnologicos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("processos_PROCESSO_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "processos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "PROCESSO_SEI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("processos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "processos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "SEI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_TIPO_DOCUMENTO", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "TIPO_DOCUMENTO"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("documentos_INSTITUICAO_RESPONSAVEL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "documentos"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "INSTITUICAO_RESPONSAVEL"));




INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("infraestruturas_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "infraestruturas"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "SEI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("infraestruturas_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "infraestruturas"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));

INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("imprensa_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "imprensa"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("redes_sociais_URL", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "redes_sociais"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "URL"));


INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("propriedades_intelectuais_SEI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "propriedades_intelectuais"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "SEI"));
INSERT INTO grupos_vs_identificadores (nome_grupo_vs_identificador, id_grupo_de_token, id_tipo_de_identificador) VALUES ("propriedades_intelectuais_DOI", (SELECT id_chave_grupo_de_token FROM grupos_de_tokens WHERE nome_grupo_de_token = "propriedades_intelectuais"), (SELECT id_chave_tipo_de_identificador FROM tipos_de_identificadores WHERE nome_tipo_de_identificador = "DOI"));




