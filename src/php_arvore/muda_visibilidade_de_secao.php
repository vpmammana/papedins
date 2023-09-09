<?php

session_start();

if (!isset($_SESSION['loggedin'])) {
echo $_SESSION['loggedin'];
// header("Location: login.php");
echo "Acesso negado";
exit;
}

if (isset($_SESSION['loggedin'])) {
    if (!$_SESSION['loggedin']) {
        echo "Acesso negado - variavel falsa";
        exit;
    }

}


if(isset($_GET["nome_da_secao"])){
  $param_nome_da_secao= $_GET["nome_da_secao"];
} else $param_nome_da_secao = "estrutura";

if(isset($_GET["visibilidade"])){
  $param_visibilidade= $_GET["visibilidade"];
} else $param_visibilidade = "checked";




$usuario_logado = $_SESSION['username'];

include "identifica.php.cripto";

$database = $nome_base_dados;

$conn= new mysqli("localhost", $username, $pass, $database);

$sql = "insert into tipos_secoes_visiveis (id_user, id_nested_tipo_secao, visivel) values ((select id_chave_user from users where nome_user='".$usuario_logado."'),(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao = '".$param_nome_da_secao."'), '".$param_visibilidade."') on duplicate key update visivel = '".$param_visibilidade."';";

if ($conn->query($sql)===true){ echo "Mudou visibilidade da secao: ".$param_nome_da_secao." para o usuario: ".$usuario_logado." com: ".$param_visibilidade." SQL:".$sql;} else {echo "<br> Deu problema com o sql: ".$sql."<br> erro:".$conn->error."<br>";}

$conn->close();

?>
