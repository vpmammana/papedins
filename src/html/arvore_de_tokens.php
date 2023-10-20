<?php

include "identifica.php.cripto";


$host = 'localhost';
$user = $username;
$db = $nome_base_dados;

// Estabelecer a conexão
$conn = new mysqli($host, $user, $pass, $db);

// Verificar a conexão
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Executar uma consulta SQL

echo "
<!DOCTYPE html>
<html>
<head>
    <title>Exemplo de Tabela</title>
    <style>
        /* Algumas estilizações básicas para a tabela */
        table {
            width: 50%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
		.mensagem {
			background-color: gray;
			color: black;
			border: 1px solid black;
			border-radius: 10px;
			padding: 10px;
			margin: 10px;
		}
    </style>
	<script>
	    function submitForm(id_token) {
	        var checkbox = document.getElementById('evidencia_'+id_token);
			console.log(checkbox);
			console.log(checkbox.getAttribute('data-nome-tipo-evidencia'));
			document.getElementById('nome_tipo_evidencia_'+id_token).value = checkbox.getAttribute('data-nome-tipo-evidencia');
			console.log('-> '+document.getElementById('nome_tipo_evidencia_'+id_token).value);
			document.getElementById('id_token_'+id_token).value = checkbox.getAttribute('data-id-token');
			document.getElementById('checked_status_'+id_token).value = checkbox.checked ? '1' : '0'; // Adicionado
	        var form = document.getElementById('myForm_'+id_token);
	        var xhr = new XMLHttpRequest();
	        xhr.open(form.method, form.action, true);
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
console.log(new URLSearchParams(new FormData(form)).toString());
	        xhr.send(new URLSearchParams(new FormData(form)).toString());
	
	        xhr.onloadend = function() {
	            if(xhr.status == 200) {
	                console.log(xhr.responseText);
	            }
	        };
	    }
	</script>
</head>
<body>
";

$mostra_tabela1="nao";
if ($mostra_tabela1=="sim"){

$sql = "

WITH RECURSIVE cte_hierarchy AS (
    -- Base case
    SELECT id_chave_token, id_raiz, nome_token, 
           CAST(nome_token AS CHAR(255)) AS hierarchy
    FROM tokens
    WHERE id_raiz IS NULL
    UNION ALL
    -- Recursive case
    SELECT c.id_chave_token, c.id_raiz, c.nome_token,
           CONCAT(ch.hierarchy, ' -> ', c.nome_token)
    FROM tokens c
    JOIN cte_hierarchy ch ON c.id_raiz = ch.id_chave_token
)
SELECT * FROM cte_hierarchy;

";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
echo "



<table>
<thead>
<tr>
<th>id_chave_token</th>
<th>id_raiz</th>
<th>nome_token</th>
<th>hierarchy</th>
</tr>
</thead>
<tbody>
";
    while($row = $result->fetch_assoc()) {
		$id_chave_token = $row["id_chave_token"];
		$id_raiz = $row["id_raiz"];
		$nome_token = $row["nome_token"];
		$hierarchy = $row["hierarchy"];
		echo "<tr><td>".$id_chave_token."</td><td>".$id_raiz."</td><td>".$nome_token."</td><td>".$hierarchy."</td></tr>";
    }

echo "
</tbody>
</table>

";

} else {

    echo "0 results";
}
}
$sql = "

WITH RECURSIVE category_path AS (
    -- Caso base: categorias sem parent (raízes)
    SELECT id_chave_token, nome_token, (select nome_tipo_token from tipos_tokens where id_chave_tipo_token = id_tipo_token) AS tipo_token, id_raiz, CAST(nome_token AS CHAR(255)) AS path, (select case when exists (select 1 from tipos_de_evidencias where id_token = id_chave_token) THEN 'checked' ELSE '' END) as marca
    FROM tokens
    WHERE id_raiz IS NULL
    
    UNION ALL
    
    -- Recursão: junta-se com a tabela original para encontrar filhos e construir o path
    SELECT c.id_chave_token, c.nome_token,(select nome_tipo_token from tipos_tokens where id_chave_tipo_token = c.id_tipo_token) as tipo_token, c.id_raiz, CONCAT(cp.path, ' > ', c.nome_token), (select case when exists (select 1 from tipos_de_evidencias where id_token = c.id_chave_token) THEN 'checked' ELSE '' END) as marca
    FROM tokens c
    JOIN category_path cp ON c.id_raiz = cp.id_chave_token
)

SELECT id_chave_token, nome_token, tipo_token, path,id_raiz, marca FROM category_path ORDER BY path;

";
$result2 = $conn->query($sql);

echo "<div class='mensagem'>Número de tokens: ".$result2->num_rows."</div>";

if ($result2->num_rows > 0) {
echo "
<table>
<thead>
<tr>
<th>id_chave_token</th>
<th>id_raiz</th>
<th>nome_token</th>
<th>tipo_token</th>
<th>hierarchy</th>
</tr>
</thead>
<tbody>
";
    while($row = $result2->fetch_assoc()) {
		$id_chave_token = $row["id_chave_token"];
		$id_raiz = $row["id_raiz"];
		$nome_token = $row["nome_token"];
		$hierarchy = $row["path"];
		$tipo_token = $row["tipo_token"];
		$marca = $row["marca"];
		echo "
		<tr>
		<td>".$id_chave_token."</td><td>".$id_raiz."</td><td>".$nome_token."</td><td>".$tipo_token."</td><td>".$hierarchy."</td>
		<td>".
		'<form id="myForm_'.$id_chave_token.'" action="processa.php" method="post">
		    <label for="evidencia_'.$id_chave_token.'">evidência de entrega:</label>
		    <input type="checkbox"
	           id="evidencia_'.$id_chave_token.'"
    	       name="evidencia"
        	   value="checked"
       		   data-nome-tipo-evidencia="'.$nome_token.'"
           	   data-id-token="'.$id_chave_token.'"
			   '.$marca.'
               onchange="submitForm('.$id_chave_token.');">
  			   <input type="hidden" name="nome_tipo_evidencia" id="nome_tipo_evidencia_'.$id_chave_token.'" value="">
			   <input type="hidden" name="id_token" id="id_token_'.$id_chave_token.'" value="">
	  		   <input type="hidden" name="checked_status" id="checked_status_'.$id_chave_token.'" value="">
		</form>
		</td>
	</tr>';
    }

echo "
</tbody>
</table>

";

} else {

    echo "0 result2s";
}



echo "
</body>
</html>
";

$conn->close();
?>
