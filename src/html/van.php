<?php
// Crie uma imagem vazia
$image = imagecreatetruecolor(400, 400);

// Defina algumas cores
$black = imagecolorallocate($image, 0, 0, 0);
$white = imagecolorallocate($image, 255, 255, 255);
$blue = imagecolorallocate($image, 0, 0, 255);
$yellow = imagecolorallocate($image, 255, 255, 0);

// Preencha o fundo com preto
imagefill($image, 0, 0, $black);

// Desenhe alguns círculos para representar as estrelas
imagefilledellipse($image, 50, 50, 40, 40, $yellow);
imagefilledellipse($image, 100, 100, 40, 40, $yellow);
imagefilledellipse($image, 150, 50, 40, 40, $yellow);

// Desenhe algumas linhas onduladas para representar o vento
for ($i = 0; $i <= 400; $i += 20) {
    imageline($image, $i, 200 + sin($i / 10) * 20, $i + 10, 200 + sin(($i + 10) / 10) * 20, $blue);
}

// Saída da imagem
header('Content-Type: image/png');
imagepng($image);

// Libere a memória
imagedestroy($image);
?>

