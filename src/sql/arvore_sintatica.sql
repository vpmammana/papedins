# VPM (2022-06-09) - nesta versao temos todos os elementos de topicos (presente na arvore da tabela nested_tipos_secoes) no mesmo nivel hierarquico
# VPM (2022-06-19) - criado versionamento atraves da tabela versoes.
# VPM (2022-06-19) - tentativa de pegar id_chave da tabela secoes nos stored procedures mostra_arvore_niveis_pais_seleciona_tipo*
# VPM (2022-06-19) - tentativa de obter campo trecho e nome_versao da tabela versoes.
# VPM (2022-06-22) - criando forma de ver o documento inteiro, no mesmo visualizador de niveis pela criacao da stored procedure mostra_documento_completo
# VPM (2022-06-28) - preparacao para criar um sistema de mudanca de subarvore dentro da arvore
# VPM (2022-06-29) - criacao das funcoes de insercao de novos nós, antes e depois do atual
# VPM (2022-07-02) - criacao de procedure para gravar trecho quando insere novo filho insere_a_direita_dos_filhos_com_trecho
# VPM (2022-07-10) - cria procedure que faz mostra_documento_completo mostrar niveis para geracao de Latex -> mostra_documento_completo_niveis
# VPM (2022-07-27) - criei trigger para preencher tabela ids_de_referencia com os identificadores das referencias, que precisam ser inteligíveis a partir do que o usuário entra no espaço entre dois [].
# VPM (2022-08-05) - criei mostra_documento_completo_com_pai para permitir a gravacao da tese em formato sql. Eu preciso do nome do pai para poder criar os calls que vão gerar o script SQL. Decidi gravar num script ao invés de usar o dump do mysql
# VPM (2022-08-06) - coloquei item_de_referencia como filho de topico no nested_tipos_secoes, para permitir visualizar tópicos e referencias ao mesmo tempo
# VPM (2023-05-25) - colocar as mudanças para apresentar o organograma da fundacentro (classificacao dos paragrafos por tipo de dado) 
# VPM (2023-06-02) - colocar um tipo de secao para PDF
# VPM (2023-06-11) - muda o topico para estrutura, para representar melhor o objeto de estrutura de uma hierarquia. Topico era mais adequado para edicao de texto 
# VPM (2023-07-05) - Coloca foreign key para alguns tipos de secoes que fazem referencia a tabelas de DAS (comissionados), servidores e reparticoes da organizacao 

#FORK (2023-09-08) - CRIADO POR VPM PARA TRANSFORMAR EM SISTEMA DE ARVORE SINTATICA PARA CONTABILIZACAO DE RESULTADOS DA FUNDACENTRO

# VPM (2023-09-08) - mudar estrutura da árvore para garantir a representação de elementos sintáticos (não terminais) e morfológicos (terminais)

DELIMITER //
DROP PROCEDURE IF EXISTS retorna_valores_de_propriedades_do_tipo_secao
//
CREATE PROCEDURE retorna_valores_de_propriedades_do_tipo_secao(IN tipo_secao varchar(200))
		BEGIN
		select nome_propriedade, nome_valor_discreto, nome_nested_tipo_secao, nts.descricao as descricao from instancias_propriedades as A, propriedades, valores_discretos, nested_tipos_secoes as nts where A.id_propriedade = id_chave_propriedade and id_valor_discreto=id_chave_valor_discreto and id_nested_tipo_secao = id_chave_nested_tipo_secao and nome_nested_tipo_secao = tipo_secao order by nome_nested_tipo_secao ;
		END
		//
		DROP PROCEDURE IF EXISTS mostra_trilha_da_arvore_descricao_concatenada
		//
# a procedure abaixo estaria com problemas? coloca o nivel 2 por ultimo. Ainda bem que eu nao uso
CREATE PROCEDURE mostra_trilha_da_arvore_descricao_concatenada(IN no_de_busca varchar(20))
		BEGIN
		SELECT group_concat(T.nomcat SEPARATOR "-") from (
						SELECT parent.descricao as nomcat 
						FROM secoes AS node,
						secoes AS parent
						WHERE node.lft BETWEEN parent.lft AND parent.rgt
						AND node.nome_categoria = no_de_busca
						ORDER BY parent.lft) as T;
		END
		//
		DROP PROCEDURE IF EXISTS mostra_trilha_da_arvore_codigo_concatenado
		//
# a procedure abaixo estaria com problemas? coloca o nivel 2 por ultimo. Ainda bem que eu nao uso
CREATE PROCEDURE mostra_trilha_da_arvore_codigo_concatenado(IN no_de_busca varchar(20))
		BEGIN
		SELECT group_concat(T.nomcat SEPARATOR "-") from (
						SELECT parent.nome_categoria as nomcat
						FROM secoes AS node,
						secoes AS parent
						WHERE node.lft BETWEEN parent.lft AND parent.rgt
						AND node.nome_categoria = no_de_busca
						ORDER BY parent.lft) as T;
		END
		//
# este estah funcionando.
		DROP PROCEDURE IF EXISTS mostra_trilha_da_arvore
		//
CREATE PROCEDURE mostra_trilha_da_arvore(IN no_de_busca varchar(100))
		BEGIN
		SELECT parent.nome_categoria
		FROM secoes AS node,
		secoes AS parent
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		AND node.nome_categoria = no_de_busca
		ORDER BY parent.lft;
		END
		//
		DROP PROCEDURE IF EXISTS retorna_filho_a_direita_tipos_secoes
		//
CREATE PROCEDURE retorna_filho_a_direita_tipos_secoes(IN nome_no_pai varchar(100), OUT saida_no varchar(100))
		busca:BEGIN

		SELECT @numero:=count(*) from nested_tipos_secoes where nome_nested_tipo_secao = nome_no_pai;

		IF @numero = 0 THEN
		SET saida_no = '';
		LEAVE busca;		
		END iF;

		SELECT @no_filho_encontrado:=node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - (MAX(sub_tree.depth) + 1)) AS depth
		FROM nested_tipos_secoes AS node,
		nested_tipos_secoes AS parent,
		nested_tipos_secoes AS sub_parent,
		(
		 SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth
		 FROM nested_tipos_secoes AS node,
		 nested_tipos_secoes AS parent
		 WHERE node.lft BETWEEN parent.lft AND parent.rgt
		 AND node.nome_nested_tipo_secao = nome_no_pai
		 GROUP BY node.nome_nested_tipo_secao
		 ORDER BY MAX(node.lft)
		)AS sub_tree
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt
		AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao
		GROUP BY node.nome_nested_tipo_secao
		HAVING depth = 1
		ORDER BY MAX(node.lft) DESC LIMIT 1;
#SELECT concat("INterno ", @no_filho_encontrado);
		SET saida_no = @no_filho_encontrado;
		SELECT saida_no;
		END
		//
		DROP PROCEDURE IF EXISTS retorna_filho_a_direita
		//
CREATE PROCEDURE retorna_filho_a_direita(IN nome_no_pai varchar(100), OUT saida_no varchar(100))
		busca:BEGIN

		SELECT @numero:=count(*) from secoes where nome_categoria = nome_no_pai;

		IF @numero = 0 THEN
		SET saida_no = '';
		LEAVE busca;		
		END iF;

		SELECT @no_filho_encontrado:=node.nome_categoria, (COUNT(parent.nome_categoria) - (MAX(sub_tree.depth) + 1)) AS depth
		FROM secoes AS node,
		secoes AS parent,
		secoes AS sub_parent,
		(
		 SELECT node.nome_categoria, (COUNT(parent.nome_categoria) - 1) AS depth
		 FROM secoes AS node,
		 secoes AS parent
		 WHERE node.lft BETWEEN parent.lft AND parent.rgt
		 AND node.nome_categoria = nome_no_pai
		 GROUP BY node.nome_categoria
		 ORDER BY MAX(node.lft)
		)AS sub_tree
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt
		AND sub_parent.nome_categoria = sub_tree.nome_categoria
		GROUP BY node.nome_categoria
		HAVING depth = 1
		ORDER BY MAX(node.lft) DESC LIMIT 1;
#SELECT concat("INterno ", @no_filho_encontrado);
		SET saida_no = @no_filho_encontrado;
		SELECT saida_no;
		END
		//
		DROP PROCEDURE IF EXISTS insere_a_direita_dos_filhos_tipos_secoes
		//
CREATE PROCEDURE insere_a_direita_dos_filhos_tipos_secoes(IN nome_no_pai varchar(200), IN no_para_inserir varchar(200), IN no_descricao varchar(10000))
		funcao:BEGIN

		CALL retorna_filho_a_direita_tipos_secoes(nome_no_pai, @no_filho_a_direita);
#SELECT concat("Retornou da chamada: ", @no_filho_a_direita);
		IF @no_filho_a_direita = '' THEN
		SELECT "Não foi possível encontrar o no!";
		LEAVE funcao;
		END IF;

		IF @no_filho_a_direita = nome_no_pai THEN
#SELECT "Insere abaixo";
		SELECT @myLeft := lft FROM nested_tipos_secoes

		WHERE nome_nested_tipo_secao = nome_no_pai;

		UPDATE nested_tipos_secoes SET rgt = rgt + 2 WHERE rgt > @myLeft;
		UPDATE nested_tipos_secoes SET lft = lft + 2 WHERE lft > @myLeft;

		INSERT INTO nested_tipos_secoes(nome_nested_tipo_secao, descricao, lft, rgt) VALUES(no_para_inserir, no_descricao,   @myLeft + 1, @myLeft + 2);
		ELSE
#SELECT concat("Insere do lado - pai: ",nome_no_pai," a inserir ",no_para_inserir, "retorno da funcao ", @no_filho_a_direita); 
#SELECT concat("O filho a direita é: ", @no_filho_a_direita);

		SELECT @myRight := rgt FROM nested_tipos_secoes
		WHERE nome_nested_tipo_secao = @no_filho_a_direita;

		UPDATE nested_tipos_secoes SET rgt = rgt + 2 WHERE rgt > @myRight;
		UPDATE nested_tipos_secoes SET lft = lft + 2 WHERE lft > @myRight;

		INSERT INTO nested_tipos_secoes(nome_nested_tipo_secao, descricao,  lft, rgt) VALUES(no_para_inserir, no_descricao,  @myRight + 1, @myRight + 2);
		END IF;

		END
		//
		DROP PROCEDURE IF EXISTS insere_a_direita_dos_filhos
		//
CREATE PROCEDURE insere_a_direita_dos_filhos(IN nome_no_pai varchar(100), IN no_para_inserir varchar(100), IN no_descricao varchar(10000), IN no_link varchar(300), IN tipo_secao int)
		funcao:BEGIN

		CALL retorna_filho_a_direita(nome_no_pai, @no_filho_a_direita);
#SELECT concat("Retornou da chamada: ", @no_filho_a_direita);
		IF @no_filho_a_direita = '' THEN
		SELECT "Não foi possível encontrar o no!";
		LEAVE funcao;
		END IF;

		IF @no_filho_a_direita = nome_no_pai THEN
#SELECT "Insere abaixo";
		SELECT @myLeft := lft FROM secoes

		WHERE nome_categoria = nome_no_pai;

		UPDATE secoes SET rgt = rgt + 2 WHERE rgt > @myLeft;
		UPDATE secoes SET lft = lft + 2 WHERE lft > @myLeft;

		INSERT INTO secoes(nome_categoria, descricao, lnk, lft, rgt, id_tipo_secao) VALUES(no_para_inserir, no_descricao, no_link,  @myLeft + 1, @myLeft + 2, tipo_secao);
		ELSE
#SELECT concat("Insere do lado - pai: ",nome_no_pai," a inserir ",no_para_inserir, "retorno da funcao ", @no_filho_a_direita); 
#SELECT concat("O filho a direita é: ", @no_filho_a_direita);

		SELECT @myRight := rgt FROM secoes
		WHERE nome_categoria = @no_filho_a_direita;

		UPDATE secoes SET rgt = rgt + 2 WHERE rgt > @myRight;
		UPDATE secoes SET lft = lft + 2 WHERE lft > @myRight;

		INSERT INTO secoes(nome_categoria, descricao, lnk, lft, rgt, id_tipo_secao) VALUES(no_para_inserir, no_descricao, no_link, @myRight + 1, @myRight + 2, tipo_secao);
		END IF;

		END
		//
# insere antes (a esquerda) do no atual
		DROP PROCEDURE IF EXISTS insere_abaixo_do_atual
		//
CREATE PROCEDURE insere_abaixo_do_atual(IN nome_no_pai VARCHAR(100), IN nome_do_tipo_de_secao VARCHAR(200), IN in_trecho VARCHAR(3500))
		funcao:BEGIN
		call insere_a_direita_dos_filhos(nome_no_pai, CONCAT("auto_",REPLACE(CURRENT_TIMESTAMP(6), ' ', '_')), in_trecho,'', (select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = nome_do_tipo_de_secao));
		INSERT INTO versoes(id_secao, trecho) VALUES (LAST_INSERT_ID(), in_trecho);
		END
		//
# insere antes (a esquerda) do no atual
		DROP PROCEDURE IF EXISTS insere_a_esquerda_do_atual
		//
CREATE PROCEDURE insere_a_esquerda_do_atual(IN nome_no VARCHAR(100), IN id_do_tipo_de_secao INT, IN in_descricao VARCHAR(3500))
		funcao:BEGIN
		SELECT @tmp_esq:= lft from secoes where nome_categoria = nome_no;
		SELECT @time_stampa :=  CURRENT_TIMESTAMP(3);
		SELECT @time_stampa_short :=  CURRENT_TIMESTAMP;

#cria novo espaco
		UPDATE secoes set lft = lft + 2 where lft >= @tmp_esq;
		UPDATE secoes set rgt = rgt + 2 where rgt >= @tmp_esq;
#cria novo no
		INSERT INTO secoes(nome_categoria, descricao, lnk, lft, rgt, id_tipo_secao) VALUES(CONCAT("auto_", REPLACE(@time_stampa, " ", "_")), in_descricao, "",  @tmp_esq, @tmp_esq + 1, id_do_tipo_de_secao);
		INSERT INTO versoes(id_secao, trecho) VALUES (LAST_INSERT_ID(), in_descricao);

		END
		//
# insere depois (a direita) do no atual
		DROP PROCEDURE IF EXISTS insere_a_direita_do_atual
		//
CREATE PROCEDURE insere_a_direita_do_atual(IN nome_no VARCHAR(100), IN id_do_tipo_de_secao INT, IN in_descricao VARCHAR(3500))
		funcao:BEGIN
		SELECT @tmp_dir:= rgt from secoes where nome_categoria = nome_no;
		SELECT @time_stampa :=  CURRENT_TIMESTAMP(3);
		SELECT @time_stampa_short :=  CURRENT_TIMESTAMP;

#cria novo espaco
		UPDATE secoes set lft = lft + 2 where lft > @tmp_dir;
		UPDATE secoes set rgt = rgt + 2 where rgt > @tmp_dir;
#cria novo no
		INSERT INTO secoes(nome_categoria, descricao, lnk, lft, rgt, id_tipo_secao) VALUES(CONCAT("auto_", REPLACE(@time_stampa," ","_")), in_descricao, "",  @tmp_dir + 1, @tmp_dir + 2, id_do_tipo_de_secao);
		INSERT INTO versoes(id_secao, trecho) VALUES (LAST_INSERT_ID(), in_descricao);

		END
		//
		DROP PROCEDURE IF EXISTS transpoe_subarvore
		//
CREATE PROCEDURE transpoe_subarvore(IN nome_no_para_transpor varchar(100), IN nome_no_onde_inserir varchar(100))
		funcao:BEGIN
		SELECT @tmp_esq:= lft from secoes where nome_categoria = nome_no_para_transpor;
		SELECT @tmp_dir:= rgt from secoes where nome_categoria = nome_no_para_transpor;

		SELECT @largura_do_no:=rgt - lft + 1 from secoes where nome_categoria = nome_no_para_transpor;

		SELECT @esq_da_insercao:=lft from secoes where nome_categoria = nome_no_onde_inserir;

		SELECT @distancia_para_insercao:=lft - @tmp_esq + 1 from secoes where nome_categoria = nome_no_onde_inserir; 

#cria novo espaco
		UPDATE secoes set lft = lft + @largura_do_no where lft > @esq_da_insercao;
		UPDATE secoes set rgt = rgt + @largura_do_no where rgt > @esq_da_insercao;
#move subtree
		UPDATE secoes set lft = lft + @distancia_para_insercao, rgt = rgt + @distancia_para_insercao where lft >= @tmp_esq AND rgt <= @tmp_dir;
#apaga espaco da subtree original
		UPDATE secoes set lft = lft - @largura_do_no where lft > @tmp_dir;
		UPDATE secoes set rgt = rgt - @largura_do_no where rgt > @tmp_dir; 

		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore_tipos_secoes
		//
CREATE PROCEDURE mostra_arvore_tipos_secoes()
		BEGIN
		SELECT CONCAT( REPEAT('   ', COUNT(parent.nome_nested_tipo_secao) - 1), node.nome_nested_tipo_secao) AS nome_tipo_secao
		FROM nested_tipos_secoes AS node,
		nested_tipos_secoes AS parent
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		GROUP BY node.nome_nested_tipo_secao
		ORDER BY MAX(node.lft);
		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore_abaixo_secao
		//
CREATE PROCEDURE mostra_arvore_abaixo_secao(IN in_nome_secao VARCHAR(100))
		BEGIN
		DECLARE esq INT DEFAULT 0;
		DECLARE dir INT DEFAULT 0;
		SET esq = (SELECT lft from secoes where nome_categoria = in_nome_secao);
		SET dir = (SELECT rgt from secoes where nome_categoria = in_nome_secao);
		DELETE FROM guarda_ids_da_lixeira;
		INSERT INTO guarda_ids_da_lixeira (id_da_secao_da_lixeira) SELECT node.id_chave_categoria AS id_secao
		FROM secoes AS node,
		secoes AS parent
		WHERE node.lft BETWEEN parent.lft AND parent.rgt AND 
		node.lft >= esq AND node.rgt <= dir
		GROUP BY node.nome_categoria
		ORDER BY MAX(node.lft);
		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore
		//
CREATE PROCEDURE mostra_arvore()
		BEGIN
		SELECT CONCAT( REPEAT('   ', COUNT(parent.nome_categoria) - 1), node.nome_categoria) AS nome_secao
		FROM secoes AS node,
		secoes AS parent
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		GROUP BY node.nome_categoria
		ORDER BY MAX(node.lft);
		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore_niveis_tipos_secoes_com_pai
		//
CREATE PROCEDURE mostra_arvore_niveis_tipos_secoes_com_pai()
		BEGIN
		SELECT 
		COUNT(parent.nome_nested_tipo_secao) - 1 as nivel, 
		@nome:=node.nome_nested_tipo_secao AS nome_secao_tipo_secao, 
		node.id_chave_nested_tipo_secao as id_tipo_secao,
		(
		 select 
		 nome_nested_tipo_secao 
		 from 
		 nested_tipos_secoes 
		 where 
		 lft < (select lft from nested_tipos_secoes where nome_nested_tipo_secao=@nome) and rgt > (select rgt from nested_tipos_secoes where nome_nested_tipo_secao=@nome) 
		 order by lft DESC limit 1
		) as pai 
		FROM 
		nested_tipos_secoes AS node, nested_tipos_secoes AS parent  
		WHERE 
		node.lft BETWEEN parent.lft AND parent.rgt 
		GROUP BY 
		node.nome_nested_tipo_secao, node.id_chave_nested_tipo_secao 
		ORDER BY MAX(node.lft);
		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore_niveis_tipos_secoes
		//
CREATE PROCEDURE mostra_arvore_niveis_tipos_secoes()
		BEGIN
		SELECT COUNT(parent.nome_nested_tipo_secao) - 1 as nivel, node.nome_nested_tipo_secao AS nome_secao_tipo_secao, node.id_chave_nested_tipo_secao as id_tipo_secao
		FROM nested_tipos_secoes AS node,
		nested_tipos_secoes AS parent
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		GROUP BY node.nome_nested_tipo_secao, node.id_chave_nested_tipo_secao
		ORDER BY MAX(node.lft);
		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore_niveis
		//
CREATE PROCEDURE mostra_arvore_niveis()
		BEGIN
		SELECT COUNT(parent.nome_categoria) - 1 as nivel, node.nome_categoria AS nome_secao
		FROM secoes AS node,
		secoes AS parent
		WHERE node.lft BETWEEN parent.lft AND parent.rgt
		GROUP BY node.nome_categoria
		ORDER BY MAX(node.lft);
		END
		//
		DROP PROCEDURE IF EXISTS mostra_arvore_niveis_pais
		//
CREATE PROCEDURE mostra_arvore_niveis_pais()
		BEGIN
		SELECT 
		T_filho.niveis as nivel, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo 
		from 
		(
		 SELECT 
		 ST.niveis as niveis, ST.filho as filho, ST.esquerda, ST.direita 
		 from 
		 (
		  SELECT 
		  COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
		  from 
		  (
		   SELECT 
		   node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
		   from 
		   secoes as node, secoes as parent 
		   where node.lft BETWEEN parent.lft AND parent.rgt
		  ) as T group by T.filho, T.esquerda, T.direita
		 ) as ST
		) as T_filho 
		left join 
		(
		 SELECT 
		 ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		 from 
		 (
		  SELECT 
		  COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
		  from 
		  (
		   SELECT 
		   node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
		   from 
		   secoes as node, secoes as parent 
		   where node.lft BETWEEN parent.lft AND parent.rgt
		  ) as T group by T.filho, T.esquerda, T.direita
		 ) as ST2
		) as T_pai 
		on T_filho.niveis - T_pai.niveis <2 
		where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.esquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.esquerda;
		END
		//
# cria funcao para mostrar todos os niveis como se fossem nivel 1, para mostrar o documento integral
		DROP PROCEDURE IF EXISTS mostra_arvore_niveis_pais_seleciona_tipo
		//
CREATE PROCEDURE mostra_arvore_niveis_pais_seleciona_tipo(IN tipo_secao varchar(200))
		BEGIN

		SELECT POS_FINAL.nivel, POS_FINAL.id_chave_filho, POS_FINAL.id_filho, POS_FINAL.id_pai, POS_FINAL.titulo, POS_FINAL.id_nested_tipo_secao, POS_FINAL.nome_nested_tipo_secao, POS_FINAL.esq, POS_FINAL.dir, POS_FINAL.tem_filho, (SELECT trecho from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as ultima_versao,(SELECT nome_versao from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as data, (SELECT count(*) from versoes where id_secao = POS_FINAL.id_chave_filho) as conta_versoes     FROM
		(
		 SELECT FINAL.nivel, FINAL.id_chave_filho, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda as esq, FINAL.tfilho_direita as dir, CASE WHEN (FINAL.tfilho_direita - FINAL.tfilho_esquerda = 1) THEN "NAO_TEM_FILHO" ELSE "TEM_FILHO" END as tem_filho   FROM
		 (
		  SELECT 
		  T_filho.niveis as nivel, T_filho.id_chave_filho as id_chave_filho, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda, T_filho.tfilhodireita as tfilho_direita
		  from 
		  (
		   SELECT 
		   ST.niveis as niveis, ST.id_chave_filho as id_chave_filho, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita as tfilhodireita, ST.id___tipo___secao as id____tipo____secao 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.id_chave_filho as id_chave_filho, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
			from 
			(
			 SELECT 
			 node.id_chave_categoria as id_chave_filho, node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 
			) as T group by T.id_chave_filho, T.filho, T.esquerda, T.direita
		   ) as ST
		  ) as T_filho 
		  left join 
		  (
		   SELECT 
		   ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
			from 
			(
			 SELECT 
			 node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 


			) as T group by T.filho, T.esquerda, T.direita
		   ) as ST2
		  ) as T_pai 
		  on T_filho.niveis - T_pai.niveis <2 
		  where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		  (
		   SELECT parent.id_chave_nested_tipo_secao
		   FROM nested_tipos_secoes AS node,
		   nested_tipos_secoes AS parent
		   WHERE node.lft BETWEEN parent.lft AND parent.rgt
		   AND node.nome_nested_tipo_secao = tipo_secao
		   ORDER BY parent.lft

		  ) ORDER BY FINAL.tfilho_esquerda) AS POS_FINAL order by POS_FINAL.esq;
		  END
		  //
		  DROP PROCEDURE IF EXISTS mostra_arvore_niveis_pais_seleciona_tipos_com_filhos
		  //
CREATE PROCEDURE mostra_arvore_niveis_pais_seleciona_tipos_com_filhos(IN tipo_secao varchar(200))
		BEGIN
		SELECT FINAL.nivel, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda FROM
		(
		 SELECT 
		 T_filho.niveis as nivel, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda
		 from 
		 (
		  SELECT 
		  ST.niveis as niveis, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita, ST.id___tipo___secao as id____tipo____secao 
		  from 
		  (
		   SELECT 
		   COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
		   from 
		   (
			SELECT 
			node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			from 
			secoes as node, secoes as parent 
			where node.lft BETWEEN parent.lft AND parent.rgt 
		   ) as T group by T.filho, T.esquerda, T.direita
		  ) as ST
		 ) as T_filho 
		 left join 
		 (
		  SELECT 
		  ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		  from 
		  (
		   SELECT 
		   COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
		   from 
		   (
			SELECT 
			node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			from 
			secoes as node, secoes as parent 
			where node.lft BETWEEN parent.lft AND parent.rgt 


		   ) as T group by T.filho, T.esquerda, T.direita
		  ) as ST2
		 ) as T_pai 
		 on T_filho.niveis - T_pai.niveis <2 
		 where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		 (
		  SELECT DISTINCT T1.id from (SELECT parent.id_chave_nested_tipo_secao as id FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao in (SELECT T.nome FROM (SELECT node.nome_nested_tipo_secao as nome, (COUNT(parent.nome_nested_tipo_secao) - (min(sub_tree.depth) + 1)) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent, nested_tipos_secoes AS sub_parent, ( SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao = tipo_secao GROUP BY node.nome_nested_tipo_secao ORDER BY max(node.lft) ) AS sub_tree WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao GROUP BY node.nome_nested_tipo_secao HAVING depth <= 1 ORDER BY max(node.lft)) as T where T.depth>0)  ORDER BY parent.lft) as T1
		 ) ORDER BY FINAL.tfilho_esquerda;
		 END
		 //
#alteracao em elaboracao -> buscar versao na tabela versoes - busca da ultima versao da secao bem sucedida (2022-06-19)
#busca do numero de versoes da secao (2022-06-20)
		 DROP PROCEDURE IF EXISTS mostra_arvore_niveis_pais_seleciona_tipos_com_filhos_esq_dir
		 //
CREATE PROCEDURE mostra_arvore_niveis_pais_seleciona_tipos_com_filhos_esq_dir(IN tipo_secao varchar(200))
		BEGIN
		SELECT POS_FINAL.nivel, POS_FINAL.id_chave_filho, POS_FINAL.id_filho, POS_FINAL.id_pai, POS_FINAL.titulo, POS_FINAL.id_nested_tipo_secao, POS_FINAL.nome_nested_tipo_secao, POS_FINAL.esq, POS_FINAL.dir, POS_FINAL.tem_filho, (SELECT trecho from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as ultima_versao,(SELECT nome_versao from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as data, (SELECT count(*) from versoes where id_secao = POS_FINAL.id_chave_filho) as conta_versoes   FROM
		(SELECT FINAL.nivel, FINAL.id_chave_filho, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda as esq, FINAL.tfilho_direita as dir, CASE WHEN (FINAL.tfilho_direita - FINAL.tfilho_esquerda = 1) THEN "NAO_TEM_FILHO" ELSE "TEM_FILHO" END as tem_filho FROM
		 (
		  SELECT 
		  T_filho.niveis as nivel, T_filho.id_chave_filho as id_chave_filho, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda, T_filho.tfilhodireita as tfilho_direita
		  from 
		  (
		   SELECT 
		   ST.niveis as niveis, ST.id_chave_filho as id_chave_filho, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita as tfilhodireita, ST.id___tipo___secao as id____tipo____secao 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.id_chave_filho as id_chave_filho, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
			from 
			(
			 SELECT 
			 node.id_chave_categoria as id_chave_filho, node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 
			) as T group by T.id_chave_filho, T.filho, T.esquerda, T.direita
		   ) as ST
		  ) as T_filho 
		  left join 
		  (
		   SELECT 
		   ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
			from 
			(
			 SELECT 
			 node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 


			) as T group by T.filho, T.esquerda, T.direita
		   ) as ST2
		  ) as T_pai 
		  on T_filho.niveis - T_pai.niveis <2 
		  where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		  (
		   SELECT DISTINCT T1.id from (SELECT parent.id_chave_nested_tipo_secao as id FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao in (SELECT T.nome FROM (SELECT node.nome_nested_tipo_secao as nome, (COUNT(parent.nome_nested_tipo_secao) - (min(sub_tree.depth) + 1)) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent, nested_tipos_secoes AS sub_parent, ( SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao = tipo_secao GROUP BY node.nome_nested_tipo_secao ORDER BY max(node.lft) ) AS sub_tree WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao GROUP BY node.nome_nested_tipo_secao HAVING depth <= 1 ORDER BY max(node.lft)) as T where T.depth>0)  ORDER BY parent.lft) as T1
		  ) ORDER BY FINAL.tfilho_esquerda) AS POS_FINAL order by POS_FINAL.esq;
		  END
		  //
		  DROP PROCEDURE IF EXISTS mostra_documento_completo_com_pai
		  //
CREATE PROCEDURE mostra_documento_completo_com_pai(IN tipo_secao varchar(200))
		BEGIN
		SELECT CASE WHEN (POS_FINAL.nivel=0) THEN 0 ELSE 1 END as nivel, POS_FINAL.id_chave_filho, POS_FINAL.id_filho, POS_FINAL.id_pai as paizao, POS_FINAL.titulo, POS_FINAL.id_nested_tipo_secao, POS_FINAL.nome_nested_tipo_secao, POS_FINAL.esq, POS_FINAL.dir, POS_FINAL.tem_filho, (SELECT trecho from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as ultima_versao,(SELECT nome_versao from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as data, (SELECT count(*) from versoes where id_secao = POS_FINAL.id_chave_filho) as conta_versoes   FROM
		(SELECT FINAL.nivel, FINAL.id_chave_filho, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda as esq, FINAL.tfilho_direita as dir, CASE WHEN (FINAL.tfilho_direita - FINAL.tfilho_esquerda = 1) THEN "NAO_TEM_FILHO" ELSE "TEM_FILHO" END as tem_filho FROM
		 (
		  SELECT 
		  T_filho.niveis as nivel, T_filho.id_chave_filho as id_chave_filho, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda, T_filho.tfilhodireita as tfilho_direita
		  from 
		  (
		   SELECT 
		   ST.niveis as niveis, ST.id_chave_filho as id_chave_filho, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita as tfilhodireita, ST.id___tipo___secao as id____tipo____secao 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.id_chave_filho as id_chave_filho, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
			from 
			(
			 SELECT 
			 node.id_chave_categoria as id_chave_filho, node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 
			) as T group by T.id_chave_filho, T.filho, T.esquerda, T.direita
		   ) as ST
		  ) as T_filho 
		  left join 
		  (
		   SELECT 
		   ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
			from 
			(
			 SELECT 
			 node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 


			) as T group by T.filho, T.esquerda, T.direita
		   ) as ST2
		  ) as T_pai 
		  on T_filho.niveis - T_pai.niveis <2 
		  where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		  (
		   SELECT DISTINCT T1.id from (SELECT parent.id_chave_nested_tipo_secao as id FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao in (SELECT T.nome FROM (SELECT node.nome_nested_tipo_secao as nome, (COUNT(parent.nome_nested_tipo_secao) - (min(sub_tree.depth) + 1)) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent, nested_tipos_secoes AS sub_parent, ( SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao = tipo_secao GROUP BY node.nome_nested_tipo_secao ORDER BY max(node.lft) ) AS sub_tree WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao GROUP BY node.nome_nested_tipo_secao HAVING depth <= 2 ORDER BY max(node.lft)) as T where T.depth>0)  ORDER BY parent.lft) as T1
		  ) ORDER BY FINAL.tfilho_esquerda) AS POS_FINAL order by POS_FINAL.esq;
		  END
		  //
		  DROP PROCEDURE IF EXISTS mostra_documento_completo
		  //
CREATE PROCEDURE mostra_documento_completo(IN tipo_secao varchar(200))
		BEGIN
		SELECT CASE WHEN (POS_FINAL.nivel=0) THEN 0 ELSE 1 END as nivel, POS_FINAL.id_chave_filho, POS_FINAL.id_filho, (select "corpo_tese"), POS_FINAL.titulo, POS_FINAL.id_nested_tipo_secao, POS_FINAL.nome_nested_tipo_secao, POS_FINAL.esq, POS_FINAL.dir, POS_FINAL.tem_filho, (SELECT trecho from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as ultima_versao,(SELECT nome_versao from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as data, (SELECT count(*) from versoes where id_secao = POS_FINAL.id_chave_filho) as conta_versoes   FROM
		(SELECT FINAL.nivel, FINAL.id_chave_filho, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda as esq, FINAL.tfilho_direita as dir, CASE WHEN (FINAL.tfilho_direita - FINAL.tfilho_esquerda = 1) THEN "NAO_TEM_FILHO" ELSE "TEM_FILHO" END as tem_filho FROM
		 (
		  SELECT 
		  T_filho.niveis as nivel, T_filho.id_chave_filho as id_chave_filho, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda, T_filho.tfilhodireita as tfilho_direita
		  from 
		  (
		   SELECT 
		   ST.niveis as niveis, ST.id_chave_filho as id_chave_filho, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita as tfilhodireita, ST.id___tipo___secao as id____tipo____secao 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.id_chave_filho as id_chave_filho, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
			from 
			(
			 SELECT 
			 node.id_chave_categoria as id_chave_filho, node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 
			) as T group by T.id_chave_filho, T.filho, T.esquerda, T.direita
		   ) as ST
		  ) as T_filho 
		  left join 
		  (
		   SELECT 
		   ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
			from 
			(
			 SELECT 
			 node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 


			) as T group by T.filho, T.esquerda, T.direita
		   ) as ST2
		  ) as T_pai 
		  on T_filho.niveis - T_pai.niveis <2 
		  where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		  (
		   SELECT DISTINCT T1.id from (SELECT parent.id_chave_nested_tipo_secao as id FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao in (SELECT T.nome FROM (SELECT node.nome_nested_tipo_secao as nome, (COUNT(parent.nome_nested_tipo_secao) - (min(sub_tree.depth) + 1)) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent, nested_tipos_secoes AS sub_parent, ( SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao = tipo_secao GROUP BY node.nome_nested_tipo_secao ORDER BY max(node.lft) ) AS sub_tree WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao GROUP BY node.nome_nested_tipo_secao HAVING depth <= 2 ORDER BY max(node.lft)) as T where T.depth>0)  ORDER BY parent.lft) as T1
		  ) ORDER BY FINAL.tfilho_esquerda) AS POS_FINAL order by POS_FINAL.esq;
		  END
		  //
		  DROP PROCEDURE IF EXISTS mostra_documento_completo_niveis
		  //
CREATE PROCEDURE mostra_documento_completo_niveis(IN tipo_secao varchar(200))
		BEGIN
		SELECT POS_FINAL.nivel as nivel, POS_FINAL.id_chave_filho, POS_FINAL.id_filho, (select "corpo_tese"), POS_FINAL.titulo as primeira_versao, POS_FINAL.id_nested_tipo_secao, POS_FINAL.nome_nested_tipo_secao, POS_FINAL.esq, POS_FINAL.dir, POS_FINAL.tem_filho, (SELECT trecho from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as ultima_versao,(SELECT nome_versao from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as data, (SELECT count(*) from versoes where id_secao = POS_FINAL.id_chave_filho) as conta_versoes   FROM
		(SELECT FINAL.nivel, FINAL.id_chave_filho, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda as esq, FINAL.tfilho_direita as dir, CASE WHEN (FINAL.tfilho_direita - FINAL.tfilho_esquerda = 1) THEN "NAO_TEM_FILHO" ELSE "TEM_FILHO" END as tem_filho FROM
		 (
		  SELECT 
		  T_filho.niveis as nivel, T_filho.id_chave_filho as id_chave_filho, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda, T_filho.tfilhodireita as tfilho_direita
		  from 
		  (
		   SELECT 
		   ST.niveis as niveis, ST.id_chave_filho as id_chave_filho, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita as tfilhodireita, ST.id___tipo___secao as id____tipo____secao 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.id_chave_filho as id_chave_filho, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
			from 
			(
			 SELECT 
			 node.id_chave_categoria as id_chave_filho, node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 
			) as T group by T.id_chave_filho, T.filho, T.esquerda, T.direita
		   ) as ST
		  ) as T_filho 
		  left join 
		  (
		   SELECT 
		   ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
			from 
			(
			 SELECT 
			 node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 


			) as T group by T.filho, T.esquerda, T.direita
		   ) as ST2
		  ) as T_pai 
		  on T_filho.niveis - T_pai.niveis <2 
		  where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		  (
		   SELECT DISTINCT T1.id from (SELECT parent.id_chave_nested_tipo_secao as id FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao in (SELECT T.nome FROM (SELECT node.nome_nested_tipo_secao as nome, (COUNT(parent.nome_nested_tipo_secao) - (min(sub_tree.depth) + 1)) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent, nested_tipos_secoes AS sub_parent, ( SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao = tipo_secao GROUP BY node.nome_nested_tipo_secao ORDER BY max(node.lft) ) AS sub_tree WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao GROUP BY node.nome_nested_tipo_secao HAVING depth <= 2 ORDER BY max(node.lft)) as T where T.depth>0)  ORDER BY parent.lft) as T1
		  ) ORDER BY FINAL.tfilho_esquerda) AS POS_FINAL order by POS_FINAL.esq;
		  END
		  //
		  DROP PROCEDURE IF EXISTS mostra_documento_completo_niveis_sem_lixeira
		  //
CREATE PROCEDURE mostra_documento_completo_niveis_sem_lixeira(IN tipo_secao varchar(200))
		BEGIN
		CALL mostra_arvore_abaixo_secao("lixeira");
		SELECT POS_FINAL.nivel as nivel, POS_FINAL.id_chave_filho, POS_FINAL.id_filho, (select "corpo_tese"), POS_FINAL.titulo as primeira_versao, POS_FINAL.id_nested_tipo_secao, POS_FINAL.nome_nested_tipo_secao, POS_FINAL.esq, POS_FINAL.dir, POS_FINAL.tem_filho, (SELECT trecho from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as ultima_versao,(SELECT nome_versao from versoes where id_secao = POS_FINAL.id_chave_filho order by nome_versao DESC LIMIT 1) as data, (SELECT count(*) from versoes where id_secao = POS_FINAL.id_chave_filho) as conta_versoes   FROM
		(SELECT FINAL.nivel, FINAL.id_chave_filho, FINAL.id_filho, FINAL.id_pai, FINAL.titulo, FINAL.idtiposecao as id_nested_tipo_secao, (select nome_nested_tipo_secao from nested_tipos_secoes where id_chave_nested_tipo_secao = id_nested_tipo_secao) as nome_nested_tipo_secao, FINAL.tfilho_esquerda as esq, FINAL.tfilho_direita as dir, CASE WHEN (FINAL.tfilho_direita - FINAL.tfilho_esquerda = 1) THEN "NAO_TEM_FILHO" ELSE "TEM_FILHO" END as tem_filho FROM
		 (
		  SELECT 
		  T_filho.niveis as nivel, T_filho.id_chave_filho as id_chave_filho, T_filho.filho as id_filho, T_pai.filho as id_pai, (SELECT descricao from secoes where nome_categoria = T_filho.filho) as titulo, T_filho.id____tipo____secao as idtiposecao, T_filho.tfilhoesquerda as tfilho_esquerda, T_filho.tfilhodireita as tfilho_direita
		  from 
		  (
		   SELECT 
		   ST.niveis as niveis, ST.id_chave_filho as id_chave_filho, ST.filho as filho, ST.esquerda as tfilhoesquerda, ST.direita as tfilhodireita, ST.id___tipo___secao as id____tipo____secao 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.id_chave_filho as id_chave_filho, T.filho as filho, T.esquerda as esquerda, T.direita as direita, T.id__tipo__secao as id___tipo___secao
			from 
			(
			 SELECT 
			 node.id_chave_categoria as id_chave_filho, node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita, node.id_tipo_secao as id__tipo__secao 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 
			) as T group by T.id_chave_filho, T.filho, T.esquerda, T.direita
		   ) as ST
		  ) as T_filho 
		  left join 
		  (
		   SELECT 
		   ST2.niveis as niveis, ST2.filho as filho, ST2.esquerda, ST2.direita 
		   from 
		   (
			SELECT 
			COUNT(T.pai) - 1 as niveis, T.filho as filho, T.esquerda as esquerda, T.direita as direita 
			from 
			(
			 SELECT 
			 node.nome_categoria as filho, parent.nome_categoria as pai, node.lft as esquerda, node.rgt as direita 
			 from 
			 secoes as node, secoes as parent 
			 where node.lft BETWEEN parent.lft AND parent.rgt 


			) as T group by T.filho, T.esquerda, T.direita
		   ) as ST2
		  ) as T_pai 
		  on T_filho.niveis - T_pai.niveis <2 
		  where (T_filho.niveis - T_pai.niveis > 0 AND T_filho.tfilhoesquerda BETWEEN T_pai.esquerda AND T_pai.direita) OR (T_filho.niveis=0 AND T_filho.filho = T_pai.filho) ORDER BY T_filho.tfilhoesquerda) AS FINAL WHERE FINAL.idtiposecao IN 
		  (
		   SELECT DISTINCT T1.id from (SELECT parent.id_chave_nested_tipo_secao as id FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao in (SELECT T.nome FROM (SELECT node.nome_nested_tipo_secao as nome, (COUNT(parent.nome_nested_tipo_secao) - (min(sub_tree.depth) + 1)) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent, nested_tipos_secoes AS sub_parent, ( SELECT node.nome_nested_tipo_secao, (COUNT(parent.nome_nested_tipo_secao) - 1) AS depth FROM nested_tipos_secoes AS node, nested_tipos_secoes AS parent WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.nome_nested_tipo_secao = tipo_secao GROUP BY node.nome_nested_tipo_secao ORDER BY max(node.lft) ) AS sub_tree WHERE node.lft BETWEEN parent.lft AND parent.rgt AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt AND sub_parent.nome_nested_tipo_secao = sub_tree.nome_nested_tipo_secao GROUP BY node.nome_nested_tipo_secao HAVING depth <= 2 ORDER BY max(node.lft)) as T where T.depth>0)  ORDER BY parent.lft) as T1
		  ) ORDER BY FINAL.tfilho_esquerda) AS POS_FINAL WHERE POS_FINAL.id_chave_filho not in(select id_da_secao_da_lixeira from guarda_ids_da_lixeira) order by POS_FINAL.esq;
		  END
		  //

		  DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS PercorreTiposTokens
$$
CREATE PROCEDURE PercorreTiposTokens(IN pai varchar(200))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE field1 varchar(200);
    DECLARE field2 varchar(200);
    
    -- Declara um cursor para percorrer os registros da tabela "tabelinha"
    DECLARE cur CURSOR FOR SELECT nome_tipo_token, acentuada FROM tipos_tokens;
    
    -- Declaração que manipula o cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    -- Loop para chamar a stored procedure "dummy" para cada registro
    read_loop: LOOP
        FETCH cur INTO field1, field2;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Chama a stored procedure "dummy" com o ID do registro
        CALL insere_a_direita_dos_filhos_tipos_secoes(pai, field1, field2);
    END LOOP;
    
    CLOSE cur;
    
END$$

DELIMITER ;
		  DROP TABLE IF EXISTS cargos_comissionados;
		  DROP TABLE IF EXISTS setores;
		  DROP TABLE IF EXISTS cargos_da_carreira;
		  DROP TABLE IF EXISTS pessoas;
		  DROP TABLE IF EXISTS tipos_secoes_visiveis;
		  DROP TABLE IF EXISTS users; 
		  DROP TABLE IF EXISTS guarda_ids_da_lixeira; # preciso saber os ids da lixeira para não imprimir a lixeira no LATEX
		  DROP TABLE IF EXISTS ids_de_referencia;
		  DROP TABLE IF EXISTS versoes;
		  DROP TABLE IF EXISTS instancias_propriedades; # a ordem é importante por causa do foreign key
		  DROP TABLE IF EXISTS valores_discretos; # a ordem é importante por causa do foreign key
		  DROP TABLE IF EXISTS propriedades; # a ordem é importante por causa do foreign key
		  DROP TABLE IF EXISTS secoes; # a ordem é importante por causa do foreign key
		  DROP TABLE IF EXISTS nested_tipos_secoes; # a ordem é importante por causa do foreign key

CREATE TABLE cargos_comissionados (
				id_chave_cargo_comissionado INT AUTO_INCREMENT PRIMARY KEY,
				nome_cargo_comissionado VARCHAR(300),
				valor float,
				cce_equivalente float,
				UNIQUE(nome_cargo_comissionado)
				);



CREATE TABLE setores (
				id_chave_setor INT AUTO_INCREMENT PRIMARY KEY,
				nome_setor VARCHAR(300),
				sigla VARCHAR(10),
				UNIQUE(nome_setor),
				UNIQUE(sigla)
				);



CREATE TABLE cargos_da_carreira (
				id_chave_cargo_da_carreira INT AUTO_INCREMENT PRIMARY KEY,
				nome_cargo_da_carreira VARCHAR(100),
				nome_carreira VARCHAR(100),
				UNIQUE(nome_cargo_da_carreira)
				);

INSERT INTO cargos_da_carreira (nome_cargo_da_carreira, nome_carreira) VALUES ("Analista", "Gestão, Planejamento e Infraestrutura");
INSERT INTO cargos_da_carreira (nome_cargo_da_carreira, nome_carreira) VALUES ("Assistente", "Gestão, Planejamento e Infraestrutura");
INSERT INTO cargos_da_carreira (nome_cargo_da_carreira, nome_carreira) VALUES ("Auxiliar", "Gestão, Planejamento e Infraestrutura");
INSERT INTO cargos_da_carreira (nome_cargo_da_carreira, nome_carreira) VALUES ("Pesquisador(a)", "Pesquisa");
INSERT INTO cargos_da_carreira (nome_cargo_da_carreira, nome_carreira) VALUES ("Técnico(a)", "Desenvolvimento Tecnológco");
INSERT INTO cargos_da_carreira (nome_cargo_da_carreira, nome_carreira) VALUES ("Tecnologista", "Desenvolvimento Tecnológco");

CREATE TABLE pessoas (
				id_chave_pessoa INT AUTO_INCREMENT PRIMARY KEY,
				nome_pessoa VARCHAR(100),
				senha VARCHAR(300),
				UNIQUE(nome_pessoa)
				);


CREATE TABLE users (
				id_chave_user INT AUTO_INCREMENT PRIMARY KEY,
				nome_user VARCHAR(100),
				senha VARCHAR(300),
				UNIQUE(nome_user)
				);

		INSERT INTO users (nome_user, senha) VALUES ("pedro","$2y$10$EECgzrOjZDADL35JU9kLaOmiOtSNuPP1FP9rlQlmheGuLpyr7qHRu");
		INSERT INTO users (nome_user, senha) VALUES ("victor","$2y$10$EECgzrOjZDADL35JU9kLaOmiOtSNuPP1FP9rlQlmheGuLpyr7qHRu");

CREATE TABLE propriedades (
				id_chave_propriedade INT AUTO_INCREMENT PRIMARY KEY,
				nome_propriedade VARCHAR(100),
				UNIQUE(nome_propriedade)
				);

		INSERT INTO propriedades (nome_propriedade) VALUES ("rotulo");
		INSERT INTO propriedades (nome_propriedade) VALUES ("cor_de_fundo");
		INSERT INTO propriedades (nome_propriedade) VALUES ("cor_da_fonte");
		INSERT INTO propriedades (nome_propriedade) VALUES ("alinhamento");
		INSERT INTO propriedades (nome_propriedade) VALUES ("tamanho_fonte");
		INSERT INTO propriedades (nome_propriedade) VALUES ("tipo_fonte");
		INSERT INTO propriedades (nome_propriedade) VALUES ("posicao_vert");
		INSERT INTO propriedades (nome_propriedade) VALUES ("tipo_numeracao");
		INSERT INTO propriedades (nome_propriedade) VALUES ("eh_paragrafo");
		INSERT INTO propriedades (nome_propriedade) VALUES ("eh_foreign_key");
		INSERT INTO propriedades (nome_propriedade) VALUES ("tabela_externa");
		INSERT INTO propriedades (nome_propriedade) VALUES ("id_chave_externa");
		INSERT INTO propriedades (nome_propriedade) VALUES ("campo_externo");
		INSERT INTO propriedades (nome_propriedade) VALUES ("margem_simetrica");

CREATE TABLE valores_discretos (
				id_chave_valor_discreto INT AUTO_INCREMENT PRIMARY KEY,
				nome_valor_discreto varchar(100),
				id_propriedade INT,
				FOREIGN KEY (id_propriedade) REFERENCES propriedades(id_chave_propriedade)

				);

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("normal",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("italico",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("bold",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("sublinhado",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_fonte"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("direita",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "alinhamento"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("esquerda",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "alinhamento"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("centro",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "alinhamento"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("justificado",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "alinhamento"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("0.7",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("0.8",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("0.9",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.0",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.1",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.2",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.3",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.4",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.5",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.6",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.7",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.8",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("1.9",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.0",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.1",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.2",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.3",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.4",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.5",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.6",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.7",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.8",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("2.9",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("3.0",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("3.1",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("3.2",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("3.3",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("3.4",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("3.5",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tamanho_fonte"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#AA0000",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#0035cc",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("red",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("cor_original",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#003588",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#0035bb",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#ddf542",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#000000",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("#0035aa",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("orange",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("green",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("white",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("black",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_de_fundo"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("white",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_da_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("black",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_da_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("yellow",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_da_fonte"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("blue",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "cor_da_fonte"));


# "lightgray", #3333cc
# "yellow",    #3333ff
# "#3333ff",   #3333aa
# "orange",



		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("sim",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "rotulo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nao",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "rotulo"));


		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("cima",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "posicao_vert"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("baixo",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "posicao_vert"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("centro",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "posicao_vert"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("letra_i",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_numeracao"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("letra_a",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_numeracao"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("letra_I",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_numeracao"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("romana",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_numeracao"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("algarismo",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tipo_numeracao"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("10%",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "margem_simetrica"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("15%",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "margem_simetrica"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("20%",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "margem_simetrica"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("25%",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "margem_simetrica"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("sim",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "eh_paragrafo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nao",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "eh_paragrafo"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("sim",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "eh_foreign_key"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nao",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "eh_foreign_key"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("tokens",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("tipos_tokens",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("tipos_flexoes",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("tipos_elementos_sintaticos",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("pessoas",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("cargos_comissionados",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("setores",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "tabela_externa"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_token",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_tipo_token",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_tipo_flexao",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_tipo_elemento_sintatico",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_pessoa",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_cargo_comissionado",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("nome_setor",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "campo_externo"));

		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_token",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_tipo_token",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_tipo_flexao",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_tipo_elemento_sintatico",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_pessoa",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_cargo_comissionado",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));
		INSERT INTO valores_discretos (nome_valor_discreto, id_propriedade) VALUES ("id_chave_setor",(SELECT id_chave_propriedade FROM propriedades WHERE nome_propriedade = "id_chave_externa"));


		CREATE TABLE nested_tipos_secoes (
						id_chave_nested_tipo_secao INT AUTO_INCREMENT PRIMARY KEY,
						nome_nested_tipo_secao VARCHAR(200) NOT NULL,
						descricao varchar(10000),
						lft INT NOT NULL,
						rgt INT NOT NULL
						);

		INSERT INTO nested_tipos_secoes VALUES(1,'raiz','Rais dos Tipos de Secao',1,2);
#,(2,'estrutura',2,15),(3,'paragrafo',3,4), (4,'imagem',5,6),(5,'grafico',7,8),(6,'tabela',9,10),(7,'lista',11,14),(8,'item',12,13);

call insere_a_direita_dos_filhos_tipos_secoes("raiz",				"estrutura",					"Tópicos ou Seções incluindo capítulos");
call insere_a_direita_dos_filhos_tipos_secoes("estrutura",              "paragrafo",                    "Parágrafos dos tópicos ou das sessões");
call PercorreTiposTokens("estrutura");


call insere_a_direita_dos_filhos_tipos_secoes("raiz",				"colegiado",					"Índice");


call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"paragrafo_colegiado", 					"Parágrafo explicativo sobre o colegiado");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"sustentacao_colegiado",					"Sustentação normativa do colegiado");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"imagem_colegiado",					"Imagens pertinentes ao universo dos colegiados");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"pdf_colegiado",					"Arquivos PDF pertinentes ao colegiado");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"titular_colegiado",					"Titular de um colegiado");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"suplente_colegiado",					"Suplente de um colegiado");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"lotacao_titular",					"Divisão da Fundacentro em que o Titular está lotado");
call insere_a_direita_dos_filhos_tipos_secoes("colegiado",				"instituicao_coordenadora",					"Instituição que coordena o grupo");

call insere_a_direita_dos_filhos_tipos_secoes("raiz",				"programa",					"Índice");
call insere_a_direita_dos_filhos_tipos_secoes("programa",				"paragrafo_programa", 					"Parágrafo explicativo sobre o programa");
call insere_a_direita_dos_filhos_tipos_secoes("programa",				"sustentacao_programa",					"Sustentação normativa do programa");
call insere_a_direita_dos_filhos_tipos_secoes("programa",				"imagem_programa",					"Imagens pertinentes ao universo dos programas");
call insere_a_direita_dos_filhos_tipos_secoes("programa",				"pdf_programa",					"Arquivos PDF pertinentes ao programa");

call insere_a_direita_dos_filhos_tipos_secoes("raiz",				"projeto",					"Índice");
call insere_a_direita_dos_filhos_tipos_secoes("projeto",				"paragrafo_projeto", 					"Parágrafo explicativo sobre o projeto");
call insere_a_direita_dos_filhos_tipos_secoes("projeto",				"sustentacao_projeto",					"Sustentação normativa do projeto");
call insere_a_direita_dos_filhos_tipos_secoes("projeto",				"imagem_projeto",					"Imagens pertinentes ao universo dos projetos");
call insere_a_direita_dos_filhos_tipos_secoes("projeto",				"pdf_projeto",					"Arquivos PDF pertinentes ao programa");

call insere_a_direita_dos_filhos_tipos_secoes("raiz",				"processo",					"Índice");
call insere_a_direita_dos_filhos_tipos_secoes("processo",				"paragrafo_processo", 					"Parágrafo explicativo sobre o processo");
call insere_a_direita_dos_filhos_tipos_secoes("processo",				"sustentacao_processo",					"Sustentação normativa do processo");
call insere_a_direita_dos_filhos_tipos_secoes("processo",				"imagem_processo",					"Imagens pertinentes ao universo dos processos");
call insere_a_direita_dos_filhos_tipos_secoes("processo",				"pdf_processo",					"Arquivos PDF pertinentes ao programa");




create table tipos_secoes_visiveis (
	id_chave_tipo_secao_visivel INT AUTO_INCREMENT PRIMARY KEY,
	id_user int,
	id_nested_tipo_secao int,
	visivel varchar(100),
	time_stamp TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
	unique (id_user, id_nested_tipo_secao),
	FOREIGN KEY (id_nested_tipo_secao) REFERENCES nested_tipos_secoes(id_chave_nested_tipo_secao),
	FOREIGN KEY (id_user) REFERENCES users(id_chave_user)
);

CREATE TABLE instancias_propriedades (
	id_chave_instancia_propriedade INT AUTO_INCREMENT PRIMARY KEY,
	valor_continuo varchar(50),
	id_propriedade INT,
	id_valor_discreto INT,
	id_nested_tipo_secao INT,
	UNIQUE(id_propriedade, id_nested_tipo_secao),
	FOREIGN KEY (id_propriedade) REFERENCES propriedades(id_chave_propriedade),
	FOREIGN KEY (id_valor_discreto) REFERENCES valores_discretos(id_chave_valor_discreto),
	FOREIGN KEY (id_nested_tipo_secao) REFERENCES nested_tipos_secoes(id_chave_nested_tipo_secao)
); 



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lista_de_tab_fig"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_elementos_sintaticos"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_elemento_sintatico"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_elemento_sintatico"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "bold"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="estrutura"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "bold"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="colegiado"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "bold"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="programa"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "bold"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="projeto"));




INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_colegiado"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_programa"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_projeto"));




INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="paragrafo_processo"));




INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#003588"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_colegiado"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#003588"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_programa"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#003588"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_projeto"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#003588"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_processo"));




INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#003588"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="sustentacao_regimental"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035aa"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="cargo"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "cargos_comissionados"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_cargo_comissionado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_cargo_comissionado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035bb"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="comissionamento"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
# INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_tokens"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_flexoes"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_flexao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_flexao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="verbo_flexao_definida"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tokens"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#AA0000"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="preposicao_fixa"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_tokens"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "green"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="adjetivo"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_tokens"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#ddf542"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="artigo"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_tokens"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
#INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_token"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "tipos_flexoes"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_tipo_flexao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_tipo_flexao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substantivo_flexao_definida"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tabela_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tabela_externa" AND B.nome_valor_discreto = "pessoas"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="campo_externo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "campo_externo" AND B.nome_valor_discreto = "nome_pessoa"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="id_chave_externa"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "id_chave_externa" AND B.nome_valor_discreto = "id_chave_pessoa"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="substituto"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_colegiado"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="titular_programa"));





INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="suplente_colegiado"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="lotacao_titular"));


INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "justificado"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "1.0"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "normal"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "#0035cc"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "white"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="margem_simetrica"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "margem_simetrica" AND B.nome_valor_discreto = "15%"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="instituicao_coordenadora"));



INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "sim"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tamanho_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tamanho_fonte" AND B.nome_valor_discreto = "0.7"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="tipo_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "tipo_fonte" AND B.nome_valor_discreto = "bold"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="legenda_imagem"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_colegiado"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_colegiado"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_programa"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_programa"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_projeto"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_projeto"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_processo"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem_processo"));




INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="imagem"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="grafico"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="grafico"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="grafico"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="grafico"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="grafico"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="grafico"));

INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_paragrafo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_paragrafo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="tabela"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="eh_foreign_key"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "eh_foreign_key" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="tabela"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="alinhamento"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "alinhamento" AND B.nome_valor_discreto = "centro"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="tabela"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_de_fundo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_de_fundo" AND B.nome_valor_discreto = "cor_original"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="tabela"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="cor_da_fonte"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "cor_da_fonte" AND B.nome_valor_discreto = "black"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="tabela"));
INSERT INTO instancias_propriedades (valor_continuo,id_propriedade, id_valor_discreto, id_nested_tipo_secao) VALUES ("",(SELECT id_chave_propriedade FROM propriedades where nome_propriedade="rotulo"),(SELECT id_chave_valor_discreto FROM propriedades as A, valores_discretos as B WHERE B.id_propriedade = A.id_chave_propriedade AND A.nome_propriedade = "rotulo" AND B.nome_valor_discreto = "nao"),(SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes where nome_nested_tipo_secao ="tabela"));


CREATE TABLE secoes (
        id_chave_categoria INT AUTO_INCREMENT PRIMARY KEY,
        nome_categoria VARCHAR(100) NOT NULL,
	descricao varchar(3500),
	lnk varchar(300),
        lft INT NOT NULL,
        rgt INT NOT NULL,
	id_tipo_secao int,
	unique(nome_categoria),
	FOREIGN KEY (id_tipo_secao) REFERENCES nested_tipos_secoes(id_chave_nested_tipo_secao)
);

create table guarda_ids_da_lixeira(
			id_chave_guarda_id_da_lixeira int auto_increment primary key,
			id_da_secao_da_lixeira int,
			foreign key (id_da_secao_da_lixeira) references secoes(id_chave_categoria)
		);

CREATE TABLE ids_de_referencia(
		id_chave_id_de_referencia INT AUTO_INCREMENT PRIMARY KEY,
		nome_id_de_referencia VARCHAR(300) DEFAULT NULL,
		id_secao_do_identificador INT,
		unique(nome_id_de_referencia),
		unique(id_secao_do_identificador),
		FOREIGN KEY (id_secao_do_identificador) REFERENCES secoes(id_chave_categoria)
		);
		


CREATE TABLE versoes(
	id_chave_versao int not null auto_increment PRIMARY KEY,
	nome_versao TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
	id_secao int,
	trecho varchar(3500),
	unique (id_secao, nome_versao),
	FOREIGN KEY (id_secao) REFERENCES secoes(id_chave_categoria) 
);

DROP TRIGGER IF EXISTS grava_id_de_referencia;

# o trigger abaixo preenche a tabela ids_de_referencia com os identificadores das referencias que sao do tipo item_de_referencia, pegando apenas o que estah entre colchetes, sempre que houver a insercao de uma nova versao com insert into versoes
# note que nao ha correcao do identificador se houver update da tabela versoes, mas o RedarTex nao faz update das linhas da tabela versao. Sempre que uma nova versao eh criada, uma nova linha eh criada na tabela versao.

DELIMITER $$
CREATE TRIGGER grava_id_de_referencia
BEFORE INSERT ON versoes
FOR EACH ROW
BEGIN
	DECLARE c varchar(26) DEFAULT "abcdefghijklmnopqrstuvwxyz";
	DECLARE conta INT DEFAULT 0;
	DECLARE conta2 INT DEFAULT 0;
	DECLARE identificador varchar(200) DEFAULT "";
	DECLARE velho_identificador varchar(200) DEFAULT "";
	DECLARE TEMP varchar(200) DEFAULT "";	
	IF  NEW.id_secao IN (SELECT id_chave_categoria from secoes where id_tipo_secao = (SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes WHERE nome_nested_tipo_secao = "item_de_referencia")) THEN
    DELETE FROM ids_de_referencia WHERE id_secao_do_identificador = NEW.id_secao; # tem que apagar se eh uma atualizacao de versao, porque pode ser que o identificador seja mantido e ai nao queremos que coloque letras caso seja soh uma atualizacao da referencia bibliografica	
	SET identificador =  SUBSTRING(NEW.trecho, position("[" IN NEW.trecho)+1, position("]" IN NEW.trecho) - position("[" IN NEW.trecho) -1);
	SET velho_identificador = identificador;
	SET temp = identificador;
	WHILE temp IN (SELECT nome_id_de_referencia from ids_de_referencia) DO
	 IF conta > 26 THEN
	 	SET conta2 = conta2 + 1;
	 	SET identificador = CONCAT(identificador, SUBSTR(c, conta2, 1));
		SET conta=0;
	 END IF;
	 SET conta = conta + 1;
	 SET temp = CONCAT(identificador, SUBSTR(c,conta,1));
	 IF conta2>26 THEN
	 	SET conta2=0;
	 END IF;
	END WHILE;
	SET identificador = temp;
	INSERT INTO ids_de_referencia (nome_id_de_referencia, id_secao_do_identificador) VALUES 
			(
				(
				CASE 	
					WHEN identificador = "" THEN NULL
					ELSE identificador 
			 	END
				)
			,
			NEW.id_secao
			)  
			ON DUPLICATE KEY 
			UPDATE nome_id_de_referencia = 
			CASE 	
				WHEN identificador = "" THEN NULL
				ELSE identificador 
		 	END
			,
			id_secao_do_identificador = NEW.id_secao;
  	SET NEW.trecho = REPLACE(NEW.trecho, CONCAT("[",velho_identificador,"]"), CONCAT("[",identificador,"]"));
	END IF;
	END$$

DELIMITER ;

# importante -> nao pode usar traço no primary key do nome_categoria
# CREATE PROCEDURE insere_a_direita_dos_filhos(IN nome_no_pai varchar(100), IN no_para_inserir varchar(100), IN no_descricao varchar(10000), IN no_link varchar(300), IN tipo_secao int)


insert into secoes values (1,'corpo_tese','raiz','',1,2, (SELECT id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao="raiz"));


call insere_a_direita_dos_filhos("corpo_tese", "presidencia", "Presidência" , "",(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "estrutura"));
call insere_a_direita_dos_filhos("presidencia", "descricao_presidencia", "Presidência da Fundacentro" , "",(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "paragrafo"));
call insere_a_direita_dos_filhos("presidencia", "Gabinete", "Gabinete" , "",(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "estrutura"));

call insere_a_direita_dos_filhos("corpo_tese", "lixeira", "Lixeira" , "",(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = "estrutura"));


INSERT INTO versoes (id_secao, trecho) SELECT id_chave_categoria, descricao FROM secoes;

call mostra_arvore();
call mostra_arvore_niveis();
call mostra_arvore_niveis_pais();
#call mostra_arvore_niveis_pais_segrega_tipo("paragrafo");

call mostra_arvore_niveis_pais_seleciona_tipo("paragrafo");
call mostra_arvore_niveis_pais_seleciona_tipo("raiz");
call mostra_arvore_niveis_pais_seleciona_tipo("estrutura");


SELECT parent.nome_nested_tipo_secao, parent.id_chave_nested_tipo_secao
FROM nested_tipos_secoes AS node,
        nested_tipos_secoes AS parent
WHERE node.lft BETWEEN parent.lft AND parent.rgt
        AND node.nome_nested_tipo_secao = 'item'
ORDER BY parent.lft;

call mostra_arvore_tipos_secoes();
call mostra_arvore_niveis_tipos_secoes();

select * from ids_de_referencia,versoes where id_secao_do_identificador = id_secao;


INSERT INTO pessoas (nome_pessoa) VALUES ("ADIR DE SOUZA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ADRIANA CUNHA BELASCO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ADRIANO MYOTIN");
INSERT INTO pessoas (nome_pessoa) VALUES ("ADRIANO ROGERIO CHINELLATO CAMARDELLA");
INSERT INTO pessoas (nome_pessoa) VALUES ("AIRTON TAVARES DE ALMEIDA JUNIOR");
INSERT INTO pessoas (nome_pessoa) VALUES ("ALEXANDRA RINALDI");
INSERT INTO pessoas (nome_pessoa) VALUES ("ALEXANDRE CABRAL TINET DOS SANTOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("ANA LUCIA BENTO DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ANA RUBIA WOLF GOMES");
INSERT INTO pessoas (nome_pessoa) VALUES ("ANDRE LUIS SANTIAGO MAIA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ANGELA SALETE GENARO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ANGELA TANIESKA SCARLATO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ANTONIO LINCOLN COLUCCI");
INSERT INTO pessoas (nome_pessoa) VALUES ("ARTUR CARLOS DA SILVA MOREIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("AUGUSTO ANTONIO BARROSO MADRUGA");
INSERT INTO pessoas (nome_pessoa) VALUES ("BENEDITO SILVA GUIMARÃES FILHO");
INSERT INTO pessoas (nome_pessoa) VALUES ("CARLOS ALBERTO DE FRANÇA");
INSERT INTO pessoas (nome_pessoa) VALUES ("CELBE FERREIRA LOPES");
INSERT INTO pessoas (nome_pessoa) VALUES ("CELSO AMORIM SALIM");
INSERT INTO pessoas (nome_pessoa) VALUES ("CEZAR AKIYOSHI SAITO");
INSERT INTO pessoas (nome_pessoa) VALUES ("CLAUDIA CECÍLIA MARCHIANO");
INSERT INTO pessoas (nome_pessoa) VALUES ("CLEITON FARIA LIMA");
INSERT INTO pessoas (nome_pessoa) VALUES ("CLODOALDO CAETITÉ DE NOVAES");
INSERT INTO pessoas (nome_pessoa) VALUES ("CRISTIANE MARIA GALVÃO BARBOSA");
INSERT INTO pessoas (nome_pessoa) VALUES ("CRISTIANE OLIVEIRA REIMBERG");
INSERT INTO pessoas (nome_pessoa) VALUES ("CRISTIANE PAIM DA CUNHA");
INSERT INTO pessoas (nome_pessoa) VALUES ("DALTON TRIA CUSCIANO");
INSERT INTO pessoas (nome_pessoa) VALUES ("DANIELA SANCHES TAVARES");
INSERT INTO pessoas (nome_pessoa) VALUES ("DANIEL DE FREITAS BERTOLINO");
INSERT INTO pessoas (nome_pessoa) VALUES ("DANIEL MARTINS DA SILVA JUNIOR");
INSERT INTO pessoas (nome_pessoa) VALUES ("DANIEL PIRES BITENCOURT");
INSERT INTO pessoas (nome_pessoa) VALUES ("DÉBORA MARIA DOS SANTOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("DELMA FRANCISCO BATISTA");
INSERT INTO pessoas (nome_pessoa) VALUES ("DENILSON JOSÉ DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("DENISE BERTASI");
INSERT INTO pessoas (nome_pessoa) VALUES ("DIEGO FERNANDO FERREIRA DE OLIVEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("DIEGO RICARDI DOS ANJOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("DIOGO TADEU RUBIO");
INSERT INTO pessoas (nome_pessoa) VALUES ("DORACY MORAES DE SOUZA");
INSERT INTO pessoas (nome_pessoa) VALUES ("EDUARDO GARCIA GARCIA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ELISA KAYO SHIBUYA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ELISEU BAPTISTA FILHO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ELIZABETH DA SILVA FIGUEIREDO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ELIZABETI YURIKO MUTO");
INSERT INTO pessoas (nome_pessoa) VALUES ("EMERSON JOSE ALMEIDA DA FONSECA");
INSERT INTO pessoas (nome_pessoa) VALUES ("EMERSON MORAES TEIXEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ERALDO ARRUDA LIMA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ERICA LUI REINHARDT");
INSERT INTO pessoas (nome_pessoa) VALUES ("ERIKA ALVES DOS SANTOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("ERIKA MACHADO MELO ALVES");
INSERT INTO pessoas (nome_pessoa) VALUES ("EUCLIDES MANOEL DA PAZ");
INSERT INTO pessoas (nome_pessoa) VALUES ("EUGENIO PACELI HATEM DINIZ");
INSERT INTO pessoas (nome_pessoa) VALUES ("EVANDRO TAMAITI");
INSERT INTO pessoas (nome_pessoa) VALUES ("EZEQUIAS DE SOUZA LIMA");
INSERT INTO pessoas (nome_pessoa) VALUES ("FABIO AKIO SHIOMI IHA");
INSERT INTO pessoas (nome_pessoa) VALUES ("FABIO SPERDUTI");
INSERT INTO pessoas (nome_pessoa) VALUES ("FELIPE AUGUSTO CASCALES");
INSERT INTO pessoas (nome_pessoa) VALUES ("FELIPE MORAIS SANTOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("FERNANDA DE FREITAS VENTURA");
INSERT INTO pessoas (nome_pessoa) VALUES ("FERNANDO BARBOSA DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("FERNANDO JOSÉ SMECELATO");
INSERT INTO pessoas (nome_pessoa) VALUES ("FERNANDO TIMOTEO FERNANDES");
INSERT INTO pessoas (nome_pessoa) VALUES ("FLÁVIO BARBOSA GALVÃO");
INSERT INTO pessoas (nome_pessoa) VALUES ("FLÁVIO MALDONADO BENTES");
INSERT INTO pessoas (nome_pessoa) VALUES ("GILCEMAR ANTONIO PEREIRA ENDLICH");
INSERT INTO pessoas (nome_pessoa) VALUES ("GILMAR DA CUNHA TRIVELATO");
INSERT INTO pessoas (nome_pessoa) VALUES ("GLAUCIA DE MENEZES FERNANDES");
INSERT INTO pessoas (nome_pessoa) VALUES ("GLÁUCIA NASCIMENTO DE SOUZA VELOSO");
INSERT INTO pessoas (nome_pessoa) VALUES ("GUILHERME MASAAKI KOREEDA");
INSERT INTO pessoas (nome_pessoa) VALUES ("GUSTAVO BRAGA SENRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("GUSTAVO DOS SANTOS HENSCHEL");
INSERT INTO pessoas (nome_pessoa) VALUES ("GUSTAVO HOLZBACH HAIBARA");
INSERT INTO pessoas (nome_pessoa) VALUES ("HORACY HIROKI TAKADA");
INSERT INTO pessoas (nome_pessoa) VALUES ("HUMBERTO MOREIRA DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JEFFERSON PEIXOTO DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOÃO LUIZ MARTINS");
INSERT INTO pessoas (nome_pessoa) VALUES ("JORGE MARQUES PONTES");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSÉ DAMASIO DE AQUINO");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSE LEONARDO PADILHA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSÉ MARÇAL JACKSON FILHO");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSÉ MÁRIO MATRICARDI");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSÉ RENATO ALVES SCHMIDT");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSILDO MARCELO MURICY SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSUÉ AMADOR DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JUAN GOMES PEREIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JULIANA ANDRADE OLIVEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JULIO CESAR LOPARDO ALVES");
INSERT INTO pessoas (nome_pessoa) VALUES ("KARINA PENARIOL SANCHES");
INSERT INTO pessoas (nome_pessoa) VALUES ("LAURA SOARES MARTINS NOGUEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("LÊNIO SÉRVIO AMARAL");
INSERT INTO pessoas (nome_pessoa) VALUES ("LEONICE LIMA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("LEONIDAS RAMOS PANDAGGIS");
INSERT INTO pessoas (nome_pessoa) VALUES ("LÉO VINÍCIUS MAIA LIBERATO");
INSERT INTO pessoas (nome_pessoa) VALUES ("LUCIA SILVA DA ROCHA");
INSERT INTO pessoas (nome_pessoa) VALUES ("LUIS CARLOS SOARES");
INSERT INTO pessoas (nome_pessoa) VALUES ("LUÍS RENATO BALBÃO ANDRADE");
INSERT INTO pessoas (nome_pessoa) VALUES ("LUIZ ANTONIO DE MELO");
INSERT INTO pessoas (nome_pessoa) VALUES ("LUIZ FERNANDO DE SENA");
INSERT INTO pessoas (nome_pessoa) VALUES ("MÁCIA MEDEIROS DOS SANTOS TEIXEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("MANUEL PEREIRA TEIXEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARCELA GERARDO RIBEIRO");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARCELA SARTO ALVARES OTERO PONTES");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARCELO ALEXANDRE DE VASCONCELOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARCELO RAMOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARCO ANTONIO BUSSACOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARCOS FRAGA");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA ANGELA PIZZANI CRUZ");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA APARECIDA CHRIST");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA CELESTE MAIELLO");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA CHRISTINA FELIX");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA CRISTINA AGUIAR CAMPOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA DE FÁTIMA TORRES FARIA VIEGAS");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIA MAENO");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARIANA SOUZA GOMES FURST");
INSERT INTO pessoas (nome_pessoa) VALUES ("MARTA KATSUE HATANO TSUJINO");
INSERT INTO pessoas (nome_pessoa) VALUES ("MAURO MAIA LARUCCIA");
INSERT INTO pessoas (nome_pessoa) VALUES ("MILDA JODELIS");
INSERT INTO pessoas (nome_pessoa) VALUES ("MOACILDO PAIVA DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("NELSON JORGE GOMES");
INSERT INTO pessoas (nome_pessoa) VALUES ("NORISVALDO FERRAZ JUNIOR");
INSERT INTO pessoas (nome_pessoa) VALUES ("PATRÍCIA MOURA DIAS");
INSERT INTO pessoas (nome_pessoa) VALUES ("PAULA PEIXOTO MONTEIRO NASSAR");
INSERT INTO pessoas (nome_pessoa) VALUES ("RAQUEL ORLANDO DE ALMEIDA");
INSERT INTO pessoas (nome_pessoa) VALUES ("RENATA LUIZA FERNANDES CALDAS");
INSERT INTO pessoas (nome_pessoa) VALUES ("RENATA SCHNEIDER VIARO");
INSERT INTO pessoas (nome_pessoa) VALUES ("RICARDO LUIZ LORENZI");
INSERT INTO pessoas (nome_pessoa) VALUES ("RITA DE CÁSSIA BRISIGHELLO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROBERTA GRANJA GONZAGA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROBERTO CUNHA DANTAS");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROBSON RODRIGUES DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROBSON SPINELLI GOMES");
INSERT INTO pessoas (nome_pessoa) VALUES ("RODRIGO CAUDURO ROSCANI");
INSERT INTO pessoas (nome_pessoa) VALUES ("RONILDO BARROS ORFAO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROSANA GONZAGA FRANCO MELO MASSA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROSECLAIR RODRIGUES DE CAMPOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("SANDRA MARQUES DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("SERGIO ANTONIO DOS SANTOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("SÉRGIO LUIZ PEREIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("SERGIO ROBERTO COSMANO");
INSERT INTO pessoas (nome_pessoa) VALUES ("SILVANA CUTRUPI GONÇALVES");
INSERT INTO pessoas (nome_pessoa) VALUES ("SILVIA HELENA DE ARAUJO NICOLAI");
INSERT INTO pessoas (nome_pessoa) VALUES ("SILVIA RODRIGUES MAKIYA");
INSERT INTO pessoas (nome_pessoa) VALUES ("SÍLVIA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("SOLANGE REGINA SCHAFFER");
INSERT INTO pessoas (nome_pessoa) VALUES ("SOLANGE SILVA NASCIMENTO");
INSERT INTO pessoas (nome_pessoa) VALUES ("SORAYA WINGESTER VASCONCELOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("SUSANA ELISABETH DOCE MACHADO");
INSERT INTO pessoas (nome_pessoa) VALUES ("TARSILA BAPTISTA PONCE");
INSERT INTO pessoas (nome_pessoa) VALUES ("TATIANA GONCALVES");
INSERT INTO pessoas (nome_pessoa) VALUES ("TEREZA LUIZA FERREIRA DOS SANTOS");
INSERT INTO pessoas (nome_pessoa) VALUES ("THAIS HELENA DE CARVALHO BARREIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("THAIS MARIA SANTIAGO DE MORAES BARROS");
INSERT INTO pessoas (nome_pessoa) VALUES ("THAIS MONTEIRO ANDRADE DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("TIAGO BORGES PEDROSO DO AMARAL");
INSERT INTO pessoas (nome_pessoa) VALUES ("VALDIR RODRIGUES SOARES");
INSERT INTO pessoas (nome_pessoa) VALUES ("VALÉRIA RAMOS SOARES PINTO");
INSERT INTO pessoas (nome_pessoa) VALUES ("VANIA GAEBLER");
INSERT INTO pessoas (nome_pessoa) VALUES ("VIVIANE MACIEL TREVISAN");
INSERT INTO pessoas (nome_pessoa) VALUES ("WALTER DOS REIS PEDREIRA FILHO");
INSERT INTO pessoas (nome_pessoa) VALUES ("PEDRO TOURINHO DE SIQUEIRA");
INSERT INTO pessoas (nome_pessoa) VALUES ("VICTOR PELLEGRINI MAMMANA");
INSERT INTO pessoas (nome_pessoa) VALUES ("VITOR ARAÚJO FILGUEIRAS");
INSERT INTO pessoas (nome_pessoa) VALUES ("RAFAEL MÔNICO SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("JOSÉ CLOVES DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("ESTEFÂNIA MEDEIROS CASTRO");
INSERT INTO pessoas (nome_pessoa) VALUES ("VAGO");
INSERT INTO pessoas (nome_pessoa) VALUES ("REMIGIO TODESCHINI");
INSERT INTO pessoas (nome_pessoa) VALUES ("KARINA NUNES FIGUEIREDO");
INSERT INTO pessoas (nome_pessoa) VALUES ("ROGÉRIO BEZERRA DA SILVA");
INSERT INTO pessoas (nome_pessoa) VALUES ("PREENCHER");
INSERT INTO pessoas (nome_pessoa) VALUES ("MÁRIO AUGUSTO SILVA PINTO");

INSERT INTO setores (sigla, nome_setor) VALUES ("CI","Controle Interno");
INSERT INTO setores (sigla, nome_setor) VALUES ("AI","Auditoria Interna");
INSERT INTO setores (sigla, nome_setor) VALUES ("ATAI","Assistente Técnico da Auditoria Interna");
INSERT INTO setores (sigla, nome_setor) VALUES ("PF","Procuradoria Federal");
INSERT INTO setores (sigla, nome_setor) VALUES ("ATPF","Assistente Técnico da Procuradoria Federal");
INSERT INTO setores (sigla, nome_setor) VALUES ("ASS","Assessores");
INSERT INTO setores (sigla, nome_setor) VALUES ("ASI","Assessor I");
INSERT INTO setores (sigla, nome_setor) VALUES ("ASII","Assessor II");
INSERT INTO setores (sigla, nome_setor) VALUES ("GERE","Gerentes de Projetos");
INSERT INTO setores (sigla, nome_setor) VALUES ("GPP1","Gerente de Projeto I");
INSERT INTO setores (sigla, nome_setor) VALUES ("GPP2","Gerente de Projeto II");
INSERT INTO setores (sigla, nome_setor) VALUES ("GAB","Gabinete");
INSERT INTO setores (sigla, nome_setor) VALUES ("SAG","Seção de Apoio ao Gabinete");
INSERT INTO setores (sigla, nome_setor) VALUES ("CAP","Coordenação de Apoio à Pesquisa");
INSERT INTO setores (sigla, nome_setor) VALUES ("CCE","Coordenação de Difusão de Conhecimento e Educação");
INSERT INTO setores (sigla, nome_setor) VALUES ("CGGC","Coordenação Geral de Gestão Corporativa");
INSERT INTO setores (sigla, nome_setor) VALUES ("SAGCI","Setor de Apoio à Gestão Corporativa I");
INSERT INTO setores (sigla, nome_setor) VALUES ("SAGCII","Setor de Apoio à Gestão Corporativa II");
INSERT INTO setores (sigla, nome_setor) VALUES ("CGP","Coordenação de Gestão de Pessoas");
INSERT INTO setores (sigla, nome_setor) VALUES ("CIP","Coordenação de Inovação e Parcerias");
INSERT INTO setores (sigla, nome_setor) VALUES ("COF","Coordenação de Orçamento e Finanças");
INSERT INTO setores (sigla, nome_setor) VALUES ("CORR","Corregedoria");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPE","Coordenação de Planejamento Estratégico");
INSERT INTO setores (sigla, nome_setor) VALUES ("CTIC","Coordenação de Tecnologia da Informação e Comunicação");
INSERT INTO setores (sigla, nome_setor) VALUES ("DAF","Diretoria de Administração e Finanças");
INSERT INTO setores (sigla, nome_setor) VALUES ("ATDAF","Assessor Técnico Diretoria de Administração e Finanças");
INSERT INTO setores (sigla, nome_setor) VALUES ("SADAF1","Setor de Apoio à Diretoria de Administração e Finanças I");
INSERT INTO setores (sigla, nome_setor) VALUES ("SADAF2","Setor de Apoio à Diretoria de Administração e Finanças II");
INSERT INTO setores (sigla, nome_setor) VALUES ("SADAF3","Setor de Apoio à Diretoria de Administração e Finanças III");
INSERT INTO setores (sigla, nome_setor) VALUES ("DPA","Diretoria de Pesquisa Aplicada");
INSERT INTO setores (sigla, nome_setor) VALUES ("ATDPA","Assessor Técnico da Diretoria de Pesquisa Aplicada");
INSERT INTO setores (sigla, nome_setor) VALUES ("GPDPA1","Gerente de Projeto da Diretoria de Pesquisa Aplicada I");
INSERT INTO setores (sigla, nome_setor) VALUES ("GPDPA2","Gerente de Projeto da Diretoria de Pesquisa Aplicada II");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPDPA1","Coordenador de Projeto da Diretoria de Pesquisa Aplicada I");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPDPA2","Coordenador de Projeto da Diretoria de Pesquisa Aplicada II");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPDPA3","Coordenador de Projeto da Diretoria de Pesquisa Aplicada III");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPDPA4","Coordenador de Projeto da Diretoria de Pesquisa Aplicada IV");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPDPA5","Coordenador de Projeto da Diretoria de Pesquisa Aplicada V");
INSERT INTO setores (sigla, nome_setor) VALUES ("CPDPA6","Coordenador de Projeto da Diretoria de Pesquisa Aplicada VI");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEABA","Setor de Apoio à Gestão no Estado da Bahia");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEADF","Setor de Apoio à Gestão no Estado no Distrito Federal");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEAES","Setor de Apoio à Gestão no Estado de Espírito Santo");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEAMG","Setor de Apoio à Gestão no Estado de Minas Gerais");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEAPA","Setor de Apoio à Gestão no Estado do Pará");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEAPE","Setor de Apoio à Gestão no Estado de Pernambuco");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEAPR","Setor de Apoio à Gestão no Estado do Paraná");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEARJ","Setor de Apoio à Gestão no Estado do Rio de Janeiro");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEARS","Setor de Apoio à Gestão no Estado do Rio Grande do Sul");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEEASC","Setor de Apoio à Gestão no Estado de Santa Catarina");
INSERT INTO setores (sigla, nome_setor) VALUES ("OUV","Ouvidoria");
INSERT INTO setores (sigla, nome_setor) VALUES ("PRES","Presidência");
INSERT INTO setores (sigla, nome_setor) VALUES ("SAP","Serviço de Administração de Pessoas");
INSERT INTO setores (sigla, nome_setor) VALUES ("SATP","Serviço de Apoio Técnico e Pesquisa");
INSERT INTO setores (sigla, nome_setor) VALUES ("SCE","Serviço de Cursos e Eventos");
INSERT INTO setores (sigla, nome_setor) VALUES ("SCI","Serviço de Comunicação Institucional");
INSERT INTO setores (sigla, nome_setor) VALUES ("SACI","Setor de Apoio à Comunicação Institucional");
INSERT INTO setores (sigla, nome_setor) VALUES ("SCO","Serviço de Contabilidade");
INSERT INTO setores (sigla, nome_setor) VALUES ("SCP","Serviço de Compras");
INSERT INTO setores (sigla, nome_setor) VALUES ("SDB","Serviço de Biblioteca e Documentação");
INSERT INTO setores (sigla, nome_setor) VALUES ("SDP","Serviço de Desenvolvimento de Pessoas");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEE","Serviço de Epidemiologia e Estatística");
INSERT INTO setores (sigla, nome_setor) VALUES ("SEF","Serviço de Execução Orçamentária e Financeira");
INSERT INTO setores (sigla, nome_setor) VALUES ("SGC","Serviço de Gestão de Contratos");
INSERT INTO setores (sigla, nome_setor) VALUES ("SLAP","Serviço de Laboratórios de Apoio à Pesquisa");
INSERT INTO setores (sigla, nome_setor) VALUES ("SLEP","Serviço de Laboratório de EPI");
INSERT INTO setores (sigla, nome_setor) VALUES ("SLO","Serviço de Logística");
INSERT INTO setores (sigla, nome_setor) VALUES ("SMP","Serviço de Material e Patrimônio");
INSERT INTO setores (sigla, nome_setor) VALUES ("SPR","Serviço de Publicação e RBSO");
INSERT INTO setores (sigla, nome_setor) VALUES ("STDN","Serviço de Tecnologia - Desenvolvimento de Negócios");
INSERT INTO setores (sigla, nome_setor) VALUES ("STIO","Serviço de Tecnologia - Infraestrutura e Operações");
INSERT INTO setores (sigla, nome_setor) VALUES ("UDEBS","Setor de Apoio à Gestão da Unidade em Extinção da Baixada Santista");
INSERT INTO setores (sigla, nome_setor) VALUES ("UDECA","Setor de Apoio à Gestão da Unidade em Extinção de Campinas");
INSERT INTO setores (sigla, nome_setor) VALUES ("DCT","Diretoria de Conhecimento e Tecnologia");
INSERT INTO setores (sigla, nome_setor) VALUES ("SADCT","Setor de Apoio à DCT");
INSERT INTO setores (sigla, nome_setor) VALUES ("UD","Unidades Descentralizadas");
INSERT INTO setores (sigla, nome_setor) VALUES ("EA","Escritórios Avançados");
INSERT INTO setores (sigla, nome_setor) VALUES ("UDE","Unidades Descentralizadas em Extinção");
INSERT INTO setores (sigla, nome_setor) VALUES ("EAPE","Escritório Avançado do Estado de Pernambuco");
INSERT INTO setores (sigla, nome_setor) VALUES ("EADF","Escritório Avançado do Distrito Federal");
INSERT INTO setores (sigla, nome_setor) VALUES ("EAMG","Escritório Avançado do Estado de Minas Gerais");
INSERT INTO setores (sigla, nome_setor) VALUES ("EARJ","Escritório Avançado do Estado do Rio de Janeiro");
INSERT INTO setores (sigla, nome_setor) VALUES ("EASC","Escritório Avançado do Estado de Santa Catarina");
INSERT INTO setores (sigla, nome_setor) VALUES ("EAPA","Escritório Avançado do Estado do Pará");
INSERT INTO setores (sigla, nome_setor) VALUES ("EABA","Escritório Avançado do Estado da Bahia ");
INSERT INTO setores (sigla, nome_setor) VALUES ("EAES","Escritório Avançado do Estado do Espírito Santo");
INSERT INTO setores (sigla, nome_setor) VALUES ("EAPR","Escritório Avançado do Estado do Paraná");
INSERT INTO setores (sigla, nome_setor) VALUES ("EARS","Escritório Avançado do Estado do Rio Grande do Sul");
INSERT INTO setores (sigla, nome_setor) VALUES ("EACA","Unidade Descentralizada em Extinção de Campinas");
INSERT INTO setores (sigla, nome_setor) VALUES ("EABS","Unidade Descentralizada em Extinção da Baixada Santista");
INSERT INTO setores (sigla, nome_setor) VALUES ("CAD","Coordenação de Administração");
INSERT INTO setores (sigla, nome_setor) VALUES ("SADPA","Setor de Apoio à Diretoria de Pesquisa Aplicada");
INSERT INTO setores (sigla, nome_setor) VALUES ("CGPRO","Coordenação Geral de Projetos");



INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.18","1887.14","6.41");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.17","1469.94","6.27");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.16","1100.92","5.81");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.15","1849.50","5.04");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.14","1701.64","4.31");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.13","11306.90","3.84");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.12","9137.66","3.10");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.11","7286.14","2.47");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.10","6250.69","2.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.09","4907.65","1.67");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.08","4706.98","1.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.07","4080.23","1.39");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.06","3455.09","1.17");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.05","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_1.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.17","18469.94","6.27");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.16","17100.92","5.81");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.15","14849.50","5.04");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.14","12701.64","4.31");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.13","11306.90","3.84");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.12","9137.66","3.10");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.11","7286.14","2.47");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.10","6250.69","2.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.09","4907.65","1.67");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.08","4706.98","1.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.07","4080.23","1.39");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.06","3455.09","1.17");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.05","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_2.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.16","17100.92","5.81");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.15","14849.50","5.04");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.14","12701.64","4.31");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.13","11306.90","3.84");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.12","9137.66","3.10");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.11","7286.14","2.47");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.10","6250.69","2.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.09","4907.65","1.67");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.08","4706.98","1.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.07","4080.23","1.39");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.06","3455.09","1.17");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.05","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("CCE_3.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.17","11081.96","3.76");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.16","10260.55","3.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.15","8909.69","3.03");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.14","7620.99","2.59");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.13","6784.14","2.30");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.12","5482.59","1.86");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.11","4371.68","1.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.10","3750.42","1.27");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.09","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.08","2824.69","0.96");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.07","2448.14","0.83");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.06","2073.06","0.70");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.05","1766.76","0.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_1.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.17","11081.96","3.76");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.16","10260.55","3.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.15","8909.69","3.03");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.14","7620.99","2.59");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.13","6784.14","2.30");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.12","5482.59","1.86");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.11","4371.68","1.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.10","3750.42","1.27");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.09","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.08","2824.69","0.96");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.07","2448.14","0.83");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.06","2073.06","0.70");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.05","1766.76","0.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_2.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.16","10260.55","3.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.15","8909.69","3.03");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.14","7620.99","2.59");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.13","6784.14","2.30");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.12","5482.59","1.86");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.11","4371.68","1.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.10","3750.42","1.27");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.09","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.08","2824.69","0.96");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.07","2448.14","0.83");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.06","2073.06","0.70");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.05","1766.76","0.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_3.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.13","6784.14","2.30");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.12","5482.59","1.86");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.11","4371.68","1.48");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.10","3750.42","1.27");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.09","2944.59","1.00");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.08","2824.69","0.96");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.07","2448.14","0.83");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.06","2073.06","0.70");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.05","1766.76","0.60");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.04","1307.74","0.44");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.03","1089.50","0.37");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.02","609.36","0.21");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("FCE_4.01","360.56","0.12");
INSERT INTO cargos_comissionados (nome_cargo_comissionado, valor, cce_equivalente) VALUES ("Preencher","0","0");


