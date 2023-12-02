SELECT
    e.nome_evidencia,
    e.data,
    GROUP_CONCAT(gdt1.nome_grupo_de_token SEPARATOR ', ') AS tokens,
    GROUP_CONCAT(CONCAT(tdi.nome_tipo_de_identificador, ": ", etdi.valor) SEPARATOR ', ') AS identificadores,
    GROUP_CONCAT(p.nome_pessoa SEPARATOR ', ') AS autores
FROM
    evidencias e
LEFT JOIN
    autores_evidencias ae ON e.id_chave_evidencia = ae.id_evidencia
LEFT JOIN
    pessoas p ON ae.id_pessoa = p.id_chave_pessoa
LEFT JOIN
    evidencias_tipos_de_identificadores etdi ON etdi.id_evidencia = e.id_chave_evidencia
LEFT JOIN
    grupos_vs_identificadores gvi1 ON gvi1.id_tipo_de_identificador = etdi.id_tipo_de_identificador
LEFT JOIN
    tipos_de_identificadores tdi ON gvi1.id_tipo_de_identificador = tdi.id_chave_tipo_de_identificador
LEFT JOIN
    grupos_de_tokens gdt1 ON gdt1.id_chave_grupo_de_token = gvi1.id_grupo_de_token
LEFT JOIN
    grupos_de_tokens gdt2 ON gdt1.id_chave_grupo_de_token = gvi1.id_grupo_de_token
LEFT JOIN
    tokens t1 ON t1.id_grupo_de_token = gdt1.id_chave_grupo_de_token
LEFT JOIN
    tokens t2 ON t2.id_grupo_de_token = gdt2.id_chave_grupo_de_token
LEFT JOIN
    tipos_de_evidencias te ON te.id_token = t1.id_chave_token
LEFT JOIN
    tipos_de_veiculos tdv ON tdv.id_token = t1.id_chave_token
LEFT JOIN
    veiculos_tipos_de_identificadores vtdi ON vtdi.id_veiculo = tdv.id_chave_tipo_de_veiculo
WHERE 
    	gvi1.id_grupo_de_token = gdt1.id_chave_grupo_de_token 
	AND etdi.id_tipo_de_identificador = tdi.id_chave_tipo_de_identificador
	AND tdi.id_chave_tipo_de_identificador = gvi1.id_tipo_de_identificador
	AND e.id_token_tipo_de_evidencia = te.id_token
	AND tdi.id_chave_tipo_de_identificador = vtdi.id_tipo_de_identificador
GROUP BY
    e.id_chave_evidencia;

