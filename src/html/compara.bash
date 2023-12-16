#!/bin/bash

file1="$1"
file2="$2"

# Define o número máximo de bytes para comparar (para evitar loops infinitos)
max_bytes=1000000
echo $1
# Lê byte a byte
for i in $(seq 1 $max_bytes); do
    byte1=$(dd if="$file1" bs=1 skip=$((i-1)) count=1 2>/dev/null)
    byte2=$(dd if="$file2" bs=1 skip=$((i-1)) count=1 2>/dev/null)

    # Verifica se os bytes são diferentes ou se chegamos ao fim do arquivo
    if [ "$byte1" != "$byte2" ] || { [ -z "$byte1" ] && [ -n "$byte2" ]; } || { [ -z "$byte2" ] && [ -n "$byte1" ]; }; then
    #if [ "$byte1" != "$byte2" ] || [ -z "$byte1" ] || [ -z "$byte2" ]; then
	#echo -n "byte1: $byte1"
	#printf "%d\n" "'$byte1"
	#echo -n "byte2: $byte2"
	#printf "%d\n" "'$byte2"
        break
    fi

    # Imprime o byte comum
    printf "$byte1"
done


