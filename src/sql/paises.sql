
UPDATE journals SET nome_journal = alternative_title where id_chave_journal in (SELECT id_chave_journal from journals where id_chave_journal not in (SELECT id_chave_journal FROM journals WHERE nome_journal REGEXP '[a-zA-Z0-9áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙâêîôûÂÊÎÔÛäëïöüÄËÏÖÜñÑçÇß]')); # retira os caracteres internacionais (não ocidentais) para evitar problemas

DELETE FROM journals where id_chave_journal in (SELECT id_chave_journal from journals where id_chave_journal not in (SELECT id_chave_journal FROM journals WHERE nome_journal REGEXP '[a-zA-Z0-9áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙâêîôûÂÊÎÔÛäëïöüÄËÏÖÜñÑçÇß]')); # delete 33 registros expúrios que deve existir porque há registro de nomes internacionais em que o campo alternative_title eh nulo
DROP PROCEDURE IF EXISTS DropColumnIfExists;

SELECT "RETIRANDO CARACTERES NÃO OCIDENTAIS DE journals";

DELIMITER //
CREATE PROCEDURE DropColumnIfExists(db_name CHAR(255), tbl_name CHAR(255), col_name CHAR(255))
BEGIN
    IF EXISTS (
        SELECT * 
        FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA=db_name 
          AND TABLE_NAME=tbl_name 
          AND COLUMN_NAME=col_name
    ) THEN
        SET @s = CONCAT('ALTER TABLE ', tbl_name, ' DROP COLUMN ', col_name);
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS DropAllForeignKeys;


DELIMITER //

CREATE PROCEDURE DropAllForeignKeys(IN target_table_name VARCHAR(255))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE fk_name VARCHAR(255);
    
    -- Declara um cursor para selecionar os nomes de todas as chaves estrangeiras da tabela
    DECLARE cur CURSOR FOR
        SELECT CONSTRAINT_NAME 
        FROM information_schema.KEY_COLUMN_USAGE 
        WHERE TABLE_SCHEMA = DATABASE() 
        AND TABLE_NAME = target_table_name 
        AND REFERENCED_TABLE_NAME IS NOT NULL;

    -- Declaração para encerrar o loop quando o cursor tiver terminado
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Abrir o cursor
    OPEN cur;

    -- Loop para percorrer todas as chaves estrangeiras e removê-las
    read_loop: LOOP
        FETCH cur INTO fk_name;
        
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET @sql = CONCAT('ALTER TABLE ', target_table_name, ' DROP FOREIGN KEY ', fk_name, ';');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    -- Fechar o cursor
    CLOSE cur;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS TraduzirPaises;


DELIMITER //

CREATE PROCEDURE TraduzirPaises()
BEGIN
    DECLARE coluna_existe INT;

    -- Verificar se a coluna nome_portugues já existe
    SELECT COUNT(*)
    INTO coluna_existe
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'paises'
      AND COLUMN_NAME = 'nome_portugues';

    -- Se a coluna não existir, crie-a
    IF coluna_existe = 0 THEN
        ALTER TABLE paises ADD COLUMN nome_portugues VARCHAR(255);
    END IF;

    -- Mapeamento manual das traduções (vou fazer apenas para 20 países como exemplo)

    UPDATE paises SET nome_portugues = 'Afeganistão' WHERE nome_pais = 'Afghanistan';
    UPDATE paises SET nome_portugues = 'África do Sul' WHERE nome_pais = 'South Africa';
    UPDATE paises SET nome_portugues = 'Albânia' WHERE nome_pais = 'Albania';
    UPDATE paises SET nome_portugues = 'Alemanha' WHERE nome_pais = 'Germany';
    UPDATE paises SET nome_portugues = 'Arábia Saudita' WHERE nome_pais = 'Saudi Arabia';
    UPDATE paises SET nome_portugues = 'Argentina' WHERE nome_pais = 'Argentina';
    UPDATE paises SET nome_portugues = 'Austrália' WHERE nome_pais = 'Australia';
    UPDATE paises SET nome_portugues = 'Áustria' WHERE nome_pais = 'Austria';
    UPDATE paises SET nome_portugues = 'Bangladesh' WHERE nome_pais = 'Bangladesh';
    UPDATE paises SET nome_portugues = 'Bélgica' WHERE nome_pais = 'Belgium';
    UPDATE paises SET nome_portugues = 'Bolívia' WHERE nome_pais = 'Bolivia';
    UPDATE paises SET nome_portugues = 'Brasil' WHERE nome_pais = 'Brazil';
    UPDATE paises SET nome_portugues = 'Bulgária' WHERE nome_pais = 'Bulgaria';
    UPDATE paises SET nome_portugues = 'Canadá' WHERE nome_pais = 'Canada';
    UPDATE paises SET nome_portugues = 'Chile' WHERE nome_pais = 'Chile';
    UPDATE paises SET nome_portugues = 'China' WHERE nome_pais = 'China';
    UPDATE paises SET nome_portugues = 'Colômbia' WHERE nome_pais = 'Colombia';
    UPDATE paises SET nome_portugues = 'Coreia do Sul' WHERE nome_pais = 'South Korea';
    UPDATE paises SET nome_portugues = 'Costa Rica' WHERE nome_pais = 'Costa Rica';
    UPDATE paises SET nome_portugues = 'Croácia' WHERE nome_pais = 'Croatia';

    UPDATE paises SET nome_portugues = 'Espanha' WHERE nome_pais = 'Spain';
    UPDATE paises SET nome_portugues = 'Reino Unido' WHERE nome_pais = 'United Kingdom';
    UPDATE paises SET nome_portugues = 'Polônia' WHERE nome_pais = 'Poland';
    UPDATE paises SET nome_portugues = 'Colômbia' WHERE nome_pais = 'Colombia';
    UPDATE paises SET nome_portugues = 'República da Coréia' WHERE nome_pais = 'Korea; Republic of';
    UPDATE paises SET nome_portugues = 'Dinamarca' WHERE nome_pais = 'Denmark';
    UPDATE paises SET nome_portugues = 'Estados Unidos' WHERE nome_pais = 'United States';
    UPDATE paises SET nome_portugues = 'México' WHERE nome_pais = 'Mexico';
    UPDATE paises SET nome_portugues = 'República Tcheca' WHERE nome_pais = 'Czechia';
    UPDATE paises SET nome_portugues = 'Malásia' WHERE nome_pais = 'Malaysia';
    UPDATE paises SET nome_portugues = 'Índia' WHERE nome_pais = 'India';
    UPDATE paises SET nome_portugues = 'República Domenicana' WHERE nome_pais = 'Dominican Republic';
    UPDATE paises SET nome_portugues = 'Sérbia' WHERE nome_pais = 'Serbia';
    UPDATE paises SET nome_portugues = 'Ucrânia' WHERE nome_pais = 'Ukraine';
    UPDATE paises SET nome_portugues = 'Bélgica' WHERE nome_pais = 'Belgium';
    UPDATE paises SET nome_portugues = 'Rússia' WHERE nome_pais = 'Russian Federation';
    UPDATE paises SET nome_portugues = 'Irã' WHERE nome_pais = 'Iran; Islamic Republic of';
    UPDATE paises SET nome_portugues = 'Canadá' WHERE nome_pais = 'Canada';
    UPDATE paises SET nome_portugues = 'Venezuela' WHERE nome_pais = 'Venezuela; Bolivarian Republic of';
    UPDATE paises SET nome_portugues = 'Nicarágua' WHERE nome_pais = 'Nicaragua';
    UPDATE paises SET nome_portugues = 'Itália' WHERE nome_pais = 'Italy';
    UPDATE paises SET nome_portugues = 'Suíça' WHERE nome_pais = 'Switzerland';
    UPDATE paises SET nome_portugues = 'Noruega' WHERE nome_pais = 'Norway';
    UPDATE paises SET nome_portugues = 'Romênia' WHERE nome_pais = 'Romania';
    UPDATE paises SET nome_portugues = 'Paquistão' WHERE nome_pais = 'Pakistan';
    UPDATE paises SET nome_portugues = 'Eslováquia' WHERE nome_pais = 'Slovakia';
    UPDATE paises SET nome_portugues = 'França' WHERE nome_pais = 'France';
    UPDATE paises SET nome_portugues = 'Singapura' WHERE nome_pais = 'Singapore';
    UPDATE paises SET nome_portugues = 'Hungária' WHERE nome_pais = 'Hungary';
    UPDATE paises SET nome_portugues = 'Taiwan' WHERE nome_pais = 'Taiwan; Province of China';
    UPDATE paises SET nome_portugues = 'Holanda' WHERE nome_pais = 'Netherlands';
    UPDATE paises SET nome_portugues = 'Grécia' WHERE nome_pais = 'Greece';
    UPDATE paises SET nome_portugues = 'Uruguai' WHERE nome_pais = 'Uruguay';
    UPDATE paises SET nome_portugues = 'Equador' WHERE nome_pais = 'Ecuador';
    UPDATE paises SET nome_portugues = 'Suécia' WHERE nome_pais = 'Sweden';
    UPDATE paises SET nome_portugues = 'Marrocos' WHERE nome_pais = 'Morocco';
    UPDATE paises SET nome_portugues = 'Japão' WHERE nome_pais = 'Japan';
    UPDATE paises SET nome_portugues = 'Paraguai' WHERE nome_pais = 'Paraguay';
    UPDATE paises SET nome_portugues = 'Nova Zelândia' WHERE nome_pais = 'New Zealand';
    UPDATE paises SET nome_portugues = 'Armênia' WHERE nome_pais = 'Armenia';
    UPDATE paises SET nome_portugues = 'República Democrática do Congo' WHERE nome_pais = 'Congo; The Democratic Republic of the';
    UPDATE paises SET nome_portugues = 'Bósnia e Herzegovina' WHERE nome_pais = 'Bosnia and Herzegovina';
    UPDATE paises SET nome_portugues = 'Vietnam' WHERE nome_pais = 'Viet Nam';
    UPDATE paises SET nome_portugues = 'Finlândia' WHERE nome_pais = 'Finland';
    UPDATE paises SET nome_portugues = 'Islândia' WHERE nome_pais = 'Iceland';
    UPDATE paises SET nome_portugues = 'Macedônia do Norte' WHERE nome_pais = 'North Macedonia';
    UPDATE paises SET nome_portugues = 'Turcomenistão' WHERE nome_pais = 'Turkmenistan';
    UPDATE paises SET nome_portugues = 'Eslovênia' WHERE nome_pais = 'Slovenia';
    UPDATE paises SET nome_portugues = 'Estônia' WHERE nome_pais = 'Estonia';
    UPDATE paises SET nome_portugues = 'África do Sul' WHERE nome_pais = 'South Africa';
    UPDATE paises SET nome_portugues = 'Tailândia' WHERE nome_pais = 'Thailand';
    UPDATE paises SET nome_portugues = 'Nigéria' WHERE nome_pais = 'Nigeria';
    UPDATE paises SET nome_portugues = 'Letônia' WHERE nome_pais = 'Latvia';
    UPDATE paises SET nome_portugues = 'Iraque' WHERE nome_pais = 'Iraq';
    UPDATE paises SET nome_portugues = 'Porto Rico' WHERE nome_pais = 'Puerto Rico';
    UPDATE paises SET nome_portugues = 'Mongólia' WHERE nome_pais = 'Mongolia';
    UPDATE paises SET nome_portugues = 'Quirguistão' WHERE nome_pais = 'Kyrgyzstan';
    UPDATE paises SET nome_portugues = 'Filipinas' WHERE nome_pais = 'Philippines';
    UPDATE paises SET nome_portugues = 'Bolívia' WHERE nome_pais = 'Bolivia; Plurinational State of';
    UPDATE paises SET nome_portugues = 'Irlanda' WHERE nome_pais = 'Ireland';
    UPDATE paises SET nome_portugues = 'Cazaquistão' WHERE nome_pais = 'Kazakhstan';
    UPDATE paises SET nome_portugues = 'Egito' WHERE nome_pais = 'Egypt';
    UPDATE paises SET nome_portugues = 'Moldávia' WHERE nome_pais = 'Moldova; Republic of';
    UPDATE paises SET nome_portugues = 'Argélia' WHERE nome_pais = 'Algeria';
    UPDATE paises SET nome_portugues = 'Síria' WHERE nome_pais = 'Syrian Arab Republic';
    UPDATE paises SET nome_portugues = 'Omã' WHERE nome_pais = 'Oman';
    UPDATE paises SET nome_portugues = 'Palestina' WHERE nome_pais = 'Palestine; State of';
    UPDATE paises SET nome_portugues = 'Quênia' WHERE nome_pais = 'Kenya';
    UPDATE paises SET nome_portugues = 'Luxemburgo' WHERE nome_pais = 'Luxembourg';
    UPDATE paises SET nome_portugues = 'Turquia' WHERE nome_pais = 'Türkiye';
    UPDATE paises SET nome_portugues = 'Emirados Árabes Unidos' WHERE nome_pais = 'United Arab Emirates';
    UPDATE paises SET nome_portugues = 'Brunei' WHERE nome_pais = 'Brunei Darussalam';
    UPDATE paises SET nome_portugues = 'Líbia' WHERE nome_pais = 'Libya';
    UPDATE paises SET nome_portugues = 'Iêmen' WHERE nome_pais = 'Yemen';
    UPDATE paises SET nome_portugues = 'Tunísia' WHERE nome_pais = 'Tunisia';
    UPDATE paises SET nome_portugues = 'Tanzânia' WHERE nome_pais = 'Tanzania; United Republic of';
    UPDATE paises SET nome_portugues = 'Gana' WHERE nome_pais = 'Ghana';
    UPDATE paises SET nome_portugues = 'Etiópia' WHERE nome_pais = 'Ethiopia';
    UPDATE paises SET nome_portugues = 'Gâmbia' WHERE nome_pais = 'Gambia';
    UPDATE paises SET nome_portugues = 'Jordânia' WHERE nome_pais = 'Jordan';
    UPDATE paises SET nome_portugues = 'Costa do Marfim' WHERE nome_pais = "Côte d'Ivoire";
    UPDATE paises SET nome_portugues = 'Camarões' WHERE nome_pais = 'Cameroon';
    UPDATE paises SET nome_portugues = 'Chipre' WHERE nome_pais = 'Cyprus';
    UPDATE paises SET nome_portugues = 'Ilhas Åland' WHERE nome_pais = 'Åland Islands';
    UPDATE paises SET nome_portugues = 'Panamá' WHERE nome_pais = 'Panama';
    UPDATE paises SET nome_portugues = 'Tadjiquistão' WHERE nome_pais = 'Tajikistan';
    UPDATE paises SET nome_portugues = 'Bahrein' WHERE nome_pais = 'Bahrain';
    UPDATE paises SET nome_portugues = 'Uzbequistão' WHERE nome_pais = 'Uzbekistan';
    UPDATE paises SET nome_portugues = 'Ruanda' WHERE nome_pais = 'Rwanda';
    UPDATE paises SET nome_portugues = 'Líbano' WHERE nome_pais = 'Lebanon';
    UPDATE paises SET nome_portugues = 'Trinidad e Tobago' WHERE nome_pais = 'Trinidad and Tobago';
    UPDATE paises SET nome_portugues = 'Geórgia' WHERE nome_pais = 'Georgia';
    UPDATE paises SET nome_portugues = 'Zimbábue' WHERE nome_pais = 'Zimbabwe';
    UPDATE paises SET nome_portugues = 'Azerbaijão' WHERE nome_pais = 'Azerbaijan';
    UPDATE paises SET nome_portugues = 'Sudão do Sul' WHERE nome_pais = 'South Sudan';

-- Para os países que você não mapeou, você pode simplesmente copiar o nome em inglês
    UPDATE paises SET nome_portugues = nome_pais WHERE nome_portugues IS NULL;
END //

DELIMITER ;


CALL DropAllForeignKeys("journals");

DROP TABLE IF EXISTS paises;

CALL DropColumnIfExists("papedins_db", "journals", "id_pais_do_publisher");


CREATE TABLE paises (
    id_chave_pais INT AUTO_INCREMENT PRIMARY KEY,
    codigo_alpha2 VARCHAR(2),
    codigo_alpha3 VARCHAR(3),
    codigo_numerico VARCHAR(3),
    nome_pais VARCHAR(255) NOT NULL,
	unique(nome_pais)
);

INSERT INTO paises (nome_pais)
select distinct country_of_publisher from journals;

ALTER TABLE journals ADD COLUMN id_pais_do_publisher INT;

UPDATE journals j
INNER JOIN paises p ON j.country_of_publisher = p.nome_pais
SET j.id_pais_do_publisher = p.id_chave_pais;

ALTER TABLE journals
ADD FOREIGN KEY (id_pais_do_publisher) REFERENCES paises(id_chave_pais);

CALL TraduzirPaises();

DROP TABLE IF EXISTS instituicoes; 

CREATE TABLE instituicoes (
    id_chave_instituicao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_instituicao VARCHAR(255) NOT NULL,
    id_pais INT NOT NULL,
    unique(nome_instituicao),
    FOREIGN KEY (id_pais) REFERENCES paises(id_chave_pais)
);

INSERT IGNORE INTO instituicoes (nome_instituicao, id_pais)
SELECT DISTINCT publisher, id_pais_do_publisher
FROM journals order by publisher;

