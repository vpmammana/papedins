SELECT
    CONCAT("<tr><td class='fr_evidencia'>",e.nome_evidencia,"</td>") as evidencia,
    CONCAT("<td class='fr_data'>",e.data,"</td>") as data,
    CONCAT("<td class='fr_grupo'><div class='fr_container_flex'>",GROUP_CONCAT(DISTINCT CONCAT("<div class='fr_autor'>",p.nome_pessoa, "</div>") SEPARATOR ""), "</div></td>") AS autores,
    CONCAT("<td class='fr_grupo'><div class='fr_container_flex'>", GROUP_CONCAT(DISTINCT CONCAT("<div class='fr_identificador'>",tdi.nome_tipo_de_identificador,": ", valor, "</div>") SEPARATOR ', '), "</div></td></tr>") AS identificadores
FROM
    evidencias e
LEFT JOIN
    autores_evidencias ae ON e.id_chave_evidencia = ae.id_evidencia
LEFT JOIN
    pessoas p ON ae.id_pessoa = p.id_chave_pessoa
LEFT JOIN
    evidencias_tipos_de_identificadores etdi ON e.id_chave_evidencia = etdi.id_evidencia
LEFT JOIN
    tipos_de_identificadores tdi ON etdi.id_tipo_de_identificador = tdi.id_chave_tipo_de_identificador
group by e.id_chave_evidencia;
