# COALESCE porque no mysql se o campo for null, o resultado da concatenação é null

echo -e "# ===========================\n"
echo -e "# insert into evidencias\n"
# evidencias
#mysql -u root -ptoninho13 papedins_db -e "select * from tipos_de_identificadores"

if mysql -u root -ptoninho13 -e "use papedins_db; show tables like 'evidencias'" | grep 'evidencias'> /dev/null 2>&1; then
mysql -u root -ptoninho13 papedins_db -N -e 'select CONCAT("INSERT INTO evidencias (nome_evidencia, id_token_tipo_de_evidencia, id_token_tipo_de_veiculo, latitude, longitude, data, time_stamp) VALUES \n(\"", COALESCE(nome_evidencia,""), "\", (select id_chave_token from tokens where nome_token = \"",(select nome_token from tokens where id_chave_token = id_token_tipo_de_evidencia),"\"), (select id_chave_token from tokens where nome_token=\"", (select nome_token from tokens where id_chave_token = id_token_tipo_de_veiculo),"\"), ", COALESCE(latitude,""), ", ", COALESCE(longitude,""), ", \"", COALESCE(data,""), "\", \"", COALESCE(time_stamp,""), "\");\n\n") from evidencias' -B | sed 's/\\n/\n/g' 
else
	# echo -e "Tabela evidencias não existe\n\n"
	echo ""
fi

#autores_evidencias
echo -e "\n\n\n# ===========================\n"
echo -e "# insert into autores_evidencias\n"

if mysql -u root -ptoninho13 -e "use papedins_db; show tables like 'autores_evidencias'" | grep 'autores_evidencias'> /dev/null 2>&1; then
mysql -u root -ptoninho13 papedins_db -N -e 'select CONCAT("INSERT INTO autores_evidencias (nome_autor_evidencia, id_evidencia, id_pessoa, time_stamp) VALUES \n(\"", COALESCE(nome_autor_evidencia,""), "\", (select id_chave_evidencia from evidencias where nome_evidencia=\"", (select nome_evidencia from evidencias where id_chave_evidencia = id_evidencia),"\" and data=\"",(select data from evidencias where id_chave_evidencia=id_evidencia),"\"), (select id_chave_pessoa from pessoas where nome_pessoa = \"", (select nome_pessoa from pessoas where id_chave_pessoa = id_pessoa),"\"), \"", COALESCE(time_stamp,""), "\");\n\n") from autores_evidencias' -B | sed 's/\\n/\n/g'
else
	#echo -e "Tabela autores_evidencias não existe\n\n"
	echo ""
fi

echo -e "\n\n\n# ===========================\n"
echo -e "# insert into evidencias_tipos_de_identificadores\n"
if mysql -u root -ptoninho13 -e "use papedins_db; show tables like 'evidencias_tipos_de_identificadores'" | grep 'evidencias_tipos_de_identificadores'> /dev/null 2>&1; then
mysql -u root -ptoninho13 papedins_db -N -e 'select CONCAT("INSERT INTO evidencias_tipos_de_identificadores (nome_evidencia_tipo_de_identificador, id_tipo_de_identificador, id_evidencia, valor, id_chave_externa, time_stamp) VALUES \n(\"", COALESCE(nome_evidencia_tipo_de_identificador,""), "\", (select id_chave_tipo_de_identificador from tipos_de_identificadores where nome_tipo_de_identificador=\"", (select nome_tipo_de_identificador from tipos_de_identificadores where id_chave_tipo_de_identificador = id_tipo_de_identificador),"\"), (select id_chave_evidencia from evidencias where nome_evidencia = \"", (select nome_evidencia from evidencias where id_chave_evidencia = id_evidencia),"\" and data = \"",(select data from evidencias where id_chave_evidencia=id_evidencia),"\"), \"", COALESCE(valor,""), "\", NULL, \"", COALESCE(time_stamp,""), "\");\n\n") from evidencias_tipos_de_identificadores' -B | sed 's/\\n/\n/g'
else
	#echo -e "Tabela evidencias_tipos_de_identificadores não existe\n\n"
	echo ""
fi


#mysql -u root -ptoninho13 papedins_db -N -e "SHOW VARIABLES LIKE 'group_concat_max_len';"


echo -e "\n\n\n# ===========================\n"
echo -e "# insert into enderecos_do_OSM\n"
if mysql -u root -ptoninho13 -e "use papedins_db; show tables like 'enderecos_do_OSM'" | grep 'enderecos_do_OSM'> /dev/null 2>&1; then
mysql -u root -ptoninho13 papedins_db -N -e 'select CONCAT("INSERT INTO enderecos_do_OSM (id_chave_endereco_do_OSM, place_id, licence, osm_type, osm_id, tipo, latitude, longitude, descricao, pais, codigo_pais, estado, codigo_estado, ISO3166_2, cidade, rua, bairro, regiao_do_estado, regiao_do_pais, importancia_nominatim, postcode, id_pais, id_estado, id_municipio, limite_sul, limite_norte, limite_oeste, limite_leste, class, time_stamp) VALUES \n(\"", COALESCE(id_chave_endereco_do_OSM,""), "\", \"", COALESCE(place_id,""), "\", \"", COALESCE(licence,""), "\", \"", COALESCE(osm_type,""), "\", \"", COALESCE(osm_id,""), "\", \"", COALESCE(tipo,""), "\", \"", COALESCE(latitude,""), "\", \"", COALESCE(longitude,""), "\", \"", COALESCE(descricao,""), "\", \"", COALESCE(pais,""), "\", \"", COALESCE(codigo_pais,""), "\", \"", COALESCE(estado,""), "\", \"", COALESCE(codigo_estado,""), "\", \"", COALESCE(ISO3166_2,""), "\", \"", COALESCE(cidade,""), "\", \"", COALESCE(rua,""), "\", \"", COALESCE(bairro,""), "\", \"", COALESCE(regiao_do_estado,""), "\", \"", COALESCE(regiao_do_pais,""), "\", \"", COALESCE(importancia_nominatim,""), "\", \"", COALESCE(postcode,""), "\",(SELECT id_chave_pais FROM paises WHERE nome_pais=\"",(SELECT nome_pais FROM paises WHERE id_chave_pais=id_pais),"\"), (SELECT id_chave_estado FROM estados WHERE codigo_iso3166_2 = \"",(select codigo_iso3166_2 from estados where id_chave_estado=id_estado),"\"), (SELECT id_chave_municipio FROM municipios WHERE nome_municipio = \"",(SELECT nome_municipio from municipios where id_chave_municipio=id_municipio),"\" and nome_uf = \"",(SELECT nome_uf from municipios where id_chave_municipio=id_municipio),"\"), \"", COALESCE(limite_sul,""), "\", \"", COALESCE(limite_norte,""), "\", \"", COALESCE(limite_oeste,""), "\", \"", COALESCE(limite_leste,""), "\", \"", COALESCE(class,""), "\", \"", COALESCE(time_stamp,""), "\");\n\n") from enderecos_do_OSM' -B | sed 's/\\n/\n/g'i
else
	# echo -e "Tabela enderecos_do_OSM não existe\n\n"
	echo ""
fi

#autores_evidencias
echo -e "\n\n\n# ===========================\n"
echo -e "# insert into enderecos_evidencias\n"
if mysql -u root -ptoninho13 -e "use papedins_db; show tables like 'enderecos_evidencias'" | grep 'enderecos_evidencias'> /dev/null 2>&1; then
mysql -u root -ptoninho13 papedins_db -N -e 'select CONCAT("INSERT INTO enderecos_evidencias (id_evidencia, id_endereco_do_OSM, time_stamp) VALUES \n((select id_chave_evidencia from evidencias where nome_evidencia=\"", (select nome_evidencia from evidencias where id_chave_evidencia = id_evidencia),"\" and data=\"",(select data from evidencias where id_chave_evidencia=id_evidencia),"\"), (select id_chave_endereco_do_OSM from enderecos_do_OSM where osm_type = \"", (select osm_type from enderecos_do_OSM where id_chave_endereco_do_OSM = id_endereco_do_OSM),"\" and osm_id = \"",(select osm_id from enderecos_do_OSM where id_chave_endereco_do_OSM = id_endereco_do_OSM),"\" and class = \"",(select class from enderecos_do_OSM where id_chave_endereco_do_OSM = id_endereco_do_OSM),"\"), \"", COALESCE(time_stamp,""), "\");\n\n") from enderecos_evidencias' -B | sed 's/\\n/\n/g'
else
	# echo -e "Tabela enderecos_evidencias não existe\n\n"
	echo ""
fi

mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS enderecos_evidencias;' 
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS enderecos_do_OSM;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS evidencias_tipos_de_identificadores;' 
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS autores_evidencias;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS evidencias;'








