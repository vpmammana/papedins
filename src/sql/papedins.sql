DROP DATABASE IF EXISTS papedins_db;

CREATE DATABASE papedins_db;

GRANT ALL PRIVILEGES ON papedins_db.* TO victor@localhost;

USE papedins_db;


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


CREATE TABLE tipos_flexoes ( # desinencias
	id_chave_tipo_flexao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_tipo_flexao varchar(200),
	acentuada varchar(200),
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_tipo_flexao),
	unique(acentuada)
);

INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("radical" , "radical");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("singular_feminino" , "singular_feminino");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("singular_masculino" , "singular_masculino");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("singular_neutro" , "singular_neutro");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("plural_feminino" , "plural_feminino");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("plural_masculino" , "plural_masculino");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("plural_neutro" , "plural_neutro");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("substantivacao" , "substantivação"); # transformar verbo em substantivo que denota a ação em si
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("agentivacao" , "agentivação"); # substantivo de agente
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("nominalizacao" , "nominalização"); # transformar verbo em substantivo concreto que denota o resultado da ação
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("infinitivo" , "infinitivo");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("passado" , "passado");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("presente" , "presente");
INSERT INTO tipos_flexoes (nome_tipo_flexao, acentuada) VALUES ("participio" , "particípio");

CREATE TABLE tipos_tokens (
	id_chave_tipo_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_tipo_token varchar(200),
	acentuada varchar(200),
	classe varchar(200), # aponta para a propria tabela, para indicar uma classe que a contem. Null seh eh uma classe superior
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_tipo_token),
	FOREIGN KEY (classe) REFERENCES tipos_tokens(nome_tipo_token)
);


INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("verbo" , "verbo");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("verbo_flexao_definida" , "verbo com flexão definida");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("substantivo" , "substantivo");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("substantivo_flexao_definida" , "substantivo com flexão definida");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("preposicao" , "preposição");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("preposicao_fixa" , "preposição instanciada num valor fixo");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("adjetivo" , "adjetivo");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("pronome" , "pronome");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("artigo" , "artigo");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("conjuncao" , "conjunção");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("interjeicao" , "interjeição");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("numeral" , "numeral");
INSERT INTO tipos_tokens (nome_tipo_token, acentuada) VALUES ("adverbio" , "advérbio");

UPDATE tipos_tokens SET classe="verbo" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "verbo%" or nome_tipo_token = "verbo";
UPDATE tipos_tokens SET classe="substantivo" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "substantivo%"  or nome_tipo_token = "substantivo";
UPDATE tipos_tokens SET classe="preposicao" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "preposicao%"  or nome_tipo_token = "preposicao";
UPDATE tipos_tokens SET classe="adjetivo" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "adjetivo%"  or nome_tipo_token = "adjetivo";
UPDATE tipos_tokens SET classe="pronome" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "pronome%"  or nome_tipo_token = "pronome";
UPDATE tipos_tokens SET classe="artigo" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "artigo%"  or nome_tipo_token = "artigo";
UPDATE tipos_tokens SET classe="conjuncao" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "conjuncao%"  or nome_tipo_token = "conjuncao";
UPDATE tipos_tokens SET classe="interjeicao" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "interjeicao%"  or nome_tipo_token = "interjeicao";
UPDATE tipos_tokens SET classe="numeral" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "numeral%"  or nome_tipo_token = "numeral";
UPDATE tipos_tokens SET classe="adverbio" where SUBSTRING(nome_tipo_token, 1, LOCATE("_", nome_tipo_token)-1) like "adverbio%"  or nome_tipo_token = "adverbio";

CREATE TABLE tipos_flexoes_tipos_tokens (
	id_chave_tipo_flexao_tipo_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_tipo_flexao_tipo_token varchar(200), # token no infinitivo
	id_tipo_token int,
	id_tipo_flexao int,
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_tipo_flexao_tipo_token),
	unique(id_tipo_token, id_tipo_flexao),
	FOREIGN KEY (id_tipo_token) REFERENCES tipos_tokens(id_chave_tipo_token),
	FOREIGN KEY (id_tipo_flexao) REFERENCES tipos_flexoes(id_chave_tipo_flexao)
);


INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_infinitivo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="infinitivo") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_passado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="passado") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_presente", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="presente") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_participio", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="participio") );

INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_flexao_definida_infinitivo", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="infinitivo") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_flexao_definida_passado", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="passado") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_flexao_definida_presente", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="presente") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ("verbo_flexao_definida_participio", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="verbo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="participio") );



INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_singular_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_singular_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_singular_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_plural_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_plural_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_plural_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_substantivacao", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="substantivacao") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_agentivacao", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="agentivacao") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_nominalizacao", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="nominalizacao") );

INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_singular_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_singular_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_singular_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_plural_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_plural_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_plural_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_substantivacao", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="substantivacao") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_agentivacao", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="agentivacao") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "substantivo_flexao_definida_nominalizacao", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="substantivo_flexao_definida") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="nominalizacao") );

INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "adjetivo_singular_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="adjetivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "adjetivo_singular_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="adjetivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "adjetivo_singular_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="adjetivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "adjetivo_plural_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="adjetivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "adjetivo_plural_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="adjetivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "adjetivo_plural_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="adjetivo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_feminino") );

INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "preposicao_singular_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="preposicao") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "preposicao_singular_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="preposicao") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "preposicao_singular_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="preposicao") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "preposicao_plural_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="preposicao") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "preposicao_plural_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="preposicao") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "preposicao_plural_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="preposicao") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_feminino") );

INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "artigo_singular_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="artigo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "artigo_singular_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="artigo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "artigo_singular_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="artigo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="singular_feminino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "artigo_plural_neutro", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="artigo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_neutro") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "artigo_plural_masculino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="artigo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_masculino") );
INSERT INTO tipos_flexoes_tipos_tokens (nome_tipo_flexao_tipo_token, id_tipo_token, id_tipo_flexao) VALUES ( "artigo_plural_feminino", (SELECT id_chave_tipo_token FROM tipos_tokens WHERE nome_tipo_token="artigo") , (SELECT id_chave_tipo_flexao FROM tipos_flexoes WHERE nome_tipo_flexao ="plural_feminino") );



CREATE TABLE tipos_elementos_sintaticos (
	id_chave_tipo_elemento_sintatico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_tipo_elemento_sintatico varchar(200), # é o nome do tipo de sentença que a árvore sintática vai representar. É referido pelo elemento nao-terminal da arvore nested
	descricao varchar(1000),
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	unique(nome_tipo_elemento_sintatico)
);


INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("entrega infinitivo","entrega padrão constituída por um verbo que indica a ação realizada sobre um objeto. Esse tipo de sentença não tem sujeito porque o verbo está no infinitivo");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("entrega com sujeito","entrega padrão constituída por um verbo que indica a ação realizada por um sujeito sobre um objeto. Esse tipo de sentença tem sujeito");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("sujeito","É o sujeito a quem se refere o predicado");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("determinantes_do_sujeito","Fazem parte do sujeito, são as palavras que antecedem o núcleo do sujeito, como artigo, pronomes, numerais, etc.");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("nucleo_sujeito","É o núcleo do sujeito a quem se refere o predicado");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("modificadores_do_sujeito","É parte do Sujeito, são palavras que suscedem o sujeito para modificá-lo como adjetivos");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("predicado","É o predicado da sentença, que pode ser predicado verbal, nominal ou verbo-nominal");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("verbo_do_predicado","É parte do predicado, elemento central que denota uma ação do sujeito");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("objeto_do_predicado","É o predicado da sentença, que pode ser predicado verbal, nominal ou verbo-nominal");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("objeto_direto","É o objeto direto do objeto");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("objeto_indireto","É o objeto indireto do objeto");
INSERT INTO tipos_elementos_sintaticos (nome_tipo_elemento_sintatico, descricao) VALUES ("Lixeira","Lixeira pardão para jogar elementos descartados.");

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



