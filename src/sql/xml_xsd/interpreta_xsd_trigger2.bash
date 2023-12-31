#!/bin/bash

# Nome do arquivo XSD
xsd_file="xml_cvbase_src_main_resources_CurriculoLattes_12_09_2022.xsd"

# Usar XMLStarlet para extrair informações do XSD
# Este script é um exemplo que precisa ser adaptado para seu caso específico
elementos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element" -v "@name" -n $xsd_file)

# Iterar sobre os elementos e criar comandos SQL
for elemento in $elementos
do
    # Substituir caracteres especiais por underscores para o nome da tabela
    tabela=$(echo "$elemento" | tr '-' '_')

    echo "CREATE TABLE $tabela ("

    # Extrair atributos de cada elemento
    atributos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute" -v "@name" -n $xsd_file)

    # Criar colunas para cada atributo
    for atributo in $atributos
    do
        # Pegar os valores permitidos do XML, se houverem
        valores_permitidos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute[@name='$atributo']//xs:simpleType/xs:restriction/xs:enumeration" -v "@value" -n $xsd_file)

        # Montar a definição da coluna
        column_def="$atributo VARCHAR(255)"
        
        # Verificar se há valores permitidos no XML e usá-los no trigger
        if [ -n "$valores_permitidos" ]; then
            allowed_values=$(echo "$valores_permitidos" | tr '\n' ',' | sed 's/,$//')
            column_def+=" CHECK ($atributo IN ($allowed_values))"
        fi

        echo "  $column_def,"
    done

    echo ");"

    # Criação do Trigger
    echo "DELIMITER //"
    echo "CREATE TRIGGER trigger_$tabela"
    echo "BEFORE INSERT ON $tabela"
    echo "FOR EACH ROW"
    echo "BEGIN"
    
    for atributo in $atributos
    do
        # Pegar os valores permitidos do XML, se houverem
        valores_permitidos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute[@name='$atributo']//xs:simpleType/xs:restriction/xs:enumeration" -v "@value" -n $xsd_file)

        # Verificar se há valores permitidos no XML e usá-los no trigger
        if [ -n "$valores_permitidos" ]; then
            allowed_values=$(echo "$valores_permitidos" | tr '\n' ',' | sed 's/,$//')
            echo "    IF NEW.$atributo NOT IN ($allowed_values) THEN"
            echo "        SIGNAL SQLSTATE '45000'"
            echo "        SET MESSAGE_TEXT = 'Valor inválido para coluna $atributo';"
            echo "    END IF;"
        fi
    done
    
    echo "END;"
    echo "//"
    echo "DELIMITER ;"
done

