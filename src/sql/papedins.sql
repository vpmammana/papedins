DROP DATABASE IF EXISTS papedins;

CREATE DATABASE papedins;

GRANT ALL PRIVILEGES ON papedins.* TO victor@localhost;

USE papedins;


CREATE TABLE registrados (
		id_chave_registrado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nome_registrado varchar(200),
		email varchar(200),
		cpf varchar(20),
		hash varchar(100),
		time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
		unique (nome_registrado),
		unique (email),
		unique (cpf),
		unique (hash)
);

CREATE TABLE grupos (
	id_chave_grupo  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_grupo varchar(200),
	n_max int comment "numero maximo de contabilizacoes. negativo significa sem limite",
	descricao varchar(2000),
	unique (nome_grupo)
);
		
CREATE TABLE quesitos (
	id_chave_quesito  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_quesito varchar(200),
	sigla varchar(2),
	id_grupo int,
	descricao varchar(2000),
	unique (nome_quesito),
	unique (sigla),
	FOREIGN KEY (id_grupo) REFERENCES grupos(id_chave_grupo)
);


CREATE TABLE contabilizar_para_registrados (
	id_chave_contabilizar_para_registrado int not null auto_increment primary key,
	nome_contabilizar_para_registrado varchar(100),
	id_registrado int,
	id_quesito int,
	contabilizar varchar(20), # contabilizar tem 3 valores: default (contabliza se n_max de grupos for <0), SIM, NAO. SIM forca contabilizar (escolhido pelo usuario), NAO FORCA NAO CONTABILIZAR
	unique(id_registrado, id_quesito),
	unique(nome_contabilizar_para_registrado),
	FOREIGN KEY (id_registrado) REFERENCES registrados(id_chave_registrado),
	FOREIGN KEY (id_quesito) REFERENCES quesitos(id_chave_quesito)
);

CREATE TABLE opcoes (
	id_chave_opcao  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_opcao varchar(200),
	descricao varchar(2000),
	id_quesito int,
	pontuacao int,
	tipo varchar(10),
	unique (nome_opcao, id_quesito),
	FOREIGN KEY (id_quesito) REFERENCES quesitos(id_chave_quesito)
);

CREATE TABLE valores (
	id_chave_valores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_valor varchar(200),
	id_registrado int,
	id_quesito int,
	id_opcao int,
	valor float,
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(id_registrado, id_quesito),
	FOREIGN KEY (id_registrado) REFERENCES registrados(id_chave_registrado),
	FOREIGN KEY (id_quesito) REFERENCES quesitos(id_chave_quesito),
	FOREIGN KEY (id_opcao) REFERENCES opcoes(id_chave_opcao)
);

CREATE TABLE valores (
	id_chave_valores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_valor varchar(200),
	id_registrado int,
	id_quesito int,
	id_opcao int,
	valor float,
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(id_registrado, id_quesito),
	FOREIGN KEY (id_registrado) REFERENCES registrados(id_chave_registrado),
	FOREIGN KEY (id_quesito) REFERENCES quesitos(id_chave_quesito),
	FOREIGN KEY (id_opcao) REFERENCES opcoes(id_chave_opcao)
);

CREATE TABLE tipos_flexoes ( # desinencias
	id_chave_tipo_flexao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_tipo_flexao varchar(200), 
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_token);
);

INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("radical");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("singular_feminino");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("singular_masculino");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("singular_neutro");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("plural_feminino");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("plural_masculino");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("plural_neutro");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("substantivação");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("agentivação"); # substantivo de agente
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("infinitivo");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("passado");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("presente");
INSERT INTO tipos_flexoes (nome_tipo_flexao) VALUES ("particípio");

CREATE TABLE tipos_tokens (
	id_chave_tipo_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_tipo_token varchar(200), 
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_token);
);


INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("verbo");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("substantivo");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("preposição");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("adjetivo");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("pronome");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("artigo");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("conjunção");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("interjeição");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("numeral");
INSERT INTO tipos_tokens (nome_tipo_token) VALUES ("advérbio");


CREATE TABLE tokens (
	id_chave_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_token varchar(200), # token no infinitivo
	id_tipo_token int,
	id_raiz int;
	id_tipo_flexao int;
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_token);
	FOREIGN KEY (id_tipo_token) REFERENCES tipos_tokens(id_chave_tipo_token),
	FOREIGN KEY (id_raiz) REFERENCES tokens(id_chave_token),
	FOREIGN KEY (id_tipo_flexao) REFERENCES tokens(id_chave_tipo_flexao)
);

INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("elaborar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);    
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("publicar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("avaliar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("revisar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("planejar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("gerir", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("participar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apresentar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabelecer", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("credenciar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apoiar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("realizar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("desenvolver", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("atuar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);             
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("supervisionar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("especificar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("informar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("proceder", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("contratar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("relatar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("propor", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("indexar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("debater", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("reunir", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("fomentar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("trabalhar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("comprar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("processar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("entregar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("pesquisar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "infinitivo"), NULL);

INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("elaboração", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="elaborar"));    
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("publicação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="publicar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("avaliação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="avaliar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("revisão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="revisar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("planejamento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="planejar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("gestão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="gerir"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("participação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="participar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apresentação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="apresentar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabelecimento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="estabelecer"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("credenciamento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="credenciar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apoio", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="apoiar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("realização", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="realizar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("desenvolvimento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="desenvolver"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("atuação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="atuar"));             
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("supervisão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="supervisionar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("especificação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="especificar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("informação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="informar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("procedimento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="proceder")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("contratação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="contratar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("relato", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="relatar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("proposição", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="propor")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("indexação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="indexar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("debate", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="debater")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("reunião", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="reunir")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("fomento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="fomentar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("trabalho", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="trabalhar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("compra", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="comprar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("processamento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="processar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("entrega", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="entregar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("pesquisa", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="pesquisar")); 

INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("elaborei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="elaborar"));    
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("publiquei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="publicar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("avaliei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="avaliar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("revisei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="revisar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("planejei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="planejar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("geri", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="gerir"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("participei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="participar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apresentei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="apresentar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabeleci", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="estabelecer"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("credenciei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="credenciar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apoiei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="apoiar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("realizei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="realizar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("desenvolvi", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="desenvolver"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("atuei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="atuar"));             
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("supervisionei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="supervisionar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("especifiquei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="especificar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("informei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="informar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("procedi", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="proceder")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("contratar", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="contratar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("relatei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="relatar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("propús", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="propor")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("indexei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="indexar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("reuní", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="reunir")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("fomentei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="fomentar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("trabalhei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="trabalhar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("processei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="processar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("entreguei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="entregar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("pesquisei", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "passado"), (SELECT id_chave_token FROM tokens WHERE nome_token="pesquisar")); 

INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("elaborado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="elaborar"));    
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("publicado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="publicar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("avaliado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="avaliar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("revisado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="revisar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("planejado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="planejar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("gerido", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="gerir"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("participado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="participar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apresentado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="apresentar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabeleciido", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="estabelecer"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("credenciado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="credenciar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apoiado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="apoiar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("realizado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="realizar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("desenvolvido", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="desenvolver"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("atuado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="atuar"));             
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("supervisionado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="supervisionar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("especificado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="especificar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("informado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="informar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("procedido", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="proceder")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("contratado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="contratar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("relatado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="relatar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("proposto", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="propor")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("indexado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="indexar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("reunido", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="reunir")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("fomentado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="fomentar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("trabalhado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="trabalhado")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("processado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="processar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("entregue", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="entregar")); 
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("pesquisado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "verbo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "particípio"), (SELECT id_chave_token FROM tokens WHERE nome_token="pesquisar")); 


INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("artigo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("livro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("capítulo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("apostila", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("cartilha", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("material", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("relatório", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="relatar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("peça", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("atividade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("conteúdo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("proposta", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="propor"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("periódico", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("projeto", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("órgão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("parecer", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("didático", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("comunidade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("meio", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("Fundacentro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("congresso", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("seminário", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("oficina", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("convenção", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("CNPq", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("FAPESP", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("FINEP", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("saúde", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("segurança", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("comissão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("evento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "agentivação"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("trabalhador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "substantivação"), (SELECT id_chave_token FROM tokens WHERE nome_token="trabalhar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("infraestrutura", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("laboratório", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("parceiro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("equipamento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("serviço", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("processo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("grupo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("rede", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("pesquisador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "agentivação"),  (SELECT id_chave_token FROM tokens WHERE nome_token="pesquisar"));
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("curso", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("disciplina", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("modalidade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("finalidade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("programa", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("pós-graduação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("bolsista", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("nível", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("iniciação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("mestrado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("doutorado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("extensão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("visitante", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("colaborador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("banca", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("examinador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("conselho", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("universidade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("graduação", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("tema", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("norma", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("diretriz", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estratégico", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("desenvolvimento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("organizador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("conferência", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("ensino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("palestra", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("método", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("forma", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("conhecimento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("demanda", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("sociedade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("caráter", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("instrumento", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("proteção", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("interesse", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("coleta", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("análise", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("banco", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("dado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("história", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("atividade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("autoridade", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("competência", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("ministério", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("judiciário", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("controlador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("união", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("procurador", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("polícia", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("comissão", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("EPI", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("software", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("EPC", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("aplicativo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("fórum", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
NSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabelecer", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabelecer", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);
INSERT INTO tokens (nome_token, id_tipo_token, id_tipo_flexao, id_raiz) VALUES ("estabelecer", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token = "substantivo"), (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao = "radical"), NULL);


INSERT INTO grupos (nome_grupo, descricao, n_max) VALUES ("GERAL","Não tem restricao no número de contabilizações de pontuação",-1);
INSERT INTO grupos (nome_grupo, descricao, n_max) VALUES ("EXPERIÊNCIA","Máximo de 2 quesitos são contabilizados",3);

INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Titulação"					, "A", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="GERAL")		, "Títulos Acadêmicos");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência Profissional"	, "B", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="GERAL")		, "Número de anos");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com Educação"	, "C", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="GERAL")	, "Número de anos");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com STEAM"		, "D", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com Desenvolvimento WEB", "E", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com Produção Audiovisual", "F", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Audiovisuais produzidos", "G", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com Linguagens de Programação Pedagógicas", "H", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Participação em Oficinas STEM-STEAM", "I", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Orientações (IC, TCC, Mestrado ou Doutorado)", "J", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com Gestão de Projetos ou Equipes", "K", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
INSERT INTO quesitos ( nome_quesito, sigla, id_grupo, descricao) VALUES ( "Experiência com Projetos Culturais", "L", (SELECT id_chave_grupo FROM grupos WHERE nome_grupo="EXPERIÊNCIA"), "");
# default significa que vai seguir o valor de n_max de grupos



INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="A"), 20, "Doutorado");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="A"), 16, "Mestrado");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="A"), 14, "Especialização");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="A"), 12, "Graduação");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="A"), 0, "Não declarado"); # precisa ter nao declarado para todos os quesitos

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="B"), 20, "Acima de 10 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="B"),  16, "Entre 5 e 9 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="B"),  12, "Entre 3 e 4 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="B"),  6, "Entre 1 e 2 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="B"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="C"), 30, "Acima de 10 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="C"),  24, "Entre 5 e 9 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="C"),  18, "Entre 3 e 4 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="C"),  9, "Entre 1 e 2 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="C"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="D"), 30, "Acima de 10 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="D"),  24, "Entre 5 e 9 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="D"),  18, "Entre 3 e 4 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="D"),  9, "Entre 1 e 2 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="D"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="E"), 30, "Acima de 10 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="E"),  24, "Entre 5 e 9 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="E"),  18, "Entre 3 e 4 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="E"),  9, "Entre 1 e 2 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="E"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="F"), 20, "Acima de 10 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="F"),  16, "Entre 5 e 9 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="F"),  12, "Entre 3 e 4 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="F"),  6, "Entre 1 e 2 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="F"),  0, "Não declarado");

#INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("CONTINUO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="G"),  0, "Quantidade");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="G"),  60, "acima de 100 audiovisuais");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="G"),  40, "de 21 a 40 audiovisuais");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="G"),  20, "de 11 a 20 audiovisuais");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="G"),  10, "de 1 a 10 audiovisuais");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="G"),  0, "Não declarado");


INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="H"),  120, "acima de 100 projetos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="H"),  70, "de 41 a 100 projetos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="H"),  30, "de 21 a 40 projetos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="H"),  15, "de 11 a 20 projetos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="H"),  5, "de 1 a 10 projetos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="H"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="I"),  300, "acima de 100 oficinas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="I"),  140, "de 41 a 100 oficinas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="I"),  60, "de 11 a 40 oficinas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="I"),  20, "de 1 a 10 oficinas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="I"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="J"),  300, "acima de 100 orientações");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="J"),  140, "de 41 a 100 orientações");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="J"),  60, "de 11 a 40 orientações");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="J"),  20, "de 1 a 10 orientações");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="J"),  0, "Não declarado");

#INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("CONTINUO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="J"),  0, "Quantidade");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="K"), 300, "Acima de 100 pessoas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="K"),  100, "Entre 50 e 99 pessoas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="K"),  45, "Entre 20 e 49 pessoas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="K"),  20, "Entre 1 e 19 pessoas");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="K"),  0, "Não declarado");

INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="L"),  80, "Acima de 10 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="L"),  60, "Entre 5 e 9 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="L"),  40, "Entre 3 e 4 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="L"),  20, "Entre 1 e 2 anos");
INSERT INTO opcoes (tipo, descricao, id_quesito, pontuacao, nome_opcao) VALUES ("DISCRETO", "", (SELECT id_chave_quesito FROM quesitos WHERE sigla="L"),  0, "Não declarado");


