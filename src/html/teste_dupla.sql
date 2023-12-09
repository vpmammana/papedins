select
        concat('<td class=\"linha_nome_grupo\">', acentuada, '</td>') as primeira_coluna,
        nome_grupo_de_token,
        concat('<td><div class=\"linha_tokens_internos\">', group_concat(concat('<div class=\"div_tokens_internos\"><label class=\"label_evidencia\">', e.nome_token,'</label> - <label class=\"label_veiculo\">', v.nome_token,'</label><label class=\"rotulo_valido\">válido</label><input id=\"check_',id_chave_duplo_token_para_grupo_de_token,'\" type=\"checkbox\" value=\"\" data-id-chave-duplo=\"',id_chave_duplo_token_para_grupo_de_token,'\"', CASE WHEN valido='sim' THEN 'checked' ELSE '' END  ,' onclick=\"atualizarValido(this);\"></div>') order by e.nome_token,v.nome_token separator ''), '</div></td>') as segunda_coluna, 
        group_concat(concat('[',e.nome_token, '-', v.nome_token, ']')),
	concat('<td>',group_concat(distinct concat('<div class=\"fr_identificador\">',ti.nome_tipo_de_identificador, '</div>')),'</td>') as terceira_coluna 
from 
        duplos_tokens_para_grupos_de_tokens as dt, 
        tokens as e, 
        tokens as v, 
        grupos_de_tokens as gt,
	tipos_de_identificadores as ti,
	grupos_vs_identificadores as gvi
where 
        id_token_evidencia = e.id_chave_token and 
        id_token_veiculo = v.id_chave_token and 
        dt.id_grupo_de_token = id_chave_grupo_de_token and
	gvi.id_grupo_de_token = id_chave_grupo_de_token and 
	ti.id_chave_tipo_de_identificador = gvi.id_tipo_de_identificador 
group by id_chave_grupo_de_token;

