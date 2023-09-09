<?php
session_start();
include "../php_arvore/identifica.php.cripto";
$database = $nome_base_dados;
//$conn= new mysqli("localhost", $username, $pass, $database);

$db = new mysqli('localhost', $username, $pass, $database);

if ($db->connect_error) {
  die("Connection failed: " . $db->connect_error);
}

$usuario = $db->real_escape_string($_POST['username']);
$password = $db->real_escape_string($_POST['password']);

//echo $usuario;

//echo $password;
//$hashed_password = password_hash($password, PASSWORD_DEFAULT);

//echo $hashed_password;

$result = $db->query("SELECT * FROM users WHERE nome_user='$usuario'");

if ($result->num_rows > 0) {
  $user = $result->fetch_assoc();
  if (password_verify($password, $user['senha'])) {
    $_SESSION['loggedin'] = true;
    $_SESSION['username'] = $usuario;
//	echo "\n teste";
//	echo $_SESSION['loggedin'];
//	echo $_SESSION['username'];
    header("Location: index.php");
  } else {
    $_SESSION['loggedin'] = false;
    echo "Password is incorrect";
  }
} else {
  echo "No user found with that username";
}

$db->close();
?>

