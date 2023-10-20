
start transaction;
delete from frases;


INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apresentar trabalho científico em congresso científico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apresentar', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em congresso científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='apresentar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('trabalho', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em congresso científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='trabalho' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em congresso científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em congresso científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('congresso', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em congresso científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='congresso' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em congresso científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apresentar trabalho científico em seminário',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apresentar', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em seminário'), (SELECT id_chave_token FROM tokens WHERE nome_token='apresentar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('trabalho', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em seminário'), (SELECT id_chave_token FROM tokens WHERE nome_token='trabalho' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em seminário'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em seminário'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('seminário', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho científico em seminário'), (SELECT id_chave_token FROM tokens WHERE nome_token='seminário' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apresentar trabalho tecnológico em convenção',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apresentar', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho tecnológico em convenção'), (SELECT id_chave_token FROM tokens WHERE nome_token='apresentar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('trabalho', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho tecnológico em convenção'), (SELECT id_chave_token FROM tokens WHERE nome_token='trabalho' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('tecnológico', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho tecnológico em convenção'), (SELECT id_chave_token FROM tokens WHERE nome_token='tecnológico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho tecnológico em convenção'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('convenção', (SELECT id_chave_frase FROM frases where nome_frase='apresentar trabalho tecnológico em convenção'), (SELECT id_chave_token FROM tokens WHERE nome_token='convenção' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('publicar trabalho em periódico indexado',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('publicar', (SELECT id_chave_frase FROM frases where nome_frase='publicar trabalho em periódico indexado'), (SELECT id_chave_token FROM tokens WHERE nome_token='publicar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('trabalho', (SELECT id_chave_frase FROM frases where nome_frase='publicar trabalho em periódico indexado'), (SELECT id_chave_token FROM tokens WHERE nome_token='trabalho' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='publicar trabalho em periódico indexado'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('periódico', (SELECT id_chave_frase FROM frases where nome_frase='publicar trabalho em periódico indexado'), (SELECT id_chave_token FROM tokens WHERE nome_token='periódico' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('indexado', (SELECT id_chave_frase FROM frases where nome_frase='publicar trabalho em periódico indexado'), (SELECT id_chave_token FROM tokens WHERE nome_token='indexado' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('publicar capítulo em meio científico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('publicar', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo em meio científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='publicar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('capítulo', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo em meio científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='capítulo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo em meio científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('meio', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo em meio científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='meio' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo em meio científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('publicar artigo científico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('publicar', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='publicar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('publicar artigo tecnológico de relatório diverso',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('publicar', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo tecnológico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='publicar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo tecnológico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('tecnológico', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo tecnológico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='tecnológico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo tecnológico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('relatório', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo tecnológico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='relatório' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('diverso', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo tecnológico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='diverso' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('publicar artigo científico de relatório diverso',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('publicar', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='publicar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('relatório', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='relatório' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('diverso', (SELECT id_chave_frase FROM frases where nome_frase='publicar artigo científico de relatório diverso'), (SELECT id_chave_token FROM tokens WHERE nome_token='diverso' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('publicar capítulo de livro tecnológico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('publicar', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo de livro tecnológico'), (SELECT id_chave_token FROM tokens WHERE nome_token='publicar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('capítulo', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo de livro tecnológico'), (SELECT id_chave_token FROM tokens WHERE nome_token='capítulo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo de livro tecnológico'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('livro', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo de livro tecnológico'), (SELECT id_chave_token FROM tokens WHERE nome_token='livro' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('tecnológico', (SELECT id_chave_frase FROM frases where nome_frase='publicar capítulo de livro tecnológico'), (SELECT id_chave_token FROM tokens WHERE nome_token='tecnológico' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar conteúdo didático a Fundacentro',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a Fundacentro'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('conteúdo', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a Fundacentro'), (SELECT id_chave_token FROM tokens WHERE nome_token='conteúdo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('didático', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a Fundacentro'), (SELECT id_chave_token FROM tokens WHERE nome_token='didático' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('a', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a Fundacentro'), (SELECT id_chave_token FROM tokens WHERE nome_token='a' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('Fundacentro', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a Fundacentro'), (SELECT id_chave_token FROM tokens WHERE nome_token='Fundacentro' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar conteúdo didático a cartilha',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a cartilha'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('conteúdo', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a cartilha'), (SELECT id_chave_token FROM tokens WHERE nome_token='conteúdo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('didático', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a cartilha'), (SELECT id_chave_token FROM tokens WHERE nome_token='didático' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('a', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a cartilha'), (SELECT id_chave_token FROM tokens WHERE nome_token='a' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('cartilha', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a cartilha'), (SELECT id_chave_token FROM tokens WHERE nome_token='cartilha' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar conteúdo didático a apostila',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a apostila'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('conteúdo', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a apostila'), (SELECT id_chave_token FROM tokens WHERE nome_token='conteúdo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('didático', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a apostila'), (SELECT id_chave_token FROM tokens WHERE nome_token='didático' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('a', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a apostila'), (SELECT id_chave_token FROM tokens WHERE nome_token='a' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apostila', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático a apostila'), (SELECT id_chave_token FROM tokens WHERE nome_token='apostila' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('revisar artigo científico em periódico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('revisar', (SELECT id_chave_frase FROM frases where nome_frase='revisar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='revisar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='revisar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='revisar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='revisar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('periódico', (SELECT id_chave_frase FROM frases where nome_frase='revisar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='periódico' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('avaliar artigo científico em periódico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('avaliar', (SELECT id_chave_frase FROM frases where nome_frase='avaliar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='avaliar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('artigo', (SELECT id_chave_frase FROM frases where nome_frase='avaliar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='artigo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científico', (SELECT id_chave_frase FROM frases where nome_frase='avaliar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='científico' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('em', (SELECT id_chave_frase FROM frases where nome_frase='avaliar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='em' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('periódico', (SELECT id_chave_frase FROM frases where nome_frase='avaliar artigo científico em periódico'), (SELECT id_chave_token FROM tokens WHERE nome_token='periódico' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('planejar atividade de pesquisa',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('planejar', (SELECT id_chave_frase FROM frases where nome_frase='planejar atividade de pesquisa'), (SELECT id_chave_token FROM tokens WHERE nome_token='planejar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('atividade', (SELECT id_chave_frase FROM frases where nome_frase='planejar atividade de pesquisa'), (SELECT id_chave_token FROM tokens WHERE nome_token='atividade' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='planejar atividade de pesquisa'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('pesquisa', (SELECT id_chave_frase FROM frases where nome_frase='planejar atividade de pesquisa'), (SELECT id_chave_token FROM tokens WHERE nome_token='pesquisa' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar proposta de projeto interno',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('proposta', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='proposta' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('projeto', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='projeto' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('interno', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='interno' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('avaliar proposta de projeto interno',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('avaliar', (SELECT id_chave_frase FROM frases where nome_frase='avaliar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='avaliar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('proposta', (SELECT id_chave_frase FROM frases where nome_frase='avaliar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='proposta' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='avaliar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('projeto', (SELECT id_chave_frase FROM frases where nome_frase='avaliar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='projeto' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('interno', (SELECT id_chave_frase FROM frases where nome_frase='avaliar proposta de projeto interno'), (SELECT id_chave_token FROM tokens WHERE nome_token='interno' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar projeto de fomento',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar projeto de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('projeto', (SELECT id_chave_frase FROM frases where nome_frase='elaborar projeto de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='projeto' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='elaborar projeto de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('fomento', (SELECT id_chave_frase FROM frases where nome_frase='elaborar projeto de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='fomento' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar proposta de fomento',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('proposta', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='proposta' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('fomento', (SELECT id_chave_frase FROM frases where nome_frase='elaborar proposta de fomento'), (SELECT id_chave_token FROM tokens WHERE nome_token='fomento' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('elaborar conteúdo didático para livro',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('elaborar', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático para livro'), (SELECT id_chave_token FROM tokens WHERE nome_token='elaborar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('conteúdo', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático para livro'), (SELECT id_chave_token FROM tokens WHERE nome_token='conteúdo' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('didático', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático para livro'), (SELECT id_chave_token FROM tokens WHERE nome_token='didático' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('para', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático para livro'), (SELECT id_chave_token FROM tokens WHERE nome_token='para' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('livro', (SELECT id_chave_frase FROM frases where nome_frase='elaborar conteúdo didático para livro'), (SELECT id_chave_token FROM tokens WHERE nome_token='livro' and id_tipo_token='3'), 4);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('gerir periódico científico',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('gerir', (SELECT id_chave_frase FROM frases where nome_frase='gerir periódico científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='gerir' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('reunido', (SELECT id_chave_frase FROM frases where nome_frase='gerir periódico científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='reunido' and id_tipo_token='1'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('polícia', (SELECT id_chave_frase FROM frases where nome_frase='gerir periódico científico'), (SELECT id_chave_token FROM tokens WHERE nome_token='polícia' and id_tipo_token='3'), 2);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('participar de comissão científica',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('participar', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão científica'), (SELECT id_chave_token FROM tokens WHERE nome_token='participar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão científica'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('comissão', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão científica'), (SELECT id_chave_token FROM tokens WHERE nome_token='comissão' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('científica', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão científica'), (SELECT id_chave_token FROM tokens WHERE nome_token='científica' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('participar de comissão tecnológica',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('participar', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão tecnológica'), (SELECT id_chave_token FROM tokens WHERE nome_token='participar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão tecnológica'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('comissão', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão tecnológica'), (SELECT id_chave_token FROM tokens WHERE nome_token='comissão' and id_tipo_token='3'), 4);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('tecnológica', (SELECT id_chave_frase FROM frases where nome_frase='participar de comissão tecnológica'), (SELECT id_chave_token FROM tokens WHERE nome_token='tecnológica' and id_tipo_token='7'), 5);

INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('atuar estabelecimento formal de infraestrutura',1);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('atuar', (SELECT id_chave_frase FROM frases where nome_frase='atuar estabelecimento formal de infraestrutura'), (SELECT id_chave_token FROM tokens WHERE nome_token='atuar' and id_tipo_token='1'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('estabelecimento', (SELECT id_chave_frase FROM frases where nome_frase='atuar estabelecimento formal de infraestrutura'), (SELECT id_chave_token FROM tokens WHERE nome_token='estabelecimento' and id_tipo_token='3'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('formal', (SELECT id_chave_frase FROM frases where nome_frase='atuar estabelecimento formal de infraestrutura'), (SELECT id_chave_token FROM tokens WHERE nome_token='formal' and id_tipo_token='7'), 2);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('de', (SELECT id_chave_frase FROM frases where nome_frase='atuar estabelecimento formal de infraestrutura'), (SELECT id_chave_token FROM tokens WHERE nome_token='de' and id_tipo_token='5'), 3);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('infraestrutura', (SELECT id_chave_frase FROM frases where nome_frase='atuar estabelecimento formal de infraestrutura'), (SELECT id_chave_token FROM tokens WHERE nome_token='infraestrutura' and id_tipo_token='3'), 4);


# corrigindo o id_categoria da tabela frases 

UPDATE tokens_nas_frases SET id_categoria =21 WHERE ordem= 0 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 1); 
 UPDATE tokens_nas_frases SET id_categoria =24 WHERE ordem= 1 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 1); 
 UPDATE tokens_nas_frases SET id_categoria =25 WHERE ordem= 2 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 1); 
 UPDATE tokens_nas_frases SET id_categoria =28 WHERE ordem= 3 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 1); 
 UPDATE tokens_nas_frases SET id_categoria =29 WHERE ordem= 4 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 1); 
 UPDATE tokens_nas_frases SET id_categoria =30 WHERE ordem= 5 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 1); 
 
INSERT INTO frases (nome_frase, id_tipo_elemento_sintatico) VALUES ('apoio a análise',13);

INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('apoio', (SELECT id_chave_frase FROM frases where nome_frase='apoio a análise'), (SELECT id_chave_token FROM tokens WHERE nome_token='apoio' and id_tipo_token='3'), 0);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('a', (SELECT id_chave_frase FROM frases where nome_frase='apoio a análise'), (SELECT id_chave_token FROM tokens WHERE nome_token='a' and id_tipo_token='5'), 1);
INSERT INTO tokens_nas_frases (nome_token_na_frase, id_frase, id_token, ordem) VALUES ('análise', (SELECT id_chave_frase FROM frases where nome_frase='apoio a análise'), (SELECT id_chave_token FROM tokens WHERE nome_token='análise' and id_tipo_token='3'), 2);


# corrigindo o id_categoria da tabela frases 

UPDATE tokens_nas_frases SET id_categoria =33 WHERE ordem= 0 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 UPDATE tokens_nas_frases SET id_categoria =34 WHERE ordem= 1 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 UPDATE tokens_nas_frases SET id_categoria =35 WHERE ordem= 2 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 UPDATE tokens_nas_frases SET id_categoria =36 WHERE ordem= 3 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 UPDATE tokens_nas_frases SET id_categoria =37 WHERE ordem= 4 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 UPDATE tokens_nas_frases SET id_categoria =38 WHERE ordem= 5 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 UPDATE tokens_nas_frases SET id_categoria =39 WHERE ordem= 6 AND id_frase IN (SELECT id_chave_frase from frases where id_tipo_elemento_sintatico = 13); 
 
commit;
