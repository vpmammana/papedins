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
		descricao varchar(500),
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
		valor varchar(255),
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

INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("ISBN");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("DOI");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("ISSN");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("SEI");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("HASH_FILE");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("HASH_URL");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("URL");
INSERT INTO tipos_de_identificadores (nome_tipo_de_identificador) VALUES ("FILE");


#	    titulo VARCHAR(255),
#    	autor VARCHAR(255),
#    	data_evidencia DATE
#		doi varchar(255) unique,
# 		isbn varchar(255) unique,
#		issn varchar(255) unique,
#		hash_file varchar(64) unique,
#		hash_url varchar(64) url,
#		url text;


