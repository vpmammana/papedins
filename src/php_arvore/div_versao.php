<?php 

$divs="<div id='cabecalio_versoes_".$param_id_chave_secao."' class='cabecalio_versoes' style='top: 1px; left:1px; width: auto; height: ".$altura_cabecalio.$param_unidade."; font-size: ".$param_fonte.$param_unidade."; position:absolute; display: block; text-overflow: clip; white-space: nowrap; '>Versões Disponíveis</div>";
	$divs = $divs."<div id='secao_".$id."_".$conta_versoes."' class='uma_versao' data-trecho='".$trecho."' style='top: ".$altura_cabecalio.$param_unidade."; left: ".$posicao_x.$param_unidade."; width: ".$param_largura.$param_unidade."; height: ".$param_altura.$param_unidade."; display: table-cell; vertical-align: middle; font-size: ".$param_fonte.$param_unidade.";' data-id-chave='".$id."' onclick='document.getElementById(`".$param_textarea."`).value=this.getAttribute(`data-trecho`)'>".$nome_corrigido."</div>";
$divs = $divs."<div id='blank_".$param_textarea."' class='uma_versao' data-trecho='blank' style='top: ".$altura_cabecalio.$param_unidade."; left: ".$posicao_x.$param_unidade."; width: ".$largura_blank.$param_unidade."; height: ".$param_altura.$param_unidade."; display: table-cell; vertical-align: middle; font-size: ".$param_fonte.$param_unidade."; visibility: hidden' >blank</div>";
	$id			 = $row["id_chave_versao"];
$altura_cabecalio = $param_fonte * $param_fator_fonte;
	$posicao_x = $conta_versoes * ($param_largura + $param_separacao) + $param_largura;
	$nome_corrigido = preg_replace("/\.[0-9]*/","",$nome);
$largura_blank = 20*$param_largura;
