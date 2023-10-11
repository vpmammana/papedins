
start transaction;
delete from frases;


INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('analisar artigo científico para congresso externo',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('analisar', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo científico para congresso externo'), (SELECT id_chave_token FROM tokens WHERE nome_token='analisar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo científico para congresso externo'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo científico para congresso externo'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo científico para congresso externo'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('congresso', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo científico para congresso externo'), (SELECT id_chave_token FROM tokens WHERE nome_token='congresso' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('externo', (SELECT id_chave_frase FROM frases where nome_frase='analisar artigo científico para congresso externo'), (SELECT id_chave_token FROM tokens WHERE nome_token='externo' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apostilamento para análise bibliográfica da compra pública',13);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apostilamento', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='apostilamento' and id_tipo_token='3'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('análise', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='análise' and id_tipo_token='3'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('bibliográfica', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='bibliográfica' and id_tipo_token='7'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('da', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='da' and id_tipo_token='5'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('compra', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='compra' and id_tipo_token='3'), 5);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('pública', (SELECT id_chave_frase FROM frases where nome_frase='apostilamento para análise bibliográfica da compra pública'), (SELECT id_chave_token FROM tokens WHERE nome_token='pública' and id_tipo_token='7'), 6);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('participação em congresso contábil de interesse público',13);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('participação', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='participação' and id_tipo_token='3'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('congresso', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='congresso' and id_tipo_token='3'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('contábil', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='contábil' and id_tipo_token='7'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('interesse', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='interesse' and id_tipo_token='3'), 5);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('público', (SELECT id_chave_frase FROM frases where nome_frase='participação em congresso contábil de interesse público'), (SELECT id_chave_token FROM tokens WHERE nome_token='público' and id_tipo_token='7'), 6);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apoio para congresso científico de atividade estendida',13);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apoio', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='apoio' and id_tipo_token='3'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('congresso', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='congresso' and id_tipo_token='3'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('atividade', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='atividade' and id_tipo_token='3'), 5);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('estendida', (SELECT id_chave_frase FROM frases where nome_frase='apoio para congresso científico de atividade estendida'), (SELECT id_chave_token FROM tokens WHERE nome_token='estendida' and id_tipo_token='7'), 6);

commit;
