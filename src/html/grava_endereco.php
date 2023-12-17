<?php
// Substitua com suas credenciais de banco de dados

function isBidimensionalArray($array) {
    if (!is_array($array)) {
        return false; // Não é um array
    }

    foreach ($array as $element) {
        if (!is_array($element)) {
            return false; // Pelo menos um elemento não é um array
        }
    }

    return true; // Todos os elementos são arrays
}

include "identifica.php.cripto";

$host = 'localhost';
$dbname = $nome_base_dados;
$user = $username;

try {
    $pdo = new PDO('mysql:host=' . $host . ';dbname=' . $dbname, $user, $pass);

    // Receber os dados do JavaScript
    $json_data = file_get_contents('php://input');
    $data = json_decode($json_data, true);

file_put_contents('endereco.txt', $json_data);

if ($data !== null && isset($data['lat']) && isset($data['lon'])) {
    // Converte lat e lon em números de ponto flutuante
    $data['lat'] = floatval($data['lat']);
    $data['lon'] = floatval($data['lon']);
    
    // Insira os dados no banco de dados
    // ...
} else {
	echo "Erro ao receber dados do JavaScript: pode ser que lat e lon não estejam definidos";
	die();
    // Trate o erro ou faça o que for apropriado para a sua aplicação
}

file_put_contents('endereco.txt', "\n\n".$json_data, FILE_APPEND);


    if ($data !== null) {
        if (isBidimensionalArray($data)) {
            // Iterar sobre a lista de endereços e inserir cada um na tabela
            foreach ($data as $address) {
                insertAddress($pdo, $address);
            }
        file_put_contents('endereco.txt', "\n\n é array", FILE_APPEND);		
        } else {
            // Tratar o caso em que apenas um registro é passado como JSON
            insertAddress($pdo, $data);
	    file_put_contents('endereco.txt', "\n\n nao é array", FILE_APPEND);
        }

        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Dados inválidos']);
    }

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}

function insertAddress($pdo, $address) {
    // Preparar e executar a consulta SQL
    $stmt = $pdo->prepare('INSERT INTO enderecos_do_OSM (place_id, licence, osm_type, osm_id, tipo, latitude, longitude, descricao, pais, estado, cidade, rua, postcode, limite_sul, limite_norte, limite_oeste, limite_leste, codigo_pais, codigo_estado, importancia_nominatim, ISO3166_2, bairro, regiao_do_estado, regiao_do_pais, id_pais, id_estado, id_municipio) VALUES (:place_id, :licence, :osm_type, :osm_id, :tipo, :latitude, :longitude, :display_name, :country, :state, :city, :street, :postcode, :limite_sul, :limite_norte, :limite_oeste, :limite_leste, :codigo_pais, :codigo_estado, :importancia_nominatim, :ISO3166_2, :bairro, :regiao_do_estado, :regiao_do_pais, (SELECT id_chave_pais FROM paises WHERE codigo_alpha2 = :codigo_pais), (select id_chave_estado from estados where codigo_iso3166_2 = :codigo_estado), (SELECT id_chave_municipio FROM municipios WHERE nome_municipio = :city))');

    $stmt->execute([
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
}
?>


// <?php
// // Substitua com suas credenciais de banco de dados
// 
// include "identifica.php.cripto";
// 
// $host = 'seu_host';
// $dbname = $nome_base_dados;
// $user = $username; 
// 
// try {
//     $pdo = new PDO('mysql:host=' . $host . ';dbname=' . $dbname, $user, $pass);
// 
//     // Receber os dados do JavaScript
//     $data = json_decode(file_get_contents('php://input'), true);
// 
//     // Preparar e executar a consulta SQL
//     $stmt = $pdo->prepare('INSERT INTO openstreetmap_data (place_id, licence, osm_type, osm_id, latitude, longitude, display_name, country, state, city, street, postcode) VALUES (:place_id, :licence, :osm_type, :osm_id, :latitude, :longitude, :display_name, :country, :state, :city, :street, :postcode)');
//     
//     $stmt->execute([
//         ':place_id' => $data['place_id'],
//         ':licence' => $data['licence'],
//         ':osm_type' => $data['osm_type'],
//         ':osm_id' => $data['osm_id'],
//         ':latitude' => $data['lat'],
//         ':longitude' => $data['lon'],
//         ':display_name' => $data['display_name'],
//         ':country' => $data['address']['country'],
//         ':state' => $data['address']['state'],
//         ':city' => $data['address']['city'],
//         ':street' => $data['address']['road'],
//         ':postcode' => $data['address']['postcode'],
//     ]);
// 
//     echo json_encode(['status' => 'success']);
// 
// } catch (PDOException $e) {
//     echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
// }
// ?>

