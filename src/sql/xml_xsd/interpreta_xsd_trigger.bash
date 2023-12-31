#!/bin/bash

# Nome do arquivo XSD
xsd_file="xml_cvbase_src_main_resources_CurriculoLattes_12_09_2022.xsd"

# Nome da tabela onde deseja criar o trigger
tabela="nome_da_sua_tabela"

# Usar XMLStarlet para extrair informações do XSD
# Este script é um exemplo que precisa ser adaptado para seu caso específico
elementos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element" -v "@name" -n $xsd_file)

# Iterar sobre os elementos e criar comandos SQL
for elemento in $elementos
do
    echo "CREATE TABLE $elemento ("

    # Extrair atributos de cada elemento
    atributos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute" -v "@name" -n $xsd_file)

    # Criar colunas para cada atributo
    for atributo in $atributos
    do
        # Pegar o valor padrão do atributo, se houver
        default=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute[@name='$atributo']" -v "@default" -n $xsd_file)

        # Montar a definição da coluna
        column_def="$atributo VARCHAR(255)"
        [ -n "$default" ] && column_def+=" DEFAULT '$default'"

        echo "  $column_def,"
    done

    echo ");"

    # Criação do Trigger
    echo "DELIMITER //"
    echo "CREATE TRIGGER trigger_$elemento"
    echo "BEFORE INSERT ON $tabela"
    echo "FOR EACH ROW"
    echo "BEGIN"
    echo "    IF NEW.$elemento NOT IN ('valor1', 'valor2', 'valor3') THEN"
    echo "        SIGNAL SQLSTATE '45000'"
    echo "        SET MESSAGE_TEXT = 'Valor inválido para coluna $elemento';"
    echo "    END IF;"
    echo "END;"
    echo "//"
    echo "DELIMITER ;"
done

