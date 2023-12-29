<?php
include "identifica.php.cripto";

$contador = 0;

$mysqli = new mysqli("localhost", $username, $pass, $nome_base_dados);

if ($mysqli->connect_error) {
    die("Conexão falhou: " . $mysqli->connect_error);
}
echo "Conexão estabelecida com sucesso.\n";

$jsonData = json_decode(file_get_contents("v1.39-2023-12-20-ror-data.json"), true);
echo "Arquivo JSON carregado.\n";

foreach ($jsonData as $entity) {
$contador++;
    $stmt = $mysqli->prepare("INSERT INTO entities (id_chave_entity, name, status, wikipedia_url, email_address, established, country_name, country_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssiis", $entity['id'], $entity['name'], $entity['status'], $entity['wikipedia_url'], $entity['email_address'], $entity['established'], $entity['country']['country_name'], $entity['country']['country_code']);
    $stmt->execute();

    if (isset($entity['types']) && is_array($entity['types'])) {
        foreach ($entity['types'] as $type) {
            $stmt = $mysqli->prepare("INSERT INTO types (id_entity, type) VALUES (?, ?)");
            $stmt->bind_param("ss", $entity['id'], $type);
            $stmt->execute();
        }
    }

    // Repetindo o padrão para as demais tabelas

    // Aliases
    if (isset($entity['aliases']) && is_array($entity['aliases'])) {
        foreach ($entity['aliases'] as $alias) {
            $stmt = $mysqli->prepare("INSERT INTO aliases (id_entity, alias) VALUES (?, ?)");
            $stmt->bind_param("ss", $entity['id'], $alias);
            $stmt->execute();
        }
    }

    // Acronyms
    if (isset($entity['acronyms']) && is_array($entity['acronyms'])) {
        foreach ($entity['acronyms'] as $acronym) {
            $stmt = $mysqli->prepare("INSERT INTO acronyms (id_entity, acronym) VALUES (?, ?)");
            $stmt->bind_param("ss", $entity['id'], $acronym);
            $stmt->execute();
        }
    }

    // Labels
    if (isset($entity['labels']) && is_array($entity['labels'])) {
        foreach ($entity['labels'] as $label) {
            $stmt = $mysqli->prepare("INSERT INTO labels (id_entity, label) VALUES (?, ?)");
            $stmt->bind_param("ss", $entity['id'], $label['label']);
            $stmt->execute();
        }
    }

    // IP Addresses
    if (isset($entity['ip_addresses']) && is_array($entity['ip_addresses'])) {
        foreach ($entity['ip_addresses'] as $ip_address) {
            $stmt = $mysqli->prepare("INSERT INTO ip_addresses (id_entity, ip_address) VALUES (?, ?)");
            $stmt->bind_param("ss", $entity['id'], $ip_address);
            $stmt->execute();
        }
    }

    // Relationships
    if (isset($entity['relationships']) && is_array($entity['relationships'])) {
        foreach ($entity['relationships'] as $relationship) {
            $stmt = $mysqli->prepare("INSERT INTO relationships (id_entity, id_related_entity, type) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $entity['id'], $relationship['id'], $relationship['type']);
            $stmt->execute();
        }
    }

    // Addresses
    if (isset($entity['addresses']) && is_array($entity['addresses'])) {
        foreach ($entity['addresses'] as $address) {
            $address_text = json_encode($address); 
            $stmt = $mysqli->prepare("INSERT INTO addresses (id_entity, address) VALUES (?, ?)");
            $stmt->bind_param("ss", $entity['id'], $address_text);
            $stmt->execute();
        }
    }
    
    // External IDs
    if (isset($entity['external_ids'])) {
        //$external_ids_array = get_object_vars($entity['external_ids']);
	$external_ids_array = $entity['external_ids'];	
	if (is_array($external_ids_array)) {
        foreach ($external_ids_array as $external_id_type => $external_ids) {
          if (is_array($external_ids['all'])) {
            foreach ($external_ids['all'] as $id) {
                $stmt = $mysqli->prepare("INSERT INTO external_ids (id_entity, external_id_type, external_id) VALUES (?, ?, ?)");
                $stmt->bind_param("sss", $entity['id'], $external_id_type, $id);
                $stmt->execute();
            }
	   } else {
                $stmt = $mysqli->prepare("INSERT INTO external_ids (id_entity, external_id_type, external_id) VALUES (?, ?, ?)");
                $stmt->bind_param("sss", $entity['id'], $external_id_type, $external_ids['all']);
                $stmt->execute();
	   }
        }
    }
    }

	if ($contador % 100 == 0) { 
		echo "\n=========================================================="; 
		echo "\nInseridos " . $contador . " registros.\n";
    		echo "Entidade " . $entity['id'] . " inserida em 'entities'.\n";
		echo "Alias inserido para entidade " . $entity['id'] . ".\n";
		echo "Acrônimo inserido para entidade " . $entity['id'] . ".\n";
		echo "Rótulo inserido para entidade " . $entity['id'] . ".\n";
		echo "Endereço IP inserido para entidade " . $entity['id'] . ".\n";
		echo "Relacionamento inserido para entidade " . $entity['id'] . ".\n";
		echo "Endereço inserido para entidade " . $entity['id'] . ".\n";
		echo "ID externo inserido para entidade " . $entity['id'] . ".\n";
		echo "Tipo inserido para entidade " . $entity['id'] . ".\n";
	}


}

$mysqli->close();
		echo "Todos os dados inseridos com sucesso e conexão encerrada.\n";

?>

