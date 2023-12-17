#cat estados_iso3166_2.txt | awk 'BEGIN{FS="|"}{codigo=$2; codigo_pais=codigo; gsub(/[a-zA-Z][a-zA-Z]\-/,"",$2); gsub(/\-[a-zA-Z][a-zA-Z]/,"",codigo_pais); print "INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES (\""$3"\", \""$1"\", \""codigo"\", \""$2"\", \""$4"\", \""codigo_pais"\", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = \""codigo_pais"\"));"}' > estados.sql



INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Acre", "state", "BR-AC", "AC", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Alagoas", "state", "BR-AL", "AL", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Amapá", "state", "BR-AP", "AP", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Amazonas", "state", "BR-AM", "AM", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Bahia", "state", "BR-BA", "BA", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Ceará", "state", "BR-CE", "CE", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Distrito Federal", "federal district", "BR-DF", "DF", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Espírito Santo", "state", "BR-ES", "ES", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Goiás", "state", "BR-GO", "GO", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Maranhão", "state", "BR-MA", "MA", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Mato Grosso", "state", "BR-MT", "MT", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Mato Grosso do Sul", "state", "BR-MS", "MS", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Minas Gerais", "state", "BR-MG", "MG", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Paraná", "state", "BR-PR", "PR", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Paraíba", "state", "BR-PB", "PB", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Pará", "state", "BR-PA", "PA", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Pernambuco", "state", "BR-PE", "PE", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Piauí", "state", "BR-PI", "PI", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Rio Grande do Norte", "state", "BR-RN", "RN", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Rio Grande do Sul", "state", "BR-RS", "RS", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Rio de Janeiro", "state", "BR-RJ", "RJ", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Rondônia", "state", "BR-RO", "RO", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Roraima", "state", "BR-RR", "RR", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Santa Catarina", "state", "BR-SC", "SC", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Sergipe", "state", "BR-SE", "SE", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("São Paulo", "state", "BR-SP", "SP", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));
INSERT INTO estados (nome_estado, categoria, codigo_iso3166_2, codigo_estado, idioma, codigo_pais, id_pais) VALUES ("Tocantins", "state", "BR-TO", "TO", "pt", "BR", (SELECT id_chave_pais from paises WHERE codigo_alpha2 = "BR"));


#tail -n +8 municipios_brasileiros.csv | awk 'BEGIN{FS="|"}{print $2"|"$1}' | uniq | awk 'BEGIN{FS="|"}{print "UPDATE estados set codigo_ibge = "$2" where nome_estado = \""$1"\";"}'

UPDATE estados set codigo_ibge = 11 where nome_estado = "Rondônia";
UPDATE estados set codigo_ibge = 12 where nome_estado = "Acre";
UPDATE estados set codigo_ibge = 13 where nome_estado = "Amazonas";
UPDATE estados set codigo_ibge = 14 where nome_estado = "Roraima";
UPDATE estados set codigo_ibge = 15 where nome_estado = "Pará";
UPDATE estados set codigo_ibge = 16 where nome_estado = "Amapá";
UPDATE estados set codigo_ibge = 17 where nome_estado = "Tocantins";
UPDATE estados set codigo_ibge = 21 where nome_estado = "Maranhão";
UPDATE estados set codigo_ibge = 22 where nome_estado = "Piauí";
UPDATE estados set codigo_ibge = 23 where nome_estado = "Ceará";
UPDATE estados set codigo_ibge = 24 where nome_estado = "Rio Grande do Norte";
UPDATE estados set codigo_ibge = 25 where nome_estado = "Paraíba";
UPDATE estados set codigo_ibge = 26 where nome_estado = "Pernambuco";
UPDATE estados set codigo_ibge = 27 where nome_estado = "Alagoas";
UPDATE estados set codigo_ibge = 28 where nome_estado = "Sergipe";
UPDATE estados set codigo_ibge = 29 where nome_estado = "Bahia";
UPDATE estados set codigo_ibge = 31 where nome_estado = "Minas Gerais";
UPDATE estados set codigo_ibge = 32 where nome_estado = "Espírito Santo";
UPDATE estados set codigo_ibge = 33 where nome_estado = "Rio de Janeiro";
UPDATE estados set codigo_ibge = 35 where nome_estado = "São Paulo";
UPDATE estados set codigo_ibge = 41 where nome_estado = "Paraná";
UPDATE estados set codigo_ibge = 42 where nome_estado = "Santa Catarina";
UPDATE estados set codigo_ibge = 43 where nome_estado = "Rio Grande do Sul";
UPDATE estados set codigo_ibge = 50 where nome_estado = "Mato Grosso do Sul";
UPDATE estados set codigo_ibge = 51 where nome_estado = "Mato Grosso";
UPDATE estados set codigo_ibge = 52 where nome_estado = "Goiás";
UPDATE estados set codigo_ibge = 53 where nome_estado = "Distrito Federal";

