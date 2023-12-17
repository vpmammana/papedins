DROP TABLE IF EXISTS enderecos_evidencias;
DROP TABLE IF EXISTS enderecos_do_OSM;
DROP TABLE IF EXISTS municipios; 
DROP TABLE IF EXISTS estados;

CREATE TABLE estados (
    id_chave_estado INT AUTO_INCREMENT PRIMARY KEY,
    nome_estado VARCHAR(255) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    codigo_iso3166_2 VARCHAR(10) NOT NULL UNIQUE,
    codigo_estado CHAR(2) NOT NULL UNIQUE,
    idioma VARCHAR(50) NOT NULL,
    codigo_pais CHAR(2) NOT NULL,
    codigo_ibge int,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES paises (id_chave_pais)
);

-- Criação da tabela "municipios"
CREATE TABLE municipios (
    id_chave_municipio INT AUTO_INCREMENT PRIMARY KEY,
    uf CHAR(2) NOT NULL,
    nome_uf VARCHAR(255) NOT NULL,
    regiao_geografica_intermediaria CHAR(4) NOT NULL,
    nome_regiao_geografica_intermediaria VARCHAR(255) NOT NULL,
    regiao_geografica_imediata CHAR(6) NOT NULL,
    nome_regiao_geografica_imediata VARCHAR(255) NOT NULL,
    mesorregiao_geografica CHAR(2) NOT NULL,
    nome_mesorregiao VARCHAR(255) NOT NULL,
    microrregiao_geografica CHAR(3) NOT NULL,
    nome_microrregiao VARCHAR(255) NOT NULL,
    municipio CHAR(5) NOT NULL,
    codigo_municipio_completo CHAR(12) NOT NULL UNIQUE,
    nome_municipio VARCHAR(255) NOT NULL,
    id_estado INT,
    unique(municipio, uf),
    unique(nome_municipio, uf),
    FOREIGN KEY (id_estado) REFERENCES estados (id_chave_estado)
);


CREATE TABLE enderecos_do_OSM (
    id_chave_endereco_do_OSM INT AUTO_INCREMENT PRIMARY KEY,
    place_id BIGINT, # identificador do Google Maps
    licence VARCHAR(255), # licença do OpenStreetMap
    osm_type VARCHAR(50), # tipo de objeto do OpenStreetMap
    osm_id BIGINT, # identificador do OpenStreetMap
    tipo VARCHAR(50), # tipo de endereço
    latitude DECIMAL(10, 8), # latitude
    longitude DECIMAL(11, 8), # longitude
    descricao TEXT, # descrição do endereço: display_name
    pais VARCHAR(100), # nome do país
    codigo_pais VARCHAR(10), # código do país: country_code
    estado VARCHAR(100), # nome do estado
    codigo_estado VARCHAR(10), # código do estado: iso3166-2
    ISO3166_2 VARCHAR(10), # código do estado: iso3166-2
    cidade VARCHAR(100), # nome da cidade
    rua VARCHAR(100), # nome da rua
    bairro VARCHAR(200), # nome do bairro (village)
    regiao_do_estado VARCHAR(200), # nome da região do estado
    regiao_do_pais VARCHAR(200), # nome da região do país
    importancia_nominatim DECIMAL(10, 8), # importância do endereço segundo as consultas ao nominatim
    postcode VARCHAR(20), # código postal
    id_pais INT,
    id_estado INT,
    id_municipio INT,
    limite_sul DECIMAL(10, 8),
    limite_norte DECIMAL(10, 8),
    limite_oeste DECIMAL(11, 8),
    limite_leste DECIMAL(11, 8),
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    unique (place_id, osm_id), # aparentemente nao ha relacao biunivoca, entao tem que ser unique a,b. Se houvesse bastaria unique(place_id)
    FOREIGN KEY (id_pais) REFERENCES paises (id_chave_pais),
    FOREIGN KEY (id_estado) REFERENCES estados (id_chave_estado),
    FOREIGN KEY (id_municipio) REFERENCES municipios (id_chave_municipio)
);

CREATE TABLE enderecos_evidencias (
    id_chave_endereco_evidencia INT AUTO_INCREMENT PRIMARY KEY,
    id_endereco_do_OSM INT,
    id_evidencia INT,
    nome_endereco_evidencia VARCHAR(200),
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    unique (id_endereco_do_OSM, id_evidencia),
    unique (nome_endereco_evidencia),
    FOREIGN KEY (id_endereco_do_OSM) REFERENCES enderecos_do_OSM (id_chave_endereco_do_OSM),
    FOREIGN KEY (id_evidencia) REFERENCES evidencias (id_chave_evidencia)
);

