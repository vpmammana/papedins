#para manter a base de dados sempre atualizada é preciso abrir a página https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html_arvore/, colocar a senha e entrar no sistema. A partir daí é preciso apertar o botão "grava_backup_sql". Um arquivo script_SQL_data.sql será criado no diretório php_arvore. Esse arquivo deve ser copiado para o diretorio sql com o nome de script_SQL_padrao.sql. Além disso, é preciso carregar a página https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/ppapdi.php. Ao carregar a página um arquivo script_recuperacao_data.sql será criado no diretorio html. Esse arquivo deve ser copiado em cima de script_recuperacao_padrao.sql no diretorio sql.

mysql -u root -ptoninho13 papedins_db < papedins.sql
mysql -u root -ptoninho13 papedins_db < arvore_sintatica.sql
mysql -u root -ptoninho13 papedins_db < insert_tokens.sql
mysql -u root -ptoninho13 papedins_db < inicial.sql
mysql -u root -ptoninho13 papedins_db < script_SQL_padrao.sql
mysql -u root -ptoninho13 papedins_db < script_recuperacao_padrao.sql # se tiver alteracao tem que copiar do diretorio html o arquivo script_recuperacao_ tal... para o diretorio sql
mysql -u root -ptoninho13 papedins_db < publicacoes.sql
mysql -u root -ptoninho13 papedins_db < script_tipos_veidencias.sql
mysql -u root -ptoninho13 papedins_db < cria_journal2.sql # muito longo e nao precisa fazer todas as vezes 
mysql -u root -ptoninho13 papedins_db < paises.sql 
mysql -u root -ptoninho13 papedins_db < script_update_grupo_padrao.sql # se houver alteracao tem que copiar do diretorio html o arquivo script_update_grupo.sql para o diretorio sql
mysql -u root -ptoninho13 papedins_db < complementos_journals.sql 
mysql -u root -ptoninho13 papedins_db < script_cria_n_to_n_grupos_tokens.sql 
./cria_tabela_grupo_duplo.bash # cria o vinculo entre evidencias e veiculos com grupos_de_tokens
mysql -u root -ptoninho13 papedins_db < script_update_valido.sql # se houver alteracao tem que copiar do diretorio html o arquivo script_update_valido.sql para o diretorio sql
mysql -u root -ptoninho13 papedins_db < enderecos.sql # para guardar enderecos do OpenStreetMaps
mysql -u root -ptoninho13 papedins_db < paises_iso3166_2.sql # para guardar os códigos de paises e linkar a tabela paises com a tabela da iso3166_2
mysql -u root -ptoninho13 papedins_db < estados.sql 
mysql -u root -ptoninho13 papedins_db < cria_municipios.sql 

