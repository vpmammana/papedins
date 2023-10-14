
start transaction;
delete from frases;


INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apostilar contrato público para compra típica',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apostilar', (SELECT id_chave_frase FROM frases where nome_frase='apostilar contrato público para compra típica'), (SELECT id_chave_token FROM tokens WHERE nome_token='apostilar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('contrato', (SELECT id_chave_frase FROM frases where nome_frase='apostilar contrato público para compra típica'), (SELECT id_chave_token FROM tokens WHERE nome_token='contrato' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('público', (SELECT id_chave_frase FROM frases where nome_frase='apostilar contrato público para compra típica'), (SELECT id_chave_token FROM tokens WHERE nome_token='público' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='apostilar contrato público para compra típica'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('compra', (SELECT id_chave_frase FROM frases where nome_frase='apostilar contrato público para compra típica'), (SELECT id_chave_token FROM tokens WHERE nome_token='compra' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('típica', (SELECT id_chave_frase FROM frases where nome_frase='apostilar contrato público para compra típica'), (SELECT id_chave_token FROM tokens WHERE nome_token='típica' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('planejamento de gestão contábil do aplicativo contratual',13);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('planejamento', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='planejamento' and id_tipo_token='3'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('gestão', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='gestão' and id_tipo_token='3'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('contábil', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='contábil' and id_tipo_token='7'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('do', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='do' and id_tipo_token='5'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('aplicativo', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='aplicativo' and id_tipo_token='3'), 5);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('contratual', (SELECT id_chave_frase FROM frases where nome_frase='planejamento de gestão contábil do aplicativo contratual'), (SELECT id_chave_token FROM tokens WHERE nome_token='contratual' and id_tipo_token='7'), 6);

commit;
