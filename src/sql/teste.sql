select a.*, b.*, c.* 
from 
	(
		select 
			nts.*, pro.*, vd.*
			from 
				nested_tipos_secoes as nts, 
				propriedades as pro, 
				instancias_propriedades as ip, 
				valores_discretos as vd, 
				tipos_tokens as tt 
			where 
				ip.id_propriedade = pro.id_chave_propriedade and 
				id_valor_discreto = id_chave_valor_discreto and 
				id_chave_nested_tipo_secao = 
					(
						select 
							id_chave_nested_tipo_secao 
						from 
							nested_tipos_secoes as nts2 
						where 
							nome_nested_tipo_secao="substantivo_flexao_definida") and 
							vd.id_propriedade=pro.id_chave_propriedade and 
							ip.id_nested_tipo_secao = id_chave_nested_tipo_secao and 
							pro.id_chave_propriedade = 
								(
									select 
										id_chave_propriedade 
									from 
										propriedades as prop2 
									where 
										prop2.nome_propriedade = "tabela_externa"
								) 
								and nts.id_tipo_token=id_chave_tipo_token
	)  a
CROSS JOIN
	(
		select 
			nts.*, pro.*, vd.*
			from 
				nested_tipos_secoes as nts, 
				propriedades as pro, 
				instancias_propriedades as ip, 
				valores_discretos as vd, 
				tipos_tokens as tt 
			where 
				ip.id_propriedade = pro.id_chave_propriedade and 
				id_valor_discreto = id_chave_valor_discreto and 
				id_chave_nested_tipo_secao = 
					(
						select 
							id_chave_nested_tipo_secao 
						from 
							nested_tipos_secoes as nts2 
						where 
							nome_nested_tipo_secao="substantivo_flexao_definida") and 
							vd.id_propriedade=pro.id_chave_propriedade and 
							ip.id_nested_tipo_secao = id_chave_nested_tipo_secao and 
							pro.id_chave_propriedade = 
								(
									select 
										id_chave_propriedade 
									from 
										propriedades as prop2 
									where 
										prop2.nome_propriedade = "campo_externo"
								) 
								and nts.id_tipo_token=id_chave_tipo_token
	)  b
CROSS JOIN
	(
		select 
			nts.*, pro.*, vd.*
			from 
				nested_tipos_secoes as nts, 
				propriedades as pro, 
				instancias_propriedades as ip, 
				valores_discretos as vd, 
				tipos_tokens as tt 
			where 
				ip.id_propriedade = pro.id_chave_propriedade and 
				id_valor_discreto = id_chave_valor_discreto and 
				id_chave_nested_tipo_secao = 
					(
						select 
							id_chave_nested_tipo_secao 
						from 
							nested_tipos_secoes as nts2 
						where 
							nome_nested_tipo_secao="substantivo_flexao_definida") and 
							vd.id_propriedade=pro.id_chave_propriedade and 
							ip.id_nested_tipo_secao = id_chave_nested_tipo_secao and 
							pro.id_chave_propriedade = 
								(
									select 
										id_chave_propriedade 
									from 
										propriedades as prop2 
									where 
										prop2.nome_propriedade = "id_chave_externa"
								) 
								and nts.id_tipo_token=id_chave_tipo_token
	)  c \G 
	
