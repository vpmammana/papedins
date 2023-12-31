#!/bin/bash

# Nome do arquivo XSD
xsd_file="xml_cvbase_src_main_resources_CurriculoLattes_12_09_2022.xsd"

# Usar XMLStarlet para extrair informações do XSD
# Este script é um exemplo que precisa ser adaptado para seu caso específico
elementos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element" -v "@name" -n $xsd_file)

# Função para substituir traços por underlines
replace_dash_with_underscore() {
    echo "$1" | tr '-' '_'
}

# Iterar sobre os elementos e criar comandos SQL
for elemento in $elementos
do
    # Substituir caracteres especiais por underscores para o nome da tabela
    tabela=$(replace_dash_with_underscore "$elemento")

    echo "CREATE TABLE $tabela ("

    # Extrair atributos de cada elemento
    atributos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute" -v "@name" -n $xsd_file)

    # Criar colunas para cada atributo
    for atributo in $atributos
    do
        # Substituir traços por underlines no nome do atributo
        atributo_sem_traco=$(replace_dash_with_underscore "$atributo")

        # Pegar os valores permitidos do XML, se houverem
        valores_permitidos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute[@name='$atributo']//xs:simpleType/xs:restriction/xs:enumeration" -v "@value" -n $xsd_file)

        # Montar a definição da coluna com a cláusula CHECK
        column_def="$atributo_sem_traco VARCHAR(255)"
        
        # Verificar se há valores permitidos no XML e usá-los no CHECK
        if [ -n "$valores_permitidos" ]; then
            allowed_values=$(echo "$valores_permitidos" | tr '\n' ',' | sed 's/,$//')
            column_def+=" CHECK ($atributo_sem_traco IN ($allowed_values))"
        fi

        echo "  $column_def,"
    done

    # Remover a vírgula extra após o último atributo
    echo ");"
done

