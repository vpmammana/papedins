<?php

$nomeTabela = 'evidencias'; // Substitua pelo nome real da tabela
$id_evidencia = 1; // Substitua pelo identificador primário real
$nomeDoSeuBancoDeDados = 'papedins_db'; // Substitua pelo nome real do seu banco de dados

$query = "SELECT 
             c.COLUMN_NAME AS `Field`, 
             c.COLUMN_TYPE AS `Type`, 
             (CASE WHEN c.COLUMN_KEY = 'PRI' THEN 'PRIMARY' ELSE '' END) AS `Key`,
             (SELECT 
                 QUOTE(t." . $nomeTabela . "_value) 
              FROM 
                 (SELECT * FROM `$nomeTabela` WHERE id = $id_evidencia) AS t
              LIMIT 1) AS `Value` 
          FROM 
              INFORMATION_SCHEMA.COLUMNS c
          WHERE 
              c.TABLE_SCHEMA = '$nomeDoSeuBancoDeDados' AND c.TABLE_NAME = '$nomeTabela'";

echo $query;

