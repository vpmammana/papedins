DROP DATABASE IF EXISTS triagem;

CREATE DATABASE triagem;

GRANT ALL PRIVILEGES ON triagem.* TO victor@localhost;

USE triagem;


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


