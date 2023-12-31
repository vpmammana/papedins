select 
	ge.nome_grupo_de_token
from 
	grupos_vs_tipos_de_evidencias_n_to_n as ge, 
	grupos_vs_tipos_de_veiculos_n_to_n as gv, 
	tokens as t1, tokens as t2, 
	tipos_de_evidencias tde, 
	tipos_de_veiculos tdv,
	evidencias 
where 
	id_tipo_de_evidencia = id_chave_tipo_de_evidencia and 
	t1.id_chave_token=tde.id_token and 
	t2.id_chave_token=tdv.id_token and 
	id_tipo_de_veiculo = id_chave_tipo_de_veiculo and 
	id_tipo_de_veiculo = id_chave_tipo_de_veiculo and 
	gv.id_grupo_de_token = ge.id_grupo_de_token and 
	id_token_tipo_de_evidencia = t1.id_chave_token and
	id_token_tipo_de_veiculo = t2.id_chave_token and
	id_chave_evidencia=1;

select ge.nome_grupo_de_token from grupos_vs_tipos_de_evidencias_n_to_n as ge, grupos_vs_tipos_de_veiculos_n_to_n as gv, tokens as t1, tokens as t2, tipos_de_evidencias tde, tipos_de_veiculos tdv, evidencias where id_tipo_de_evidencia = id_chave_tipo_de_evidencia and t1.id_chave_token=tde.id_token and t2.id_chave_token=tdv.id_token and id_tipo_de_veiculo = id_chave_tipo_de_veiculo and id_tipo_de_veiculo = id_chave_tipo_de_veiculo and gv.id_grupo_de_token = ge.id_grupo_de_token and id_token_tipo_de_evidencia = t1.id_chave_token and id_token_tipo_de_veiculo = t2.id_chave_token and id_chave_evidencia=1; 
