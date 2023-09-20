
		select 
			nts.*, pro.*, vd.*
			from
				secoes as s
			left join
				nested_tipos_secoes as nts	on s.id_tipo_secao = nts.id_chave_nested_tipo_secao 
				left join instancias_propriedades as ip on nts.id_chave_nested_tipo_secao = ip.id_nested_tipo_secao 
				left join propriedades as pro on ip.id_propriedade = pro.id_chave_propriedade
				left join valores_discretos as vd on vd.id_propriedade = pro.id_chave_propriedade 
				left join tipos_tokens as tt on tt.id_chave_tipo_token = nts.id_tipo_token 
		
			where 
				ip.id_propriedade = pro.id_chave_propriedade and 
				id_valor_discreto = id_chave_valor_discreto and 
				
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
								and nts.id_tipo_token=id_chave_tipo_token;
	
