#!/bin/bash

# Nome do arquivo XSD
xsd_file="xml_cvbase_src_main_resources_CurriculoLattes_12_09_2022.xsd"

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
        echo "  $atributo VARCHAR(255),"  # Exemplo, ajuste o tipo de dados conforme necessário
    done

    echo ");"
done

