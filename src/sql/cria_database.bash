#!/bin/bash

#para manter a base de dados sempre atualizada é preciso abrir a página https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html_arvore/, colocar a senha e entrar no sistema. A partir daí é preciso apertar o botão "grava_backup_sql\e[0m". Um arquivo script_SQL_data.sql será criado no diretório php_arvore. Esse arquivo deve ser copiado para o diretorio sql com o nome de script_SQL_padrao.sql. Além disso, é preciso carregar a página https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/ppapdi.php. Ao carregar a página um arquivo script_recuperacao_data.sql será criado no diretorio html. Esse arquivo deve ser copiado em cima de script_recuperacao_padrao.sql no diretorio sql.


echo -e "\n\e[33;1mcriando a base de dados papedins_db\e[0m";
echo -e "\n\e[33;1mguardando as evidências, endereços, identificadores e autores para uso no final do script\e[0m";

./guarda_evidencias.bash > script_recupera_dados_corriqueiros.sql # cria o arquivo em sql para recuperar os dados corriqueiros de evidencias. Se vc não precisa destes dados, comente esta linha, mas lembre-se de comentar também a linha que chama faz o dump do script_recupera_dados_corriqueiros.sql no final deste arquivo. importante guardar o script_dados_corriqueiros.sql para recuperar os dados corriqueiros de evidencias se precisar mais tarde.

# apaga as tabelas que foram salvas acima.
echo -e "\n\e[31;1mapagando as tabelas que foram salvas acima";
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS enderecos_evidencias;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS enderecos_do_OSM;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS evidencias_tipos_de_identificadores;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS autores_evidencias;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS evidencias;'


echo -e "\n\e[31;1mexecutando a papedins.sql\e[0m";
cat papedins.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat papedins.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat papedins.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < papedins.sql > /dev/null

echo -e "\n\e[31;1mexecutando a arvore_sintatica.sql\e[0m";
cat arvore_sintatica.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat arvore_sintatica.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat arvore_sintatica.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < arvore_sintatica.sql > /dev/null

echo -e "\n\e[31;1mexecutando a insert_tokens.sql\e[0m";
cat insert_tokens.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat insert_tokens.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat insert_tokens.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < insert_tokens.sql > /dev/null

echo -e "\n\e[31;1mexecutando a inicial.sql\e[0m";
cat inicial.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat inicial.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat inicial.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < inicial.sql > /dev/null

echo -e "\n\e[31;1mexecutando a script_SQL_padrao.sql\e[0m";
cat script_SQL_padrao.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_SQL_padrao.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_SQL_padrao.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_SQL_padrao.sql > /dev/null # se houver alteracao tem que copiar do diretorio php_arvore o arquivo script_SQL_data.sql para o diretorio sql

echo -e "\n\e[31;1mexecutando a script_recuperacao_padrao.sql\e[0m";
cat script_recuperacao_padrao.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_recuperacao_padrao.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_recuperacao_padrao.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_recuperacao_padrao.sql > /dev/null  # se tiver alteracao tem que copiar do diretorio html o arquivo script_recuperacao_ tal... para o diretorio sql

echo -e "\n\e[31;1mexecutando a publicacoes.sql\e[0m";
cat publicacoes.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat publicacoes.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat publicacoes.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < publicacoes.sql > /dev/null

echo -e "\n\e[31;1mexecutando a script_tipos_veidencias.sql\e[0m";
cat script_tipos_veidencias.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_tipos_veidencias.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_tipos_veidencias.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_tipos_veidencias.sql > /dev/null # se houver alteracao tem que copiar do diretorio html o arquivo script_tipos_veidencias.sql para o diretorio sql

echo -e "\n\e[31;1mexecutando a cria_journal2.sql\e[0m";
cat cria_journal2.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat cria_journal2.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat cria_journal2.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < cria_journal2.sql > /dev/null # muito longo e nao precisa fazer todas as vezes 

echo -e "\n\e[31;1mexecutando a paises.sql\e[0m";
cat paises.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat paises.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat paises.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < paises.sql > /dev/null

echo -e "\n\e[31;1mexecutando a script_update_grupo_padrao.sql\e[0m";
cat script_update_grupo_padrao.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_update_grupo_padrao.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_update_grupo_padrao.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_update_grupo_padrao.sql > /dev/null # se houver alteracao tem que copiar do diretorio html o arquivo script_update_grupo.sql para o diretorio sql

echo -e "\n\e[31;1mexecutando a complementos_journals.sql\e[0m";
cat complementos_journals.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat complementos_journals.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat complementos_journals.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < complementos_journals.sql > /dev/null

echo -e "\n\e[31;1mexecutando a script_cria_n_to_n_grupos_tokens.sql\e[0m";
cat script_cria_n_to_n_grupos_tokens.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_cria_n_to_n_grupos_tokens.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_cria_n_to_n_grupos_tokens.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_cria_n_to_n_grupos_tokens.sql > /dev/null # se houver alteracao tem que copiar do diretorio html o arquivo script_cria_n_to_n_grupos_tokens.sql para o diretorio sql


./cria_tabela_grupo_duplo.bash # cria o vinculo entre evidencias e veiculos com grupos_de_tokens

echo -e "\n\e[31;1mexecutando a script_update_valido.sql\e[0m";
cat script_update_valido.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_update_valido.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_update_valido.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_update_valido.sql > /dev/null  # se houver alteracao tem que copiar do diretorio html o arquivo script_update_valido.sql para o diretorio sql

echo -e "\n\e[31;1mexecutando a enderecos.sql\e[0m";
cat enderecos.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat enderecos.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat enderecos.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < enderecos.sql > /dev/null # para guardar enderecos do OpenStreetMaps

echo -e "\n\e[31;1mexecutando a paises_iso3166_2.sql\e[0m";
cat paises_iso3166_2.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat paises_iso3166_2.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat paises_iso3166_2.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < paises_iso3166_2.sql > /dev/null  # para guardar os códigos de paises e linkar a tabela paises com a tabela da iso3166_2

echo -e "\n\e[31;1mexecutando a estados.sql\e[0m";
cat estados.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat estados.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat estados.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < estados.sql > /dev/null # para guardar os estados dos paises e linkar a tabela paises com a tabela da iso3166_2

echo -e "\n\e[31;1mexecutando a cria_municipios.sql\e[0m";
cat cria_municipios.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat cria_municipios.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat cria_municipios.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < cria_municipios.sql > /dev/null # para guardar os municipios dos paises e linkar a tabela paises com a tabela da iso3166_2

echo -e "\n\e[31;1mexecutando a cria_base_ror.sql\e[0m";
cat cria_base_ror.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat cria_base_ror.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat cria_base_ror.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < cria_base_ror.sql > /dev/null  # todas as instituiçòes de pesquisa do mundo

echo -e "\n\e[31;1mexecutando a popula_base_ror.php (DEMORA BASTANTE)\e[0m";
php popula_base_ror.php > /dev/null # precisa do arquivo json anexado....

echo -e "\n\e[31;1mexecutando a script_recupera_dados_corriqueiros.sql que foi gerado no começo deste script\e[0m";
cat script_recupera_dados_corriqueiros.sql | grep -i -o "CREATE TABLE [^ ]*" | sort | uniq
cat script_recupera_dados_corriqueiros.sql | grep -i -o "INSERT INTO [^ ]*" | sort | uniq
cat script_recupera_dados_corriqueiros.sql | grep -i -o "UPDATE [^ ]*" | sort | uniq
mysql -u root -ptoninho13 papedins_db < script_recupera_dados_corriqueiros.sql # este arquivo foi criado no começo deste script, quando as tabelas respectivas também foram apagadas com o scrtip guarda_evidencias.bash
