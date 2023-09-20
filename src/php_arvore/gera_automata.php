<?php

// *************************** 1. row ***************************
//     id_chave_nested_tipo_secao: 7
//         nome_nested_tipo_secao: substantivo_flexao_definida
//                  id_tipo_token: 3
//                      descricao: substantivo com flexão definida
//                            lft: 11
//                            rgt: 12
//           id_chave_propriedade: 11
//               nome_propriedade: tabela_externa
// id_chave_instancia_propriedade: 221
//                 valor_continuo: 
//                 id_propriedade: 11
//              id_valor_discreto: 75
//           id_nested_tipo_secao: 7
//        id_chave_valor_discreto: 75
//            nome_valor_discreto: tipos_flexoes
//                 id_propriedade: 11
//            id_chave_tipo_token: 3
//                nome_tipo_token: substantivo
//                      acentuada: substantivo
//                         classe: substantivo
//                     time_stamp: 2023-09-19 20:57:35.080605
// 

include "identifica.php.cripto";
$sql="call mostra_documento_completo_niveis_sem_lixeira('raiz')";

$result=$conn->query("$sql");
$conta=0;
if ($result->num_rows>0) {
    while($row=$result->fetch_assoc()){
		$id_chave             = $row["id_chave_filho"];
	}
}
?>
