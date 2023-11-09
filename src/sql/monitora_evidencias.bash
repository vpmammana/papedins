#!/bin/bash

contador=0

while true; do
	let contador++
	echo "Consulta número: $contador"
    mysql -u root -ptoninho13 -D papedins_db -e "SELECT * FROM evidencias;"
    sleep 5
done
