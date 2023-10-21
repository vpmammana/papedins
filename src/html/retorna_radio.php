<?php

if(isset($_GET["tipo_token"])){
  $param_tipo_token= $_GET["tipo_token"];
} else $param_tipo_token = "todos";


// Conexão com o banco de dados (substitua com suas configurações)

include "identifica.php.cripto";
	$servername = "localhost";
    $password = $pass;
    $dbname = $nome_base_dados;

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Conexão falhou: " . $conn->connect_error);
    }

    // Consulta SQL para buscar os valores de nome_tipo_token
    $sql = "SELECT nome_tipo_token FROM tipos_tokens";
    $result = $conn->query($sql);
$checked_todos="checked";
    if ($result->num_rows > 0) {
        // Loop através dos resultados e cria radio buttons
        while ($row = $result->fetch_assoc()) {
            $nome_tipo_token = $row["nome_tipo_token"];
			if ($nome_tipo_token == $param_tipo_token) {$checked="checked"; $checked_todos="";} else {$checked="";}
            echo "<label><input type='radio' class='radio_sintatico' name='tipo_token' ".$checked." onclick='alert(`Script de recuperação só terá ".$nome_tipo_token.".`);recarrega(`".$nome_tipo_token."`)' value='$nome_tipo_token'>$nome_tipo_token</label>";
        }

    } else {
        echo "Nenhum resultado encontrado.";
    }
            echo "<label><input type='radio' class='radio_sintatico' name='tipo_token' ".$checked_todos." value='todos' onclick='recarrega(``)'><b>todos</b></label>";

    $conn->close();
?>

