<?php
// Conexão com o banco de dados
include "identifica.php.cripto"; // Substitua com o caminho correto do seu arquivo de configuração

$pdo = new PDO('mysql:host=localhost;dbname=' . $nome_base_dados, $username, $pass);

// Função para verificar se é um array bidimensional
function isBidimensionalArray($array) {
    if (!is_array($array)) {
        return false;
    }

    foreach ($array as $element) {
        if (!is_array($element)) {
            return false;
        }
    }

    return true;
}

// Recebe dados JSON via POST
$json_data = file_get_contents('php://input');
$data = json_decode($json_data, true);

// Registra os dados recebidos em um arquivo de texto (opcional)
file_put_contents('endereco.txt', $json_data);

// Verifica se os dados de latitude e longitude estão presentes
if ($data === null || !isset($data['lat']) || !isset($data['lon'])) {
    echo "Erro: Latitude e Longitude não definidos";
    exit;
}

// Função para inserir endereço e criar uma entrada na tabela enderecos_evidencias
function insertAddress($pdo, $address, $id_evidencia) {
    // Preparar e executar a consulta SQL para inserir na tabela enderecos_do_OSM

   $checkStmt = $pdo->prepare('SELECT id_chave_endereco_do_osm FROM enderecos_do_OSM WHERE place_id = :place_id AND osm_id = :osm_id');
    $checkStmt->execute([
        ':place_id' => $address['place_id'],
        ':osm_id' => $address['osm_id']
    ]);

    if ($checkStmt->rowCount() > 0) {
        // Se um registro existente for encontrado, use o ID dele
        $lastInsertId = $checkStmt->fetchColumn();
    } else {
    $stmt = $pdo->prepare('INSERT INTO enderecos_do_OSM (place_id, licence, osm_type, osm_id, tipo, latitude, longitude, descricao, pais, estado, cidade, rua, postcode, limite_sul, limite_norte, limite_oeste, limite_leste, codigo_pais, codigo_estado, importancia_nominatim, ISO3166_2, bairro, regiao_do_estado, regiao_do_pais, id_pais, id_estado, id_municipio) VALUES (:place_id, :licence, :osm_type, :osm_id, :tipo, :latitude, :longitude, :display_name, :country, :state, :city, :street, :postcode, :limite_sul, :limite_norte, :limite_oeste, :limite_leste, :codigo_pais, :codigo_estado, :importancia_nominatim, :ISO3166_2, :bairro, :regiao_do_estado, :regiao_do_pais, (SELECT id_chave_pais FROM paises WHERE codigo_alpha2 = :codigo_pais), (select id_chave_estado from estados where codigo_iso3166_2 = :codigo_estado), (SELECT id_chave_municipio FROM municipios WHERE nome_municipio = :city))');
    $stmt->execute([
        // Parâmetros da consulta SQL
       ':place_id' => $address['place_id'],
        ':licence' => $address['licence'],
        ':osm_type' => $address['osm_type'],
        ':osm_id' => $address['osm_id'],
        ':latitude' => $address['lat'],
        ':longitude' => $address['lon'],
        ':display_name' => $address['display_name'],
        ':country' => $address['address']['country'],
        ':state' => $address['address']['state'],
        ':city' => $address['address']['city'],
        ':street' => $address['address']['road'],
        ':postcode' => $address['address']['postcode'],
        ':limite_sul' => $address['boundingbox'][0],
        ':limite_norte' => $address['boundingbox'][1],
        ':limite_oeste' => $address['boundingbox'][2],
        ':limite_leste' => $address['boundingbox'][3],
        ':tipo' => $address['type'], //tipo de endereço: residencial, etc.
        ':codigo_pais' => $address['address']['country_code'],
        ':codigo_estado' => $address['address']['ISO3166-2-lvl4'],
        ':importancia_nominatim' => $address['importance'],
        ':ISO3166_2' => $address['address']['ISO3166-2-lvl4'],
        ':bairro' => $address['address']['village'],
        ':regiao_do_estado' => $address['address']['county'],
        ':regiao_do_pais' => $address['address']['region']
    ]);

    // Obter o ID do último registro inserido
    $lastInsertId = $pdo->lastInsertId();
    }

    // Inserir na tabela enderecos_evidencias
    $stmtEvidencia = $pdo->prepare('INSERT INTO enderecos_evidencias (id_endereco_do_osm, id_evidencia) VALUES (:lastInsertId, :id_evidencia)');
    $stmtEvidencia->execute([
        ':lastInsertId' => $lastInsertId,
        ':id_evidencia' => $id_evidencia
    ]);
} // Fim da função insertAddress

// Tratar os dados recebidos
try {
    if (isBidimensionalArray($data)) {
        // Tratar cada endereço na matriz
        foreach ($data as $address) {
            $id_evidencia = isset($address['id_evidencia']) ? $address['id_evidencia'] : null;
            insertAddress($pdo, $address, $id_evidencia);
        }
    } else {
        // Tratar um único endereço
        $id_evidencia = isset($data['id_evidencia']) ? $data['id_evidencia'] : null;
        insertAddress($pdo, $data, $id_evidencia);
    }

    echo json_encode(['status' => 'success']);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>

