<?php
// Criar uma nova imagem com 800x600 pixels
$image = imagecreatetruecolor(800, 600);

// Definir cores
$white = imagecolorallocate($image, 255, 255, 255);
$black = imagecolorallocate($image, 0, 0, 0);
$gray = imagecolorallocate($image, 200, 200, 200);

// Preencher o fundo com branco
imagefill($image, 0, 0, $white);

// Desenhar os cômodos
// Sala
imagefilledrectangle($image, 50, 50, 350, 300, $gray);
imagerectangle($image, 50, 50, 350, 300, $black);
imagestring($image, 5, 150, 150, 'Sala', $black);

// Cozinha
imagefilledrectangle($image, 400, 50, 700, 300, $gray);
imagerectangle($image, 400, 50, 700, 300, $black);
imagestring($image, 5, 500, 150, 'Cozinha', $black);

// Quartos
imagefilledrectangle($image, 50, 350, 250, 550, $gray);
imagerectangle($image, 50, 350, 250, 550, $black);
imagestring($image, 5, 100, 425, 'Quarto 1', $black);

imagefilledrectangle($image, 275, 350, 475, 550, $gray);
imagerectangle($image, 275, 350, 475, 550, $black);
imagestring($image, 5, 325, 425, 'Quarto 2', $black);

imagefilledrectangle($image, 500, 350, 700, 550, $gray);
imagerectangle($image, 500, 350, 700, 550, $black);
imagestring($image, 5, 550, 425, 'Quarto 3', $black);

// Banheiros
imagefilledrectangle($image, 725, 350, 775, 400, $gray);
imagerectangle($image, 725, 350, 775, 400, $black);
imagestring($image, 5, 735, 375, 'WC', $black);

imagefilledrectangle($image, 725, 425, 775, 475, $gray);
imagerectangle($image, 725, 425, 775, 475, $black);
imagestring($image, 5, 735, 450, 'WC', $black);

imagefilledrectangle($image, 725, 500, 775, 550, $gray);
imagerectangle($image, 725, 500, 775, 550, $black);
imagestring($image, 5, 735, 525, 'WC', $black);

// Enviar a imagem como PNG
header('Content-Type: image/png');
imagepng($image);

// Destruir a imagem para liberar memória
imagedestroy($image);
?>

