CREATE TABLE instituicoes (
    id_chave_instituicao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_instituicao VARCHAR(255) NOT NULL,
    id_pais INT NOT NULL,
    unique(nome_instituicao),
    FOREIGN KEY (id_pais) REFERENCES paises(id_chave_pais)
);

INSERT IGNORE INTO instituicoes (nome_instituicao, id_pais)
SELECT DISTINCT publisher, id_pais_do_publisher
FROM journals;
