


<?php
include "identifica.php.cripto";

if(isset($_GET["banco"])){
  $banco = $_GET["banco"];
}

if(isset($_GET["tabela"])){
  $tabela = $_GET["tabela"];
}


if(isset($_GET["campo"])){
  $campo = $_GET["campo"];
}

if(isset($_GET["campo_mostrado"])){
  $campo_mostrado = $_GET["campo_mostrado"];
}

if(isset($_GET["nome_tipo_secao"])){
  $nome_tipo_secao = $_GET["nome_tipo_secao"];
}


if(isset($_GET["str_busca"])){
  $str_busca = $_GET["str_busca"];
}


$database=$banco;
$conn= new mysqli("localhost", $username, $pass, $database);
      $campo_nome=$campo_mostrado;

	$sql="select COLUMN_NAME from information_schema.columns where TABLE_NAME='".$tabela."' and COLUMN_NAME like 'id_chave_%'";
$result=$conn->query("$sql");


if ($result->num_rows>0) {
  while($row=$result->fetch_assoc())
    {
      $campo_id=$row["COLUMN_NAME"];
   }
} else {echo "Não veio nome_";};



$sql="select ".$campo_id.",".$campo_nome." from ".$tabela." where SUBSTRING(".$campo_nome.",1,100) like '%".$str_busca."%' order by ".$campo_nome.";";
#$sql="select ".$campo_id.",".$campo_nome.", (select nome_categoria from secoes where id_chave_categoria = id_secao) as nome_secao, (select nome_id_de_referencia from ids_de_referencia where id_secao_do_identificador = id_secao) as nome_id_da_referencia from ".$tabela." where SUBSTRING(".$campo_nome.",1,100) like '%".$str_busca."%' and id_secao in (select id_chave_categoria from secoes where id_tipo_secao=(select id_chave_nested_tipo_secao from nested_tipos_secoes where nome_nested_tipo_secao='".$nome_tipo_secao."') ) order by ".$campo_nome.";";
//echo $sql."<br>";

file_put_contents("debug_busca_str.sql",$sql);

$result=$conn->query("$sql");
if ($result->num_rows>0) {
  while($row=$result->fetch_assoc())
    {
	$nome=$row[$campo_nome];
	$id=$row[$campo_id];
	#$nome_secao=$row["nome_secao"];
	#$nome_id_referencia=$row["nome_id_da_referencia"];
        echo $nome."<rb>".$id."<br>";

    }
} else {echo "vazio";}

?>

