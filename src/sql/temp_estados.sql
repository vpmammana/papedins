DROP TABLE IF EXISTS estados;

CREATE TABLE estados (
    id_chave_estado INT AUTO_INCREMENT PRIMARY KEY,
    nome_estado VARCHAR(255) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    codigo_iso3166_2 VARCHAR(10) NOT NULL UNIQUE,
    codigo_estado CHAR(2) NOT NULL UNIQUE,
    idioma VARCHAR(50) NOT NULL,
    codigo_pais CHAR(2) NOT NULL,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES paises (id_chave_pais)
);

