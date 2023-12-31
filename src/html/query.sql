select 
		id_chave_tipo_elemento_sintatico, 
		nome_frase, 
		nome_tipo_elemento_sintatico as tipo, 
		nome_token_na_frase, 
		nome_token, 
		id_chave_frase, 
		ordem, 
		id_chave_tipo_token 
from 
		tipos_elementos_sintaticos, 
		frases, 
		tokens_nas_frases, 
		tokens, 
		tipos_tokens 
where 
		id_tipo_elemento_sintatico="'.$id_tipo_sintatico.'" 
		and id_tipo_elemento_sintatico =id_chave_tipo_elemento_sintatico 
		and id_chave_frase=id_frase and id_token = id_chave_token 
		and id_tipo_token = id_chave_tipo_token 
order by 
		id_chave_frase, 
		ordem;
