#!/bin/bash

# Nome do arquivo XSD
xsd_file="xml_cvbase_src_main_resources_CurriculoLattes_12_09_2022.xsd"

# Função para substituir traços por underlines
replace_dash_with_underscore() {
    echo "$1" | tr '-' '_'
}

# Função para validar e converter datas para o formato AAAA-MM-DD
validate_and_convert_date() {
    local input_date="$1"
    local format="$2"
    
    case "$format" in
        "DDMMAAAA")
            if [[ $input_date =~ ^[0-9]{8}$ ]]; then
                local formatted_date="${input_date:4}-${input_date:2:2}-${input_date:0:2}"
                echo "$formatted_date"
            else
                echo "NULL"
            fi
            ;;
        # Adicione outros formatos de data e validações aqui, se necessário
        *)
            echo "NULL"
            ;;
    esac
}

# Usar XMLStarlet para extrair informações do XSD
elementos=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element" -v "@name" -n $xsd_file)

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

        # Pegar o formato da data a partir do atributo, se houver
        formato_data=$(xmlstarlet sel -N xs=http://www.w3.org/2001/XMLSchema -t -m "//xs:element[@name='$elemento']//xs:attribute[@name='$atributo']" -v "xs:simpleType/xs:restriction/xs:pattern/@value" -n $xsd_file)

        # Montar a definição da coluna com a cláusula CHECK
        if [ -n "$formato_data" ]; then
            column_def="$atributo_sem_traco DATE CHECK ("
            column_def+=" $atributo_sem_traco IS NULL OR $atributo_sem_traco = DATE_FORMAT(STR_TO_DATE('$atributo_sem_traco', '$formato_data'), '%Y-%m-%d')"
            column_def+="),"
        else
            column_def="$atributo_sem_traco VARCHAR(255),"
        fi

        echo "  $column_def"
    done

    # Remover a vírgula extra após o último atributo
    echo ");"
done

