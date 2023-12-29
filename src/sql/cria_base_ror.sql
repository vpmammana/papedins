DROP TABLE IF EXISTS external_ids;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS ip_addresses;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS acronyms;
DROP TABLE IF EXISTS aliases;
DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS entities;



CREATE TABLE entities (
    id_chave_entity VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    status VARCHAR(50),
    wikipedia_url VARCHAR(255),
    email_address VARCHAR(255),
    established YEAR,
    country_name VARCHAR(255),
    country_code VARCHAR(10)
);

CREATE TABLE types (
    id_chave_type INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    type VARCHAR(50),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE links (
    id_chave_link INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    link VARCHAR(255),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE aliases (
    id_chave_alias INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    alias VARCHAR(255),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE acronyms (
    id_chave_acronym INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    acronym VARCHAR(50),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE labels (
    id_chave_label INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    label VARCHAR(255),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE ip_addresses (
    id_chave_ip_address INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    ip_address VARCHAR(50),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE relationships (
    id_chave_relationship INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    id_related_entity VARCHAR(255),
    type VARCHAR(50),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity),
    FOREIGN KEY (id_related_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE addresses (
    id_chave_address INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    address TEXT,
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

CREATE TABLE external_ids (
    id_chave_external_id INT AUTO_INCREMENT PRIMARY KEY,
    id_entity VARCHAR(255),
    external_id_type VARCHAR(50),
    external_id VARCHAR(255),
    FOREIGN KEY (id_entity) REFERENCES entities(id_chave_entity)
);

-- Índices para melhorar a performance de consultas
CREATE INDEX idx_name ON entities(name);

