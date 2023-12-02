<?php
$dadosRecebidos = json_decode(file_get_contents('php://input'), true);

function isMobile() {
    $userAgent = $_SERVER['HTTP_USER_AGENT'];

    if (preg_match('/mobile|android|touch|samsung|blackberry|iemobile|opera mini|windows phone|kindle/i', $userAgent)) {
        return "DISPOSITIVO MOVEL";
    }

    return "DESKTOP";
}



file_put_contents('dados_recebidos.txt', print_r($dadosRecebidos, true));

function formatarDados($dados) {
    $resultado = '';
$conta	=	0;

    foreach ($dados as $elemento) {
	$id = $elemento['id'];
	$resultado .= "Elemento: " . $conta . "\n";
	if ($conta == 0) {
		$resultado .= "min_top: " . $elemento['min_top'] . "\n";
		$resultado .= "min_left: " . $elemento['min_left'] . "\n";
		$resultado .= "max_bottom: " . $elemento['max_bottom'] . "\n";
		$resultado .= "max_right: " . $elemento['max_right'] . "\n\n";
	        $resultado .= str_repeat('+', 40) . "\n\n";
	}
	else {
	        $resultado .= "Tag de ".$id.": " . $elemento['tag'] . "\n";
	        $resultado .= "Type: " . $elemento['type'] . "\n";
	        $resultado .= "ID: " . $elemento['id'] . "\n";
	        $resultado .= "Classe: " . $elemento['class'] . "\n";
	      	$resultado .= "Tag do nó pai: ". $elemento['tag_no_pai']."\n";
	        $resultado .= "Id do nó pai de ".$id.": ". $elemento['id_no_pai']."\n";
	        $resultado .= "Tag do elemento pai de ".$id.": ". $elemento['tag_elemento_pai']."\n";
	        $resultado .= "Id do elemento pai: ". $elemento['id_elemento_pai']."\n";
	        $resultado .= "Classe do elemento pai de ".$id.": ". $elemento['class_elemento_pai']."\n";
	        $resultado .= "Position (computed) de ".$id.": " . $elemento['position'] . "\n";
	        $resultado .= "Display (computed) de ".$id.": " . $elemento['display'] . "\n";
	        $resultado .= "Top (bounding) de ".$id.": " . $elemento['top'] . "\n";
	        $resultado .= "Left (bounding) de ".$id.": " . $elemento['left'] . "\n";
	        $resultado .= "Bottom (bounding) de ".$id.": " . $elemento['bottom'] . "\n";
	        $resultado .= "Right (bounding) de ".$id.": " . $elemento['right'] . "\n";
	        $resultado .= "Height (bounding) de ".$id.": " . $elemento['height'] . "\n";
	        $resultado .= "Width (bounding) de ".$id.": " . $elemento['width'] . "\n";
	        $resultado .= "Padding (computed) de ".$id.": " . $elemento['padding'] . "\n";
	        $resultado .= "Margin (computed) de ".$id.": " . $elemento['margin'] . "\n";
	        $resultado .= "flex_shrink (computed) de ".$id.": " . $elemento['flex_shrink'] . "\n";
	        $resultado .= "max_width (computed) de ".$id.": " . $elemento['max_width'] . "\n";
	        $resultado .= "min_width (computed) de ".$id.": " . $elemento['min_width'] . "\n";
	        $resultado .= "overflow (computed) de ".$id.": " . $elemento['overflow'] . "\n";
	        $resultado .= str_repeat('=', 40) . "\n";
	}
        $conta++;
    }
    return $resultado;
}

$dadosFormatados = formatarDados($dadosRecebidos);
file_put_contents('status_aplicativo.txt', "Gravando: \n\n\n".isMobile()." - ".date("Y-m-d H:i:s")."\n\n\n".$dadosFormatados);

echo "Dados salvos com sucesso.";
?>

