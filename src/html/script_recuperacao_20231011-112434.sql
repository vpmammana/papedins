
start transaction;
delete from frases;


INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('analisar artigo correicional para autoridade contábil',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('analisar', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo correicional para autoridade contábil'), (SELECT id_chave_token FROM tokens WHERE nome_token='analisar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo correicional para autoridade contábil'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('correicional', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo correicional para autoridade contábil'), (SELECT id_chave_token FROM tokens WHERE nome_token='correicional' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo correicional para autoridade contábil'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('autoridade', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo correicional para autoridade contábil'), (SELECT id_chave_token FROM tokens WHERE nome_token='autoridade' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('contábil', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo correicional para autoridade contábil'), (SELECT id_chave_token FROM tokens WHERE nome_token='contábil' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apresentar aplicativo completo para comissão externa',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apresentar', (SELECT id_chave_frase FROM frases where nome_frase='apresentar aplicativo completo para comissão externa'), (SELECT id_chave_token FROM tokens WHERE nome_token='apresentar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('aplicativo', (SELECT id_chave_frase FROM frases where nome_frase='apresentar aplicativo completo para comissão externa'), (SELECT id_chave_token FROM tokens WHERE nome_token='aplicativo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('completo', (SELECT id_chave_frase FROM frases where nome_frase='apresentar aplicativo completo para comissão externa'), (SELECT id_chave_token FROM tokens WHERE nome_token='completo' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='apresentar aplicativo completo para comissão externa'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('comissão', (SELECT id_chave_frase FROM frases where nome_frase='apresentar aplicativo completo para comissão externa'), (SELECT id_chave_token FROM tokens WHERE nome_token='comissão' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('externa', (SELECT id_chave_frase FROM frases where nome_frase='apresentar aplicativo completo para comissão externa'), (SELECT id_chave_token FROM tokens WHERE nome_token='externa' and id_tipo_token='7'), 5);

commit;
