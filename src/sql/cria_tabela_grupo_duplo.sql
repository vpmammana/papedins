 
DROP TABLE IF EXISTS duplos_tokens_para_grupos_de_tokens;

CREATE TABLE duplos_tokens_para_grupos_de_tokens ( # tabela que relaciona uma dupla de tokens (evidencia, veiculo) com cada grupo de tokens
        id_chave_duplo_token_para_grupo_de_token INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome_duplo_token_para_grupo_de_token varchar(200),
        id_grupo_de_token int, 
        id_token_evidencia int,
        id_token_veiculo int,
        time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
        unique(nome_duplo_token_para_grupo_de_token),
	unique(id_grupo_de_token, id_token_evidencia, id_token_veiculo),
        FOREIGN KEY (id_grupo_de_token) REFERENCES grupos_de_tokens(id_chave_grupo_de_token), 
        FOREIGN KEY (id_token_evidencia) REFERENCES tokens(id_chave_token),
        FOREIGN KEY (id_token_veiculo) REFERENCES tokens(id_chave_token)
);

INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<artigos>[artigo]{periódico}", 1    ,  267 ,  277 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<artigos>[publicação]{periódico}", 1    ,   97 ,  277 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[análise]{SEI}", 4    ,  154 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[avaliação]{SEI}", 4    ,   98 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[bibliografia]{SEI}", 4    ,   93 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[contrato]{SEI}", 4    ,  119 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[credencial]{SEI}", 4    ,  108 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[dado]{SEI}", 4    ,  333 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[demanda]{SEI}", 4    ,  328 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[diretriz]{SEI}", 4    ,  323 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[especificação]{SEI}", 4    ,  115 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[método]{SEI}", 4    ,  325 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[norma]{SEI}", 4    ,  322 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[parecer]{SEI}", 4    ,  279 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[peça]{SEI}", 4    ,  273 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[planejamento]{SEI}", 4    ,  101 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[plano]{SEI}", 4    ,  102 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[procedimento]{SEI}", 4    ,  117 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[projeção]{SEI}", 4    ,  133 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[proposição]{SEI}", 4    ,  122 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[proposta]{SEI}", 4    ,  275 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[relatório]{SEI}", 4    ,  272 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[relato]{SEI}", 4    ,  120 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<documentos>[revisão]{SEI}", 4    ,   99 ,  249 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<editoracoes>[capítulo]{editoração}", 15   ,  269 ,   84 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<editoracoes>[livro]{editoração}", 15   ,  268 ,   84 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<editoracoes>[prefácio]{editoração}", 15   ,   76 ,   84 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{conferência}", 11   ,  105 ,  324 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{congresso}", 11   ,  105 ,  283 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{convenção}", 11   ,  105 ,  286 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{evento}", 11   ,  105 ,  293 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{extensão}", 11   ,  105 ,  312 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{fórum}", 11   ,  105 ,  347 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[apresentação]{oficina}", 11   ,  105 ,  285 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{conferência}", 11   ,  124 ,  324 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{congresso}", 11   ,  124 ,  283 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{convenção}", 11   ,  124 ,  286 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{evento}", 11   ,  124 ,  293 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{extensão}", 11   ,  124 ,  312 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{fórum}", 11   ,  124 ,  347 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[debate]{oficina}", 11   ,  124 ,  285 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{conferência}", 11   ,  147 ,  324 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{congresso}", 11   ,  147 ,  283 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{convenção}", 11   ,  147 ,  286 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{evento}", 11   ,  147 ,  293 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{extensão}", 11   ,  147 ,  312 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{fórum}", 11   ,  147 ,  347 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[palestra]{oficina}", 11   ,  147 ,  285 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{conferência}", 11   ,   75 ,  324 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{congresso}", 11   ,   75 ,  283 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{convenção}", 11   ,   75 ,  286 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{evento}", 11   ,   75 ,  293 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{extensão}", 11   ,   75 ,  312 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{fórum}", 11   ,   75 ,  347 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumoestendido]{oficina}", 11   ,   75 ,  285 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{conferência}", 11   ,   74 ,  324 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{congresso}", 11   ,   74 ,  283 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{convenção}", 11   ,   74 ,  286 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{evento}", 11   ,   74 ,  293 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{extensão}", 11   ,   74 ,  312 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{fórum}", 11   ,   74 ,  347 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[resumo]{oficina}", 11   ,   74 ,  285 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{conferência}", 11   ,   83 ,  324 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{congresso}", 11   ,   83 ,  283 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{convenção}", 11   ,   83 ,  286 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{evento}", 11   ,   83 ,  293 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{extensão}", 11   ,   83 ,  312 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{fórum}", 11   ,   83 ,  347 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<eventos>[vivência]{oficina}", 11   ,   83 ,  285 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[banca]{EAD}", 10   ,  314 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[banca]{escola}", 10   ,  314 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[banca]{faculdade}", 10   ,  314 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[banca]{universidade}", 10   ,  314 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[curso]{EAD}", 10   ,  302 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[curso]{escola}", 10   ,  302 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[curso]{faculdade}", 10   ,  302 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[curso]{universidade}", 10   ,  302 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[disciplina]{EAD}", 10   ,  303 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[disciplina]{escola}", 10   ,  303 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[disciplina]{faculdade}", 10   ,  303 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[disciplina]{universidade}", 10   ,  303 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[doutorado]{EAD}", 10   ,  311 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[doutorado]{escola}", 10   ,  311 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[doutorado]{faculdade}", 10   ,  311 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[doutorado]{universidade}", 10   ,  311 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[graduação]{EAD}", 10   ,  140 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[graduação]{escola}", 10   ,  140 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[graduação]{faculdade}", 10   ,  140 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[graduação]{universidade}", 10   ,  140 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[mestrado]{EAD}", 10   ,  310 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[mestrado]{escola}", 10   ,  310 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[mestrado]{faculdade}", 10   ,  310 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[mestrado]{universidade}", 10   ,  310 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[pós-graduação]{EAD}", 10   ,  142 ,  320 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[pós-graduação]{escola}", 10   ,  142 ,  319 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[pós-graduação]{faculdade}", 10   ,  142 ,  318 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<formacoes>[pós-graduação]{universidade}", 10   ,  142 ,  317 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[coluna]{jornal}", 12   ,  251 ,  398 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[coluna]{revista}", 12   ,  251 ,  248 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[coluna]{telejornal}", 12   ,  251 ,  436 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[notícia]{jornal}", 12   ,   77 ,  398 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[notícia]{revista}", 12   ,   77 ,  248 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[notícia]{telejornal}", 12   ,   77 ,  436 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[reportagem]{jornal}", 12   ,   78 ,  398 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[reportagem]{revista}", 12   ,   78 ,  248 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<imprensa>[reportagem]{telejornal}", 12   ,   78 ,  436 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<propriedades_intelectuais>[licenciamento]{INPI}", 5    ,   79 ,  250 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<propriedades_intelectuais>[modelodeutilidade]{INPI}", 5    ,   80 ,  250 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<propriedades_intelectuais>[patente]{INPI}", 5    ,   82 ,  250 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<propriedades_intelectuais>[registrodesoftware]{INPI}", 5    ,   81 ,  250 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{Facebook}", 14   ,  254 ,  259 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{Instagram}", 14   ,  254 ,  260 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{Kawai}", 14   ,  254 ,  263 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{SMS}", 14   ,  254 ,  265 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{SouGov}", 14   ,  254 ,  261 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{Telegram}", 14   ,  254 ,  266 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{TikTok}", 14   ,  254 ,  262 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{WhatsApp}", 14   ,  254 ,  264 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{X}", 14   ,  254 ,  258 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[live]{Youtube}", 14   ,  254 ,  257 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{Facebook}", 14   ,  253 ,  259 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{Instagram}", 14   ,  253 ,  260 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{Kawai}", 14   ,  253 ,  263 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{SMS}", 14   ,  253 ,  265 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{SouGov}", 14   ,  253 ,  261 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{Telegram}", 14   ,  253 ,  266 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{TikTok}", 14   ,  253 ,  262 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{WhatsApp}", 14   ,  253 ,  264 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{X}", 14   ,  253 ,  258 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[podcast]{Youtube}", 14   ,  253 ,  257 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{Facebook}", 14   ,  255 ,  259 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{Instagram}", 14   ,  255 ,  260 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{Kawai}", 14   ,  255 ,  263 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{SMS}", 14   ,  255 ,  265 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{SouGov}", 14   ,  255 ,  261 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{Telegram}", 14   ,  255 ,  266 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{TikTok}", 14   ,  255 ,  262 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{WhatsApp}", 14   ,  255 ,  264 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{X}", 14   ,  255 ,  258 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[post]{Youtube}", 14   ,  255 ,  257 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{Facebook}", 14   ,  256 ,  259 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{Instagram}", 14   ,  256 ,  260 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{Kawai}", 14   ,  256 ,  263 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{SMS}", 14   ,  256 ,  265 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{SouGov}", 14   ,  256 ,  261 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{Telegram}", 14   ,  256 ,  266 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{TikTok}", 14   ,  256 ,  262 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{WhatsApp}", 14   ,  256 ,  264 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{X}", 14   ,  256 ,  258 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[tweet]{Youtube}", 14   ,  256 ,  257 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{Facebook}", 14   ,  252 ,  259 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{Instagram}", 14   ,  252 ,  260 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{Kawai}", 14   ,  252 ,  263 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{SMS}", 14   ,  252 ,  265 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{SouGov}", 14   ,  252 ,  261 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{Telegram}", 14   ,  252 ,  266 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{TikTok}", 14   ,  252 ,  262 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{WhatsApp}", 14   ,  252 ,  264 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{X}", 14   ,  252 ,  258 );
INSERT INTO duplos_tokens_para_grupos_de_tokens (nome_duplo_token_para_grupo_de_token, id_grupo_de_token, id_token_evidencia, id_token_veiculo) VALUES ("<redes_sociais>[vídeo]{Youtube}", 14   ,  252 ,  257 );
