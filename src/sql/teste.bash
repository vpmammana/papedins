
./guarda_evidencias.bash > script_recupera_dados_corriqueiros.sql # cria o arquivo em sql para recuperar os dados corriqueiros de evidencias. Se vc não precisa destes dados, comente esta linha, mas lembre-se de comentar também a linha que chama faz o dump do script_recupera_dados_corriqueiros.sql no final deste arquivo. importante guardar o script_dados_corriqueiros.sql para recuperar os dados corriqueiros de evidencias se precisar mais tarde.

# apaga as tabelas que foram salvas acima.

mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS enderecos_evidencias;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS enderecos_do_OSM;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS evidencias_tipos_de_identificadores;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS autores_evidencias;'
mysql -u root -ptoninho13 papedins_db -N -e 'DROP TABLE IF EXISTS evidencias;'



mysql -u root -ptoninho13 papedins_db < papedins.sql
mysql -u root -ptoninho13 papedins_db < arvore_sintatica.sql
mysql -u root -ptoninho13 papedins_db < insert_tokens.sql

