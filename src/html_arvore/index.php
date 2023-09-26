<?php

session_start();


if (!isset($_SESSION['loggedin'])) {
//echo $_SESSION['loggedin'];
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

?>

<!DOCTYPE html>
<html>
<head>
	<title>
		Fundacentro
		<?php echo "(".$_SESSION['username'].")" ?>
	</title>

		<link rel='stylesheet' href='../php_arvore/drop_menu.css'>	

<style>
html {
  height: 100%; 
  width: 100%;
}

body {
  height: 100%; /* Se nao definir isso, o offsetHeight nao funciona e dah zero */
  width: 100%;
  overflow: hidden;
background-color: #923cb5;
background-image: linear-gradient(147deg, #923cb5 0%, #000000 74%);
}

.radio_maior {
  /* Define a escala para aumentar o tamanho */
  transform: scale(2);
}

.check_maior {
  /* Define a escala para aumentar o tamanho */
  transform: scale(2);
}

.selecao_do_tipo {
    display: inline-block;
    vertical-align: middle;
}

.para_centralizar{
  margin: auto;
  border: 3px solid #73AD21;
  width: 100%;
  height: 100%;
  position: relative;
  border: 1px solid black;
}

.tabela_do_texto {
	
	border-collapse: collapse;
}
.tabela_do_texto * {
	border: 1px solid black;
	font-size: 0.6rem;
}
.janela_de_referencias{
	background-color: white;
	color: black;
	border: 3px solid black;
	border-radius: 25px;
	z-index: 100000;
	position: absolute;
	display: block;
	visibility: hidden;
	padding: 20px;
}

.tabela_de_edicao{
	width: 100%;
	text-align: left;
	table-layout: fixed;
}

.tabela_de_edicao *{
	border: 1px solid black;
	border-spacing: 0;
	border-collapse: collapse;
	padding-left: 5px;
	padding-right: 5px;
	font-size: 1rem;
}

.tabela_de_edicao_sem_borda{
	width: 100%;
	text-align: left;
}

.tabela_de_edicao_sem_borda *{
	border: none;
	padding-left: 2px;
	padding-right: 2px;
	font-size: 1rem;
}

.retira_borda {
	border: none !important;
}

textarea {
 width: 100%;
 box-sizing: border-box;
 font-size: 1rem;
 height: 100%;
white-space: pre-wrap;
}

.edita_secoes {
	background-color: gray;
	color: black;
	position: absolute;
	border: 3px solid lightblue;
	overflow: auto;
	font-size: 0.8rem;
	height: 100%;
}
.hint_trechos{
	visibility: hidden;
	position: absolute;
	overflow: scroll;
	z-index: 2000;
	display: block;
	background-color: white;
	color: black;
	border: 2px solid yellow;
	font-size: 0.7rem;
}

.menu_principal {
	position: absolute;
	background-color: black;
	color: white;
	top: 0px;
	left: 0px;
	height: auto;
	width: 100%;
}

.itens_numerados_ou_nao * {
	vertical-align: top;
}

.check_na_table {
	width: 300px;
}
input[type=radio]
{
  /* Double-sized Checkboxes */
  float: left;
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari and Chrome */
  -o-transform: scale(1.5); /* Opera */
  transform: scale(1.5);
  padding: 10px;
}
label{
  font-size: 100%;
  display: block;
  margin-left: 30px;
}

.blank {
	box-sizing: border-box;
	color: white;
	float: right;
	display: inline;
	visibility: hidden;
}

.div_para_padding {
	width: 90%;
	border: 1px solid blue;
	border-radius: 10px;
	background-color: #606060;
	color: white;
	padding-left: 10px;
	padding-right: 10px;
	text-align: left;
	border: 1px solid darkgray;

}

.cabecalio_de_nivel {
	border: 1px solid black;
	background-color: white;
	color: black;
	position: absolute;
}

.cabecalio_de_arvore {
	box-sizing: border-box;
	border: 1px solid black;
	background-color: black;
	color: white;
	position: -webkit-sticky; /* Safari & IE */
	position: sticky;
	top: 0;
	z-index: 1000;
}

.cursor_box {
	position: absolute;
	opacity: 0.4;
	background-color: gray;
}

.moldura {
	box-sizing: border-box;
	position: absolute;
	border: 1px solid black;
	background-color: lightgray;
	overflow: scroll;
	overflow-x: hidden;
}
.moldura_ts {
	box-sizing: border-box;
	position: absolute;
	border: 1px solid black;
	background-color: gray;
	overflow: auto;
	overflow-x: hidden;
}

.nivel {
	border: 1px solid black;
	background-color: gray;
	position: absolute;
	overflow: scroll;
	overflow-x: hidden;
	transition: all 1s ease-in-out;
 	-webkit-transition: all 1s ease-in-out;
	scroll-behavior: smooth;
}
.pai {
	border: 1px solid black;
	box-sizing: border-box;
	background-color: yellow;
	display: block;
	overflow: hidden;
	transition: all .6s ease-in-out;
 	-webkit-transition: all .6s ease-in-out;
	margin-left: auto;
	margin-right: auto;
}

.titulo {
	float: left;
	font-size: 1.2rem;
	width: 100%;
	padding: 10px;
	font-size: 1.4rem;
	font-weight: bold;
	background-color: black;
	color: white;
}
.secao {
	box-sizing: border-box;
	color: white;
	float: right;
	display: inline;
	padding-left: 10px;
}

.limita {
	width: 100%;
	overflow: scroll;
	height: 100%;
	display: block;
	text-overflow: clip;
	white-space: nowrap;
}

.folha_de_arvore {
	position: absolute;
	background-color: green;
	color: white;
	padding: 3px;
	overflow: auto;
	overflow-y: hidden;
	padding: 2px;
}

.pode_mostrar_trechos {
	display: block;
	text-overflow: clip;
	white-space: nowrap;
	overflow: hidden !important;
  -ms-overflow-style: none;  /* IE and Edge */
  scrollbar-width: none;  /* Firefox */

}

.pode_mostrar_trechos::-webkit-scrollbar {
  display: none;
}

.popup {
    position: fixed;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    visibility: hidden;
    border-radius: 25px;
    background-color: yellow;
    border: 1px solid black;
    height: 10%;
    width: 30%;
    font-size: 3vw;
    z-index: 10000;
    justify-content: center;
    display: flex;
    align-items: center;
}

.uma_versao {
	padding: 1px;
	position: absolute;
	background-color: yellow;
	color: black;
	border-radius: 0.4rem;
	text-align: center;
	display: block;	
}

.div_versoes {
	padding: 1px;
	font-size: 1rem;
	width: inherit;
	max-width: 100%;
	height: 100%;
	background-color: blue;
	color: white;
	overflow-y: hidden;
	overflow-x: scroll;
	border: 1px solid black;
	box-sizing: border-box;
	position: relative;
	transition: all 1s ease-in-out;
 	-webkit-transition: all 1s ease-in-out;
	scroll-behavior: smooth;
}

</style>
</head>
<body>
<div id="popup_gravando" class="popup">gravando...</div>
<div id="popup_apagando" class="popup">apagando...</div>
<div id="popup_latex" class="popup">Gerando LaTeX...</div>

<?php


ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);


include "../php_arvore/identifica.php.cripto";
$database = $nome_base_dados; 
$numero_de_colunas_de_radio_button = 10;

//echo "</table>";

include "../php_arvore/carrega_arvore.php";
?>
<script type='text/javascript' src='../php_arvore/drop_menu.js'></script>
<script>

var toggle_achei_secao_escondida = false;
var primeira_secao_escondida = "";

var toggle_selecionador = false;
var str_palavra_de_busca = "";
var ultimo_visitado_flutua_para_direita = -2; // ainda nao foi visitado
var mostra_selecao_checks_obj={}; // objeto com os tipos de secoes que devem ser mostrados
var lista_para_apagar=[];

var debug = document.getElementById("edita_secoes_teclado");
var array_scroll_horizontal=[];
var largura_do_botao_de_versao = '8';
var altura_do_botao_de_versao = '2';
var fonte_do_botao_de_versao = '1';
var separacao_do_botao_de_versao = '8';

var cor_de_edicao = "yellow";
var cor_de_gravado = "lightgray";
var cor_de_problema = "red";


var fator_fonte_versao = 1.3;
var unidade = 'rem';

var gemeo_atual_na_arvore=null;
var gemeo_atual_no_nivel=null;
var velho_gemeo_no_nivel = null;
var modo_edicao = false;
var modo_busca = false;
var textarea_em_edicao = null;
var versoes_em_edicao = null;
var conta_tentativas_de_ajuste_de_tela=0;

var popup_gravando = document.getElementById("popup_gravando");
var popup_apagando = document.getElementById("popup_apagando");
var popup_latex = document.getElementById("popup_latex");

var minima_largura_percentual_da_edicao = 0.11; // define a largura do box 1 e box 2

var acao_principal = "nenhuma"; // pode assumir os valores de nenhuma e insere_paragrafo. Ainda nao encontrei o estado ideal para acionar o insere_paragrafo

var x = x_sessao_anterior; // aumenta com seta para direita e diminui com seta para esquerda
var y = y_sessao_anterior; // aumenta com seta para baixo e diminui com seta para cima
//alert("inicializa x e y. x="+x+" y=" +y );

var x_versao = 0;  // versao eh provavelmente relacionado aa tabela versoes do banco de dados
var x_arvore=0; // indica posicao do cursor azul (depois verde claro) presente na arvore de secoes, gerado pelo movimento nos niveis 
var y_arvore=0;
var max_dir = 0;
var min_esq = 1000000000000000000;

var guarda_ultimo_visitado = [];



var borda_focalizada = "5px double orange";


var velho_focado; // parametros da ultima borda focalizada
var velha_borda_focalizada;
var velha_borda_de_nivel_focalizada;
var baixa_opacidade = 0.3;
var faixa_que_precisa_de_scroll = 2;
var padding_de_screen = 10; // evita que os elementos flutuantes encostem nas bordas da tela

var id_da_folha_onde_esta_flutuando;

var matriz_ganha_foco=[]; // eh a matriz que guarda uma copia dos divs que serao percorridos pelo teclado.
var texto_a_separar="";

var tipos_nao_editaveis = ",mult_imagem,"; // normalmente marcadores de formatacao, como mult_imagem, USE VIRGULAS SEM ESPACOS PARA SEPARAR, porque assim nao tem como imagem match com mult_imagem
function junta_proximo (){

var tipos_autorizados = "paragrafo, citacao, item_lista_num, item_lista_nao_num"; // autorizados para juntar e mais alguma coisa que nao me lembro agora

if (!matriz_ganha_foco[x][0].includes("nivel")) {alert("Você só pode fazer junta numa janela de nível."); return;}
if (x == 0) {alert("Você não pode juntar seções do nível 1."); return;}
if (y >= matriz_ganha_foco[x][1].length-1) {alert("Você está na última seção do nível e não há nada para juntar."); return;}
if (matriz_ganha_foco[x][1][y].getAttribute("data-id-pai")!=matriz_ganha_foco[x][1][y+1].getAttribute("data-id-pai")) {alert("Você está na última subseção da seção "+matriz_ganha_foco[x][1][y].getAttribute("data-id-pai")+ "  e portanto não há nada para juntar."); return;}
if (!tipos_autorizados.includes(matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao"))) {alert("Apenas os tipos "+ tipos_autorizados + " podem ser juntados. Você está tentando juntar em uma seção tipo "+matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao")); return;}
setTimeout(
function (){
	simula_key_down("Tab");
	setTimeout(
		function (){
			simula_key_down("ArrowDown");
			setTimeout(
				function (){
					simula_key_down(" ");			
					setTimeout(
						function (){
							simula_key_down("ArrowLeft");
							setTimeout(
								function (){
									simula_key_down("1");
									setTimeout(
										function (){
											textarea_teclado.value = textarea_teclado.value + " " + textarea_mouse.value;
											setTimeout(
												function (){
													//alert(textarea_teclado.value);
													simula_key_down("Tab");
													setTimeout(
														function (){
															transpoe_subarvore(document.getElementById(`edita_secoes_mouse_id_secao`).innerText,`lixeira`);
														}
													,40);
												}
											,40);
										}
									,40);
								}
							,40);
						}
					,40);
				}
			,40);
		}
	,40);

}
,40);

} // junta_proximo

function retorna_texto_de_textarea (){ // retorna a ultima parte do texto, a partir do cursor e depois deleta esta ultima parte
	let field = textarea_em_edicao;
	let start= field.selectionStart;
	let end = field.value.length;
	
	if( field.createTextRange ) {
	        var selRange = field.createTextRange();
	        selRange.collapse(true);
	        selRange.moveStart('character', start);
	        selRange.moveEnd('character', end-start);
	        selRange.select();
	    } else if( field.setSelectionRange ) {
	        field.setSelectionRange(start, end);
	    } else if( field.selectionStart ) {
	        field.selectionStart = start;
	        field.selectionEnd = end;
	    }
	console.log(start + "=================" +end);
	field.focus();
	
	texto_a_separar = textarea_em_edicao.value.slice(start, end);
	let texto_que_deve_sobrar = textarea_em_edicao.value.slice(0, start).trim();
	textarea_em_edicao.value = texto_que_deve_sobrar;
	//alert(texto_que_deve_sobrar);
	//alert("vai "+textarea_em_edicao.id+" starti "+start + " end "+end);
	setTimeout(
		function (){
			simula_key_down("Tab");
			setTimeout(
				function () {
					simula_key_down("i");		
			}
			,20);
		}
	,10);
	
	
} // retorna_texto_de_textarea

function recursao_para_achar_tipo_na_arvore (tipo_buscado, tipo_atual){ // esse malabarismo eh para dar sincronia na busca do tipo na arvore de tipos, porque estou simulando o teclado.
	if (tipo_buscado == tipo_atual) {
		setTimeout(function () {simula_key_down("2");}, 10); // achou, então entra em modo edicao usando a tecla simulada 2
		setTimeout(function () 
						{
	//						alert("texto a separar -> "+texto_a_separar);
							if (texto_a_separar > "") 
							{
								setTimeout(
								function (){
									textarea_mouse.value =  texto_a_separar;
									// alert("vai clicar na insercao abaixo");
									document.getElementById("botao_nova_secao_abaixo").click();
									texto_a_separar="";
								}
								,100)
							}
						}
				  , 50
				  ); // 

		return;
	} else
	{
		setTimeout(function () 
			{
				simula_key_down("ArrowDown");
				setTimeout(
				function () {
					tipo_atual = matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao"); 
				    console.log(tipo_buscado + " --------------" + tipo_atual);
					recursao_para_achar_tipo_na_arvore(tipo_buscado, tipo_atual);
				}
				,10);
			}
		,50);
	}

}

function toggle_mostra_marcadores(){

if (toggle_selecionador) {lista_para_apagar.length = 0;} // limpa a lista de apagamento.

const colecao_de_secoes_seleciona = document.getElementsByClassName("seleciona_secao");
for (let i = 0; i < colecao_de_secoes_seleciona.length; i++) {
        if (toggle_selecionador) {
		colecao_de_secoes_seleciona[i].style.display = "none";
		colecao_de_secoes_seleciona[i].checked = false;
		document.getElementById("apagar_mult_secoes").style.visibility="hidden";
		

	} 
	else
	{
		if (colecao_de_secoes_seleciona[i].getAttribute("data-tem-filho")=="NAO_TEM_FILHO") {
		colecao_de_secoes_seleciona[i].style.display = "block";
		document.getElementById("apagar_mult_secoes").style.visibility="visible";
		}
	}
} // fim for
const secoes_para_mudar_borda = document.getElementsByClassName("secao");
for (let i = 0; i < secoes_para_mudar_borda.length; i++) {
        if (toggle_selecionador) {
		secoes_para_mudar_borda[i].style.border = "none";
	} 
	else
	{
		if (secoes_para_mudar_borda[i].getAttribute("data-tem-filho")=="NAO_TEM_FILHO") {
		secoes_para_mudar_borda[i].style.border = "1px solid black";
		}
	}
} // fim for

toggle_selecionador = !toggle_selecionador;

} // fim function

function muda_visibilidade(secao, visibilidade){

let secoes_visiveis = document.getElementsByClassName("secao");
let i;

for (i=0; i<secoes_visiveis.length; i++){

 if (secoes_visiveis[i].getAttribute("data-nome-tipo-secao") == secao){
		secoes_visiveis[i].style.display = visibilidade == "checked" ? "": "none" ;
 	}
}

//console.log(secoes_visiveis);
//let itz_bost = visibilidade == "checked" ? "visible": "hidden";
//alert("veja console: "+secao+ " visibilidade: "+ visibilidade + " ternario:" + itz_bost );

var resposta="";
var url="../php_arvore/muda_visibilidade_de_secao.php?nome_da_secao="+secao+"&visibilidade="+visibilidade;
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
					 // alert(resposta);
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();

}



function grava_word(){
var resposta="";
var url='../php_arvore/grava_word.php';
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
			alert("Atenção: esta opção gera o DOCX a partir da última versão de geração do Latex. Se você fez alguma alteração no documento, precisa gerar o LATEX primeiro.");
                        window.open(resposta);
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();

}

function grava_backup_sql(){
var resposta="";
var url='../php_arvore/grava_script_sql.php';
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
			var win = window.open();
			win.document.body.innerHTML = resposta;
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();

}

function insertAtCaret(areaId,text) { // fonte: fnicollier no github - para inserir onde o cursor está no textarea, acho
		var txtarea = document.getElementById(areaId);
		var scrollPos = txtarea.scrollTop;
		var strPos = 0;
		var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ? 
			"ff" : (document.selection ? "ie" : false ) );
		if (br == "ie") { 
			txtarea.focus();
			var range = document.selection.createRange();
			range.moveStart ('character', -txtarea.value.length);
			strPos = range.text.length;
		}
		else if (br == "ff") strPos = txtarea.selectionStart;
	
		var front = (txtarea.value).substring(0,strPos);  
		var back = (txtarea.value).substring(strPos,txtarea.value.length); 
		txtarea.value=front+text+back;
		strPos = strPos + text.length;
		if (br == "ie") { 
			txtarea.focus();
			var range = document.selection.createRange();
			range.moveStart ('character', -txtarea.value.length);
			range.moveStart ('character', strPos);
			range.moveEnd ('character', 0);
			range.select();
		}
		else if (br == "ff") {
			txtarea.selectionStart = strPos;
			txtarea.selectionEnd = strPos;
			txtarea.focus();
		}
		txtarea.scrollTop = scrollPos;
	}

function desabilita_box(habilita, box){
	let inputs_box1 = document.getElementById(box).getElementsByTagName("input");
	let i;	
	for (i=0; i < inputs_box1.length; i++){
		inputs_box1[i].disabled = habilita;
	}

} //desabilita_box

function coloca_setas_no_pai(){
const colecao_de_secoes = document.getElementsByClassName("secao");
for (let i = 0; i < colecao_de_secoes.length; i++) {
	var elemento = colecao_de_secoes[i].getAttribute("data-id-pai");
	//console.log("elemento -> " + elemento);
	if (document.getElementById("label_"+elemento) === null) {} else 
		{
			document.getElementById("label_"+elemento).innerHTML="&#10148;";
		}
}



}


function limpa_array(){
	for (i=0; i<matriz_ganha_foco.length; i++){
			matriz_ganha_foco[i][1].length = 0;
			matriz_ganha_foco[i].length = 0;
	}
	matriz_ganha_foco.length = 0;
}

function grava_trecho(id_chave_secao, id_secao, trecho_original, div_versoes, textarea){ // grava uma nova versao de secao


let trecho = trecho_original.replace(/(?:\\[rn]|[\r\n]+)+/g,'\\r\\n');

//alert("-> "+trecho);
if (id_secao == "corpo_tese") {alert("Você não pode alterar a raiz do documento. Nada será feito."); return;}
if (id_chave_secao <0) {alert("Você ainda não selecionou uma seção. Nada será feito."); return;}
popup_gravando.style.visibility = "visible";
setTimeout(function(){popup_gravando.style.visibility = "hidden";}, 2000);
var resposta="";
var url='../php_arvore/insere_novo_trecho.php?id_chave_secao='+id_chave_secao+'&trecho='+trecho;
//alert(url);
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     //alert(resposta);


			if (resposta.includes("Deu problema")){ alert(resposta); textarea.setAttribute("data-alterado","problema"); textarea.style.backgroundColor = cor_de_problema;} else {
			textarea.setAttribute("data-alterado","gravado"); textarea.style.backgroundColor = cor_de_gravado;
			console.log("carrega_versoes_scroll: grava trecho");
			carrega_versoes_scroll(div_versoes.id,  id_chave_secao, textarea, e.key);
			document.getElementById("secao_"+id_secao).setAttribute("data-titulo", trecho);
			document.getElementById("folha_arvore_"+id_secao).setAttribute("data-titulo", trecho);
			
			if (document.getElementById("check_mostra_trechos").checked) {
				document.getElementById("folha_arvore_"+id_secao).innerHTML = trecho;
			};

		 	     if (document.getElementById(radical_de_nucleo+id_secao) == null) // acha o ponto certo para inserir o novo trecho, sem ter que ficar buscando children  
				{
					document.getElementById("secao_"+id_secao).innerHTML = trecho;
					
				}
				else
				{
					let pattern = /<b>([a-zA-Zà-úÀ-Ú\s]+)<\/b>: /g;	// regexp para pegar todas as frases que estiverem entre markups de bold, para não perder os rótulos que já estavam
					let bold = document.getElementById(radical_de_nucleo+id_secao).innerHTML.match(pattern);
					document.getElementById(radical_de_nucleo+id_secao).innerHTML = bold + trecho;
				}
			}
			if (document.getElementById("secao_"+id_secao).getAttribute("data-nome-tipo-secao")=="tabela" || document.getElementById("secao_"+id_secao).getAttribute("data-nome-tipo-secao")=="tabela" )
				{  recarrega(document.getElementById(radio_selecionado).value, radio_selecionado);}
                     }
           oReq.send();


} // fim grava_trecho

function verifica_checks_de_mostra_secao(){

	let checks = document.getElementsByClassName("checks_definem_mostra"); // percorre todos os checkboxes que definem quais secoes serao mostradas ou nao
	let i;

	for (i=0; i < checks.length; i++) {
		console.log(checks[i])
		if (!checks[i].checked) {
			
			mostra_selecao_checks_obj[checks[i].getAttribute("data-nome-tipo-secao")]="";
		}
	}
			console.log(mostra_selecao_checks_obj);
//alert("veja console");
}

function recarrega(tipo, radio){
verifica_checks_de_mostra_secao();
console.log(mostra_selecao_checks_obj);
//alert("veja console");
var arrStr =encodeURIComponent(JSON.stringify(largura_niveis_array)); 
var arrMostra =encodeURIComponent(JSON.stringify(mostra_selecao_checks_obj));
var param_filhos = document.getElementById("check_mostra_filhos").checked;
//console.log(gemeo_atual_no_nivel);
// alert("recarrega: "+x+" <---> "+y+ "    gemeononivel"+gemeo_atual_no_nivel.id);
	itz_x = 0;
	itz_y = 0;

//console.log("gemeo");


if (matriz_ganha_foco[x][0].includes("flutua_para_direita") && (ultimo_visitado_flutua_para_direita > -1)) {
	itz_x = gemeo_atual_no_nivel.getAttribute("data-nivel") - 1; 
	itz_y = gemeo_atual_no_nivel.getAttribute("data-y");}

if (matriz_ganha_foco[x][0].includes("seletor") && (ultimo_visitado_flutua_para_direita > -1)) {
//alert("seletor");	
	if (gemeo_atual_no_nivel == null) {
		itz_x = x; 	
		itz_y = y;	
		// alert("gemeo_atua == null ");
	}
	else
		{
			itz_x = gemeo_atual_no_nivel.getAttribute("data-nivel") - 1; 
			itz_y = parseInt(gemeo_atual_no_nivel.getAttribute("data-y")) + 1;
			// alert("gemeo_atua != null itz_x: " + itz_x+ "itz_y: "+itz_y );
		}
	}
if (matriz_ganha_foco[x][0].includes("nivel")) {
	itz_x = x;
	itz_y = y;}

window.location.search = "?tipo_secao="+tipo+"&filhos="+param_filhos+"&n_niveis="+quantos_niveis_mostra+"&json="+arrStr+ "&json_checks="+arrMostra+
						"&fator_reducao="+fator_de_reducao_da_largura_da_arvore+"&palavra_de_busca="+str_palavra_de_busca+"&x_cursor="+ itz_x +"&y_cursor=" + itz_y;
} // fim recarrega

function maximiza_altura(classe){

const colecao = document.getElementsByClassName(classe);
for (let i = 0; i < colecao.length; i++) {
	colecao[i].style.height = Math.round(document.body.offsetHeight - colecao[i].getBoundingClientRect().top - 6 * padding_de_screen) + "px";
	//console.log(colecao[i].id);
} // for

} // fim maximiza_altura

function flutua_para_baixo(id_elemento, id_cabecalio) {

const div_para_flutuar = document.getElementById(id_elemento);
	div_para_flutuar.style.height = Math.floor((document.body.offsetHeight - parseInt(document.getElementById("menu_principal").getBoundingClientRect().height) - padding_de_screen) / 2) - document.getElementById(id_cabecalio).style.height.replace("px","") + "px" ;

	let correcao=  document.body.offsetHeight - div_para_flutuar.getBoundingClientRect().bottom ;
	div_para_flutuar.style.top = parseInt(div_para_flutuar.style.top.replace("px","")) + correcao - padding_de_screen +"px";

}

function flutua_para_cima(id_elemento, id_cabecalio) {

const div_para_flutuar = document.getElementById(id_elemento);
	div_para_flutuar.style.height = Math.floor(document.body.offsetHeight / 2) - document.getElementById(id_cabecalio).style.height.replace("px","") + "px";

	let correcao= document.getElementById("menu_principal").getBoundingClientRect().bottom - div_para_flutuar.getBoundingClientRect().top;
	div_para_flutuar.style.top = parseInt(div_para_flutuar.style.top.replace("px","")) + correcao + padding_de_screen +"px";

}

function flutua_para_cima_mantem_altura(id_elemento, id_cabecalio) {
//console.log(id_cabecalio);
const div_para_flutuar = document.getElementById(id_elemento);
let cabecalio_para_flutuar = document.getElementById(id_cabecalio);

//	div_para_flutuar.style.height = Math.floor(document.body.offsetHeight / 2) - document.getElementById(id_cabecalio).style.height.replace("px","") + "px";

	let correcao= document.getElementById("menu_principal").getBoundingClientRect().bottom - div_para_flutuar.getBoundingClientRect().top + parseInt(cabecalio_para_flutuar.style.height.replace("px",""));
	div_para_flutuar.style.top = parseInt(div_para_flutuar.style.top.replace("px","")) + correcao + padding_de_screen +"px";
	cabecalio_para_flutuar.style.top = parseInt(cabecalio_para_flutuar.style.top.replace("px","")) + correcao + padding_de_screen +"px";

}

function flutua_para_direita(id_elemento) {

const div_para_flutuar = document.getElementById(id_elemento);

	let correcao= document.body.offsetWidth - div_para_flutuar.getBoundingClientRect().right;
	//alert(id_elemento+" - screen avail "+screen.availWidth+" - document.offsetwidth"+document.body.offsetWidth + " - div para flutuar "+div_para_flutuar.getBoundingClientRect().right + " - "  +correcao);
	div_para_flutuar.style.left = parseInt(div_para_flutuar.style.left.replace("px","")) + correcao -padding_de_screen +"px";
//const collection4 = document.getElementsByClassName(id_elemento+"_filho");
//
//for (let i = 0; i < collection4.length; i++) {
//	let itz = collection4[i];
//	itz.style.left = parseInt(itz.style.left.replace("px","")) + correcao + "px";
//}

}

function ajusta_bordas_do_selecionado(){
	
		velha_borda_focalizada = matriz_ganha_foco[x][1][y].style.border;
		velha_borda_de_nivel_focalizada=document.getElementById(matriz_ganha_foco[x][0]).style.border;	
		document.getElementById(matriz_ganha_foco[x][0]).style.border = borda_focalizada;	
		matriz_ganha_foco[x][1][y].style.border = borda_focalizada;
		if (matriz_ganha_foco[x][0].includes("nivel")) { matriz_ganha_foco[x][1][y].click(); scroll_nivel(document.getElementById(matriz_ganha_foco[x][0]), matriz_ganha_foco[x][1][y]);}

} // ajusta_bordas_do_selecionado

function carrega_array_de_scroll_horizontal(elemento){
array_scroll_horizontal.length = 0;

const versoes_para_scroll = elemento.children;
let i;
for (i = 1; i < versoes_para_scroll.length - 1; i++){
	array_scroll_horizontal.push(versoes_para_scroll[i]);
}
x_versao = versoes_para_scroll.length - 3; // menos 3 porque o array comeca em 0
}




function scroll_horizontal(elemento){
//alert(x_versao+"  "+array_scroll_horizontal.length);
elemento.scrollLeft = array_scroll_horizontal[x_versao].style.left.replace("px","") - elemento.clientWidth /2 + array_scroll_horizontal[x_versao].clientWidth/2;
}

function gera_mostra_pdf_tese(){

setTimeout(function () {popup_latex.style.visibility = "visible";}, 100); // settimeout para forçar visualização

var resposta="";
var url='../php_arvore/gera_tex2_USPSC.php?mode=quiet';
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
			popup_latex.style.visibility = "hidden";
			//alert(resposta); atencao porque pode vir um erro de gera_tex2 na resposta. Mas isso depende de como o PHP estah configurado. No specchio vem erro, no pc local nao
			window.open(resposta);
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();
}

function gera_mostra_pdf_utfpr(){

setTimeout(function () {popup_latex.style.visibility = "visible";}, 100); // settimeout para forçar visualização

var resposta="";
var url='../php_arvore/gera_tex2_utfpr.php?mode=quiet';
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
			popup_latex.style.visibility = "hidden";
			// alert(resposta); // atencao porque pode vir um erro de gera_tex2 na resposta. Mas isso depende de como o PHP estah configurado. No specchio vem erro, no pc local nao
			window.open(resposta);
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();
}

function insere_nova_secao_a_esq(nome_secao, id_tipo_secao, trecho_original){

let trecho = trecho_original.replace(/\r\n/g,'\\r\\n')

var resposta="";
var url='../php_arvore/insere_esq.php?nome_secao='+nome_secao+'&id_tipo_secao='+id_tipo_secao+'&trecho='+trecho;
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     elemento.value = resposta.trim(); // estah voltando com o linebreak no comeco por causa do ?> no final do arquivo identifica.php.cripto
		     recarrega(document.getElementById(radio_selecionado).value, radio_selecionado);
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();
}

function insere_nova_secao_abaixo(nome_secao_pai, nome_tipo_secao, trecho_original){

let trecho = trecho_original.replace(/\r\n/g,'\\r\\n');

var resposta="";
var url='../php_arvore/insere_abaixo.php?nome_secao_pai='+nome_secao_pai+'&nome_tipo_secao='+nome_tipo_secao+'&trecho='+trecho;
//alert(url);
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     elemento.value = resposta.trim(); // estah voltando com o linebreak no comeco por causa do ?> no final do arquivo identifica.php.cripto
			 gemeo_atual_no_nivel = document.getElementById(matriz_ganha_foco[matriz_ganha_foco.length - 2][1][ultimo_visitado_flutua_para_direita].getAttribute("data-gemeo")); // -2 para pegar flutua_para_direita. gemeo_atual_no_nivel passa a ser clone do que foi selecionado na arvore de secoes
		     setTimeout(function () {recarrega(document.getElementById(radio_selecionado).value, radio_selecionado);}, 1000);
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();
}

function insere_nova_secao_a_dir(nome_secao, id_tipo_secao, trecho_original, nome_tipo_secao){

let trecho = trecho_original;

//let pos_enter = /\r|\n/g.exec(trecho).index;

let index_enter = trecho.lastIndexOf("\n");

if ( trecho.lastIndexOf("\r") < index_enter) {
    index_enter = trecho.lastIndexOf("\r");
}



let subtrecho = "";

if (index_enter < 0 || nome_tipo_secao=="tabela") 
	{ 
		subtrecho = trecho.replace(/(?:\\[rn]|[\r\n]+)+/g,'\\r\\n');
	}
else 
		{
			subtrecho = trecho.substring(index_enter).replace(/(?:\\[rn]|[\r\n]+)+/g,'\\r\\n');
			trecho = trecho.substring(0, index_enter - 1);
		}

var resposta="";
var url='../php_arvore/insere_dir.php?nome_secao='+nome_secao+'&id_tipo_secao='+id_tipo_secao+'&trecho='+subtrecho;
//alert("insere_dir -> "+url);
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     elemento.value = resposta.trim(); // estah voltando com o linebreak no comeco por causa do ?> no final do arquivo identifica.php.cripto, P.S. -> estranho porque trim deveria remover soh whitespace
		     if (index_enter < 0) {
			 	recarrega(document.getElementById(radio_selecionado).value, radio_selecionado);
			 }
			 else {
		 		insere_nova_secao_a_dir(nome_secao, id_tipo_secao, trecho, nome_tipo_secao); // insere uma secao por newline contida no Box... 
		 	 }
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();
}

function carrega_versao_selecionada(id_chave_secao, textarea){
elemento = textarea;


var resposta="";
var url='../php_arvore/retorna_versao_pelo_id.php?id_chave_secao='+id_chave_secao;
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     elemento.value = resposta.trim(); // estah voltando com o linebreak no comeco por causa do ?> no final do arquivo identifica.php.cripto
		     //textarea.setAttribute("data-alterado","sem_gravar");
		     //textarea.style.backgroundColor = cor_de_edicao; 

	   }
           oReq.send();
}

function transpoe_subarvore_recursivo( secao_alvo){

if (lista_para_apagar.length < 1) { recarrega(document.getElementById(radio_selecionado).value, radio_selecionado); setTimeout(function () {popup_gravando.style.visibility = "hidden";}, 300); return;}
popup_apagando.style.visibility = "visible";

let secao_movel = lista_para_apagar.pop().getAttribute("data-id-secao");
console.log(secao_movel + " -> "+ lista_para_apagar.length);

var resposta="";
var url='../php_arvore/transpoe_subarvore.php?secao_movel='+secao_movel+'&secao_alvo='+secao_alvo;
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     //alert(resposta);
		     transpoe_subarvore_recursivo("lixeira");
	   }
           oReq.send();
}


function transpoe_subarvore(secao_movel, secao_alvo){


var resposta="";
var url='../php_arvore/transpoe_subarvore.php?secao_movel='+secao_movel+'&secao_alvo='+secao_alvo;
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     //alert(resposta);
		     recarrega(document.getElementById(radio_selecionado).value, radio_selecionado);

	   }
           oReq.send();
}

function carrega_versoes_scroll(div_versoes, id_chave_secao, textarea, tecla){
elemento = document.getElementById(div_versoes);

console.log("TECLA: "+tecla);
if (tecla != "1" && tecla != "2" && tecla != "Enter" && tecla != "Tab")
{
		let id_chave_versao = 0;
		let altura_cabecalio = fonte_do_botao_de_versao * fator_fonte_versao;
		let conta_versoes=0;
		let trecho_indefinido="indefinido";
		let posicao_x = conta_versoes * (largura_do_botao_de_versao + separacao_do_botao_de_versao) + largura_do_botao_de_versao;
		let largura_blank = 20*largura_do_botao_de_versao;
		// o divs abaixo é para substituir a busca no servidor, que está deixando tudo lento... mas ainda não está pronto
		// note que a ideia de buscar no servidor era para atualizar os dados de cada seção, se outro usuário mexesse algo... mas não estava funcionando direito porque o div da seção e o textarea não estavam sendo atualizados. Nao seria dificil corrigir isso, mas o custo de ir ao servidor a cada seta é muito alto em termos de tempo de espera e preferi nao fazer essa atualizacao nas setas. a ideia é fazer essa atualizacao apenas nos box 1 e 2
		let divs_substituto="<div id='cabecalio_versoes_"+id_chave_secao+"' class='cabecalio_versoes' style='top: 1px; left:1px; width: auto; height: "+altura_cabecalio+unidade+"; font-size: "+fonte_do_botao_de_versao+unidade+"; position:absolute; display: block; text-overflow: clip; white-space: nowrap; '>Versões Disponíveis</div>"+
		
		"<div id='secao_"+id_chave_versao+"_"+conta_versoes+"' class='uma_versao' data-trecho='"+trecho_indefinido+"' style='top: "+altura_cabecalio+unidade+"; left: "+posicao_x+unidade+"; width: "+largura_do_botao_de_versao+unidade+"; height: "+altura_do_botao_de_versao+unidade+"; display: table-cell; vertical-align: middle; font-size: "+fonte_do_botao_de_versao+unidade+";' data-id-chave='"+id_chave_versao+"' onclick='document.getElementById(`"+textarea+"`).value=this.getAttribute(`data-trecho`)'>Lista de Versões</div>"+
		
		"<div id='blank_"+textarea+"' class='uma_versao' data-trecho='blank' style='top: "+altura_cabecalio+unidade+"; left: "+posicao_x+unidade+"; width: "+largura_blank+unidade+"; height: "+altura_do_botao_de_versao+unidade+"; display: table-cell; vertical-align: middle; font-size: "+fonte_do_botao_de_versao+unidade+"; visibility: hidden' >blank</div>";
		
		elemento.innerHTML = divs_substituto;
				     carrega_array_de_scroll_horizontal(elemento);
				     scroll_horizontal(elemento); 
		return;}


var resposta="";
var url='../php_arvore/devolve_divs_versoes.php?id_chave_secao='+id_chave_secao+'&largura='+largura_do_botao_de_versao+'&altura='+altura_do_botao_de_versao+'&fonte='+fonte_do_botao_de_versao+'&unidade='+unidade+'&fator_fonte='+fator_fonte_versao+'&separacao='+separacao_do_botao_de_versao+'&textarea='+textarea;
// console.log("URL: "+url+" div_versoes: "+div_versoes+" id: "+id_chave_secao+" textarea: "+textarea);
var oReq=new XMLHttpRequest();
           oReq.open("GET", url, false);
           oReq.onload = function (e) {
                     resposta=oReq.responseText;
		     elemento.innerHTML = resposta;
		     carrega_array_de_scroll_horizontal(elemento);
		     scroll_horizontal(elemento); 
	   }
           oReq.send();
}

function teclado(e) {

if (modo_edicao && e.key == "&") {alert("Cuidado com o & porque dá problema na hora de gravar no SQL. Melhor não usar."); return;}

console.log("function_teclado_acionada");
let futuro_y =0;
	//console.log("x: "+x+" y:"+y)
	//if (e.ctrlKey) {alert("control");}

	if (modo_edicao && e.key=="*" && e.ctrlKey && matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao")!="item_de_referencia") 
			{
				document.getElementById("drop_1_2").setAttribute("data-fk-tabela",matriz_ganha_foco[x][1][y].getAttribute("data-nome-tabela"));
				document.getElementById("drop_1_2").setAttribute("data-fk-campo-mostrado",matriz_ganha_foco[x][1][y].getAttribute("data-nome-campo-externo"));
				document.getElementById("janela_referencias").style.visibility="visible";
				console.log("edicao");
				console.log(document.getElementById("drop_1_2"));
				setTimeout(function () {document.getElementById("drop_1_2").focus();},1000); // tem algum truque aqui para que ganhe foco... eu chutei esse settimeout e deu certo!
				return;
			} // referencias bibliograficas

	matriz_ganha_foco[x][1][y].style.border = velha_borda_focalizada;
	console.log(matriz_ganha_foco[x][1][y]);
	document.getElementById(matriz_ganha_foco[x][0]).style.border = velha_borda_de_nivel_focalizada;

	let edita_secoes_mouse_id_secao = document.getElementById("edita_secoes_mouse_id_secao").innerText;
	if (matriz_ganha_foco[x][0].includes("nivel")) {
	    console.log(x+" * "+y);
		gemeo_atual_na_arvore = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
			if (e.key == " " && !modo_edicao) {
	
				//alert("clicou espaco 1");
				//alert("clicou espaco modo edicao 1 =" + modo_edicao);
				console.log("primeira chamada");
				futuro_y = gemeo_atual_na_arvore.getAttribute("data-y");
				
				y--;
				//if (y<0) {alert("ficou negativo");}
//				if (y < 0) {y=matriz_ganha_foco[x][1].length -1;}
				if (y < 0) {y=1;}
	    		console.log(x+" * "+y + " futuro_y "+ futuro_y);
				guarda_ultimo_visitado[x]=y;
			}

	}
	if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {
		gemeo_atual_no_nivel = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
	}

	if ((((modo_edicao == false || document.activeElement != textarea_em_edicao ) && modo_busca == false) || (modo_busca == true &&  document.activeElement != document.getElementById("palavra_de_busca"))) && document.activeElement != document.getElementById("drop_1_2")){
	console.log(e.key);
		e.preventDefault();
		e.stopPropagation();	
	}



		if (modo_busca == true && modo_edicao == false) 
			{
				if (e.key == "Enter") {modo_busca = false;  document.getElementById("botao_de_busca_palavra").click();}
				if (e.key == "Escape") {modo_busca = false; setTimeout(function () {document.getElementById("palavra_de_busca").value=""; str_palavra_de_busca=""; recarrega("raiz", "dummy_radio");}, 100)} // mostra tudo, zerando a palavra de busca 
				return;
			}	
		if (e.key == "Escape" && modo_edicao) {
			if (confirm("Tem certeza que quer sair sem gravar?")) {
			textarea_em_edicao.blur();// tira o foco do textarea
			desabilita_box("true", "edita_secoes_mouse");
			desabilita_box("true", "edita_secoes_teclado");
			modo_edicao = false;
			// ajusta_bordas_do_selecionado();
			textarea_em_edicao.value = array_scroll_horizontal[array_scroll_horizontal.length - 1].getAttribute("data-trecho"); ;
		        textarea_em_edicao.setAttribute("data-alterado","gravado");
			textarea_em_edicao.style.backgroundColor = cor_de_gravado;	
			} else {textarea_em_edicao.focus();}

		}
		if (e.key == "Enter" && modo_edicao && textarea_em_edicao == document.getElementById("textarea_mouse") && document.activeElement != document.getElementById("drop_1_2") && matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao") != "tabela") {
			
			document.getElementById("botao_nova_secao_abaixo").click();
		}


		
		if (e.key == "Tab" && modo_edicao) {
//			alert("tab");
			if (document.getElementById("botao_nova_secao_abaixo").disabled==true){
			modo_edicao = false;
			textarea_em_edicao.blur();// tira o foco do textarea 
			desabilita_box("true", "edita_secoes_mouse");
			desabilita_box("true", "edita_secoes_teclado");

//alert("oi2 " + textarea_em_edicao.value);
			if (textarea_em_edicao != null && versoes_em_edicao != null) {
				grava_trecho(textarea_em_edicao.getAttribute(`data-id-chave-secao`),  textarea_em_edicao.getAttribute(`data-id-secao`), textarea_em_edicao.value, versoes_em_edicao, textarea_em_edicao);
	
			} else {alert("Ocorreu erro XPTO.");}
			} else {alert("Você não pode gravar agora. Escolha se quer inserir a imagem acima ou abaixo da seção atual.");}
			ajusta_bordas_do_selecionado();
			return;
			
		;}
		
		if (modo_edicao == true) {return;}	
		
		if (e.key=="Home") {y=0;}
		if (e.key=="End") {y=matriz_ganha_foco[x][1].length-1;}
	
		if (e.key == "B" || e.key == "b") {
			modo_busca = true;
			document.getElementById("palavra_de_busca").focus();
			return;
		;}

		if (e.key == "1") {
		          if (matriz_ganha_foco[x][0].includes("seletor")) {alert("Para editar o Box 1 o cursor não pode estar na árvore 'Escolha do tipo de seção'.");} else {
			  if (tipos_nao_editaveis.includes(","+matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao")+",")) {alert("O tipo de seção "+matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao")+ " não é editável no Box1."); modo_edicao=false; return;}
		          if (document.getElementById("textarea_teclado").getAttribute("data-alterado")=="gravado") {     
		          modo_edicao = true;
		          textarea_em_edicao = document.getElementById("textarea_teclado");
		          versoes_em_edicao = document.getElementById("versoes_teclado");
				  console.log("carrega_versoes_scroll: apertou 1");
		          carrega_versoes_scroll("versoes_teclado",  textarea_em_edicao.getAttribute("data-id-chave-secao"), "textarea_teclado", e.key);
		          textarea_em_edicao.focus();
				  setTimeout(function () { if (matriz_ganha_foco[x][1][y].getAttribute("data-nome-tabela").length > 0) {simula_key_down_ctrl("*");}}, 500);
				  } else {alert("Selecione uma seção nas janelas de níveis antes de tentar editar!");}
				  }
				  return;
	    }

		if (e.key == "i" || e.key == "I") { // inserir nova secao do mesmo tipo da atual... a complicacao de setTimeout eh para dar a sincronizacao de simulacao de teclado
				let tipo_secao_para_inserir = matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao"); // guarda o tipo de secao onde o cursor estah agora.
				let autorizados_para_i = "paragrafo, chama_ref, citacao, imagem, legenda_imagem, grafico, legenda_grafico, tabela, legenda_tabela, item_lista_num, item_lista_nao_num, item_de_referencia, estrutura, colegiado, programa, projeto, processo";
				if (!matriz_ganha_foco[x][0].includes("nivel")){ alert("Você precisa estar numa janela de nível para inserir."); return;}
				if (!autorizados_para_i.includes(tipo_secao_para_inserir)) {alert("Você só pode usar o shortcut 'i' para os seguintes tipos de secoes: "+autorizados_para_i+"."); return;}
				setTimeout(function () {simula_key_down(" ");}, 10);
				setTimeout(function () 
					{
						simula_key_down("ArrowRight");
			            setTimeout(function () 
							{
								recursao_para_achar_tipo_na_arvore(tipo_secao_para_inserir, matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao"));
							}
							,10);
					}
				, 100);			
		return;
		} // if "I"

		if (e.key == "2") { // insercao de novo 
			if (matriz_ganha_foco[x][1][y].getAttribute("data-id-secao")== "corpo_tese") {alert("Você não pode editar a raiz (corpo_tese) do documento. A operação será interrompida e nada será feito."); return;}
			if (document.getElementById("textarea_mouse").getAttribute("data-alterado")=="gravado") {	
			modo_edicao = true;
			textarea_em_edicao = document.getElementById("textarea_mouse");
			versoes_em_edicao = document.getElementById("versoes_mouse");
			console.log("carrega_versoes_scroll: apertou 2");
			carrega_versoes_scroll("versoes_mouse",  textarea_em_edicao.getAttribute("data-id-chave-secao"), "textarea_mouse", e.key);
			textarea_em_edicao.focus();
			if (matriz_ganha_foco[x][0].includes("seletor")) {
				desabilita_box("true", "edita_secoes_mouse");
				if (matriz_ganha_foco[x][1][y].getAttribute("data-id-secao")== "imagem" || matriz_ganha_foco[x][1][y].getAttribute("data-id-secao")== "pdf") 
						{
							document.getElementById("botao_sobe_imagem").disabled = false;
						}		
				document.getElementById("botao_nova_secao_acima").disabled = false;
				document.getElementById("botao_nova_secao_abaixo").disabled = false;
				if (matriz_ganha_foco[x][1][y].getAttribute("data-primeiro-filho") != "sem_filhos_registrados") 
				{
				document.getElementById("botao_nova_secao_dentro").disabled = false;
				}
				if (matriz_ganha_foco[x][1][y].getAttribute("data-id-secao")== "mult_imagem") 
				{textarea_em_edicao.value = "Imagens Múltiplas";}
				else
				{textarea_em_edicao.value = "";}

				if (matriz_ganha_foco[x][1][y].getAttribute("data-nome-tabela").length > 0) { // tem chave externa e precisa abrir a caixa de dialogo para buscar o dado
						//alert(matriz_ganha_foco[x][1][y].getAttribute("data-nome-tabela")+" teste");
						document.getElementById("drop_1_2").setAttribute("data-fk-tabela",matriz_ganha_foco[x][1][y].getAttribute("data-nome-tabela"));
						document.getElementById("drop_1_2").setAttribute("data-fk-campo-mostrado",matriz_ganha_foco[x][1][y].getAttribute("data-nome-campo-externo"));
						document.getElementById("janela_referencias").style.visibility="visible";
						console.log("edicao");
						console.log(document.getElementById("drop_1_2"));
						setTimeout(function () {document.getElementById("drop_1_2").focus();},1000); // tem algum truque aqui para que ganhe foco... eu chutei esse settimeout e deu certo!
						return;
				}

			}
			if (tipos_nao_editaveis.includes(matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao"))) 
				{
					if (!matriz_ganha_foco[x][0].includes("seletor")) {alert("O tipo de seção "+matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao")+ " não é editável no Box2.");}
					modo_edicao=false; 
					textarea_em_edicao.blur();
					return;
				}

		
			} else {alert("Selecione uma seção nas janela 'Escolha Box 2' antes de tentar editar!");}
			return;	
		;}
		
		if (e.key == "Home") {y=0;}
		if (e.key == "PageDown") {
			let proximo2 = x + 1;
			if (proximo2 > matriz_ganha_foco.length -1) {proximo2 = 0;}
			if (matriz_ganha_foco[proximo2][0].includes("nivel")){
				let contador2=y;
				let encontrou=0;
				//console.log("encontrou: "+encontrou + " contador2: "+contador2);
				while ((encontrou <= y ) && (contador2 < matriz_ganha_foco[x][1].length -1) ) {
				let contador=0;
					while (contador <= matriz_ganha_foco[proximo2][1].length - 1){
					if (matriz_ganha_foco[proximo2][1][contador].getAttribute("data-id-pai") == matriz_ganha_foco[x][1][contador2].getAttribute("data-id-secao")){
						encontrou = contador2;
						//console.log(contador +" @ " +matriz_ganha_foco[proximo2][1][contador].getAttribute("data-id-pai")+" _-_ "+contador2 + "&" +matriz_ganha_foco[x][1][contador2].getAttribute("data-id-secao") + " encontrou: "+ encontrou);
					}	
						contador++;
					}
				contador2++;

				}
				if (contador2 <= matriz_ganha_foco[x][1].length - 1) {y=encontrou;}
			}
		;}
		//console.log("saiu");	
	
		if (e.key == "ArrowUp"	)  
			{
				y--; 
				if (y < 0) {y=matriz_ganha_foco[x][1].length -1;} 
				guarda_ultimo_visitado[x] = y;
         			if (matriz_ganha_foco[x][0].includes("flutua_para_direita") && y==parseInt(gemeo_atual_na_arvore.getAttribute("data-y"))) {y--; if (y < 0) {y=matriz_ganha_foco[x][1].length -1;}}
         			if (matriz_ganha_foco[x][0].includes("nivel") && matriz_ganha_foco[x][1][y].getAttribute("data-id-secao") == edita_secoes_mouse_id_secao ) {y--; if (y < 0) {y=matriz_ganha_foco[x][1].length -1;}}


			}
		if (e.key == "ArrowDown")  {
			y++; 
			if (y > matriz_ganha_foco[x][1].length -1) {y=0;} 
			guarda_ultimo_visitado[x] = y;
			if (matriz_ganha_foco[x][0].includes("nivel") && matriz_ganha_foco[x][1][y].getAttribute("data-id-secao") == edita_secoes_mouse_id_secao ) {y++; if (y > matriz_ganha_foco[x][1].length -1) {y=0;} if (y < 0) {y = matriz_ganha_foco[x][1].length - 1;}} // se cair em cima de uma secao selecionada por Box2, tem que baixar mais e rodar, caso o y fique fora do length 
		}
		if (e.key == "ArrowLeft")  
			{
				let vem_antes = x - 1;
				if (vem_antes<0) {vem_antes = matriz_ganha_foco.length -1;}
				if ((guarda_ultimo_visitado[vem_antes] == -1 || !matriz_ganha_foco[x][0].includes("nivel") || matriz_ganha_foco[x][0].includes("nivel_1") || e.shiftKey) && !matriz_ganha_foco[vem_antes][0].includes("flutua_para_direita")) 
				{
					do {x--;} while (guarda_ultimo_visitado[x] < 0); 
					if (x<0) {x=matriz_ganha_foco.length -1;}  
					y=guarda_ultimo_visitado[x]; 
					if (y == -2) {y=0;}
				}
				else 
				{
					//alert("retorno para o pai, dentro de um nivel");
					let conta_volta=0;
					let max_elementos_volta = matriz_ganha_foco[vem_antes][1].length; // eu acho que esse menos 1 nao deveria estar aqui e deve dar problema na ultima secao
					//console.log("max_elementos_volta: "+max_elementos_volta);
					while (conta_volta < max_elementos_volta && matriz_ganha_foco[x][1][y].getAttribute("data-id-pai") != matriz_ganha_foco[vem_antes][1][conta_volta].getAttribute("data-id-secao"))
						{
							conta_volta++;
							//console.log(conta_volta);
						}
					if (conta_volta < max_elementos_volta)  
						{
							x--; 
							y=conta_volta;
						}
					if (conta_volta >= max_elementos_volta && !matriz_ganha_foco[vem_antes][0].includes("flutua_para_direita")) 
						{ 
							alert("Nao achou o pai."); 
							y=0;
						}
					if (matriz_ganha_foco[vem_antes][0].includes("flutua_para_direita")) {
						x--;
						if (ultimo_visitado_flutua_para_direita > -1) {y = ultimo_visitado_flutua_para_direita;} else {y=0;}
					}
					if (x<0) {x=matriz_ganha_foco.length -1;} 					

				}
			} 
// -2 significa "nao foi visitado ainda"
// -1 signfica "nao tem filhos da secao do nivel superior selecionada, que no caso de ir para a esquerda significa subir de nivel ateh o nivel selecionado"
		if (e.key == "ArrowRight") 
			{
				let x_anterior = x;
				let y_anterior = y;
				let anterior = matriz_ganha_foco[x][1][y];
				let proximo = x + 1;
				if (proximo > matriz_ganha_foco.length -1) {proximo = 0;}
				if (!matriz_ganha_foco[proximo][0].includes("nivel") || matriz_ganha_foco[proximo][0].includes("nivel_1"))
					{ 
						// este if ocorre quando nao nivel, ou se eh nivel e o pai eh corpo_tese. O resultado eh ir para direita nos blocos de niveis (se for nivel 1) ou nas arvores. se for nivel 2 ou 3 eh outro tratamento
						{
							x++; 
							if(x > matriz_ganha_foco.length - 1) {x=0;}  
							y = guarda_ultimo_visitado[x]; 
							if (y == -2) {y=0;} // y negativo sao flags... y positivos sao posicoes y
						}
					}
				else {

				let conta=0;
				let max_elementos = matriz_ganha_foco[proximo][1].length; // eu acho que esse menos 1 nao deveria estar aqui e deve dar problema na ultima secao
				//console.log("max_elementos: "+max_elementos);
				while (conta < max_elementos && matriz_ganha_foco[proximo][1][conta].getAttribute("data-id-pai") != anterior.getAttribute("data-id-secao"))
					{
						conta++;
						//console.log(conta);
					}
				if (conta < max_elementos ) {x++; y=conta;} 
				else {

					//guarda_ultimo_visitado[x] = y;
					while (matriz_ganha_foco[x][0].includes("nivel")) 
						{
							let proximo3 = x + 1;
							if (proximo3 > matriz_ganha_foco.length -1) {proximo3 = 0;}
							if (matriz_ganha_foco[proximo3][0].includes("nivel")) {guarda_ultimo_visitado[proximo3] = -1;} else {y=guarda_ultimo_visitado[proximo3];if (y == -2) {y=0;} }
							x++;
							if (x > matriz_ganha_foco.length - 1) { x=0;} 
						}
				}
				}	
			 		if (e.shiftKey) {y=guarda_ultimo_visitado[x]; if (y == -2) {y = 0;} } // se estiver apertando shift vai para ultimo visitado ao inves de ir para o primeiro filho do atual.	
					if (matriz_ganha_foco[x][0].includes("flutua_para_direita") && !e.shiftKey) { y=parseInt(gemeo_atual_na_arvore.getAttribute("data-y")); } 
					if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {guarda_ultimo_visitado[x_anterior] = y_anterior;}
			} // fim if ArrowRight
	
       		if (x > matriz_ganha_foco.length - 1) { x=0;} // estes ifs estavam depois dos 4 abaixo, mas parece mais lógico que fiquem aqui 
		if (x < 0) { x=matriz_ganha_foco.length -1;}
//			console.log("lula1 "+  matriz_ganha_foco[x][1][y].getAttribute("data-id-secao"));
	        if (matriz_ganha_foco[x][0].includes("flutua_para_direita") && y==parseInt(gemeo_atual_na_arvore.getAttribute("data-y")) && e.key != " ") {y++; if (y > matriz_ganha_foco[x][1].length -1) {y=0;};gemeo_atual_no_nivel = matriz_ganha_foco[x][1][y]; } // evita colocar no Box 2 algo que jah esta no BOX 1
//			console.log("lula2 "+  matriz_ganha_foco[x][1][y].getAttribute("data-id-secao"));
			if (y>matriz_ganha_foco[x][1].length - 1){
				y=matriz_ganha_foco[x][1].length - 1;
			}
			// evita erro se tiver 1 soh no nivel
			if (matriz_ganha_foco[x][0].includes("nivel") && matriz_ganha_foco[x][1][y].getAttribute("data-id-secao") == edita_secoes_mouse_id_secao ) {y--; if (y > matriz_ganha_foco[x][1].length -1) {y=0;} if (y < 0) {y = matriz_ganha_foco[x][1].length - 1;}} // evita o contrario. note que precisa tambem cuidar do caso do ArrowDown, porque nesse caso, este if faz voltar para cima e nao desce nunca mais... entao no ArrowDown, se perceber que vai cair na secao selecionada pelo Box2, tem que pular para baixo
// a partir daqui jah decidiu qual eh o valor de x e y

		if (matriz_ganha_foco[x][0].includes("nivel")) {
			gemeo_atual_na_arvore = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
		}
		if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {
			//console.log(x + " - " + y);

			gemeo_atual_no_nivel = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
			//console.log(gemeo_atual_no_nivel);			
			velho_gemeo_no_nivel.style.opacity = "1.0";
			if (gemeo_atual_no_nivel != null) {gemeo_atual_no_nivel.style.opacity = "0.3";velho_gemeo_no_nivel = gemeo_atual_no_nivel;} // existe uma situacao para flutua_para_direita em que dah null, quando escolhe raiz
			
			
		}
	
//		console.log("antes"  + x + " - " + matriz_ganha_foco[x][0] + " -> "+ matriz_ganha_foco[x][1][y].id + document.getElementById(matriz_ganha_foco[x][1][y].id).innerHTML );

		ajusta_bordas_do_selecionado();
	
		if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {ultimo_visitado_flutua_para_direita = y;}


		if (!matriz_ganha_foco[x][0].includes("seletor")) 
			{
				if (matriz_ganha_foco[x][0].includes("nivel")) {
					if (matriz_ganha_foco[x][1][y].getAttribute("data-id-pai") != ""){ // se a visualização é de "raiz", selecionada na janela de tipos_de_secoes, entao data-id-pai eh ""
					restringe_tipos_que_ganham_foco(document.getElementById("secao_"+matriz_ganha_foco[x][1][y].getAttribute("data-id-pai")).getAttribute("data-nome-tipo-secao"));
					}
				}
				if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {
					if (matriz_ganha_foco[x][1][y].getAttribute("data-id-pai") != ""){
					restringe_tipos_que_ganham_foco(document.getElementById("folha_arvore_"+matriz_ganha_foco[x][1][y].getAttribute("data-id-pai")).getAttribute("data-nome-tipo-secao"));
					}
				}
			}
		velho_focado = matriz_ganha_foco[x][1][y];
		let paizao = document.getElementById(matriz_ganha_foco[x][0]);

			if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {scroll_arvore_especial(paizao,matriz_ganha_foco[x][1][y]);}  // nao precisava desta complicacao de 2 ifs
			if (matriz_ganha_foco[x][0].includes("seletor")) {scroll_arvore_especial(paizao,matriz_ganha_foco[x][1][y]);}

		//		document.getElementById(matriz_ganha_foco[x][0]).focus();

		let textarea_teclado = document.getElementById("textarea_teclado");
		let botao_lixeira_teclado = document.getElementById("botao_lixeira_teclado");
		let id_secao_teclado = document.getElementById("edita_secoes_teclado_id_secao");
		let id_pai_teclado = document.getElementById("edita_secoes_teclado_id_pai");
		//		let data_teclado = document.getElementById("edita_secoes_teclado_data");

		let textarea_mouse = document.getElementById("textarea_mouse");
		let botao_lixeira_mouse = document.getElementById("botao_lixeira_mouse");
		let id_secao_mouse = document.getElementById("edita_secoes_mouse_id_secao");
		let id_pai_mouse = document.getElementById("edita_secoes_mouse_id_pai");
		//		let data_mouse = document.getElementById("edita_secoes_mouse_data");

		if (matriz_ganha_foco[x][0].includes("nivel")){
			id_secao_teclado.innerHTML = matriz_ganha_foco[x][1][y].getAttribute("data-id-secao");
			id_pai_teclado.innerHTML = matriz_ganha_foco[x][1][y].getAttribute("data-id-pai");
			//			data_teclado.innerHTML = matriz_ganha_foco[x][1][y].getAttribute("data-version-date").split(".")[0];
			textarea_teclado.value = matriz_ganha_foco[x][1][y].getAttribute("data-titulo").replace(/(?:\\[rn]|[\r\n]+)+/g,'\r\n'); // necessario para fazer mostrar new line no caso de tabela
//			if (matriz_ganha_foco[x][1][y].getAttribute("data-nome-tipo-secao") == "tabela"){alert("value -> "+textarea_teclado.value);};
			if (matriz_ganha_foco[x][1][y].getAttribute("data-da-lixeira") == "nao" && tipo_secao_selecionado_no_check!='raiz') {botao_lixeira_teclado.disabled = false;} else {botao_lixeira_teclado.disabled = true;}
			textarea_teclado.setAttribute("data-alterado","gravado"); // indica que o dado apresentado eh o que estah na base de dados
			//console.log("estou passando por aqui -> "+ textarea_teclado.id + " data-titulo -> " +  matriz_ganha_foco[x][1][y].getAttribute("data-titulo"));
			textarea_teclado.setAttribute("data-id-chave-secao", matriz_ganha_foco[x][1][y].getAttribute("data-id-chave"));
			textarea_teclado.setAttribute("data-id-secao", matriz_ganha_foco[x][1][y].getAttribute("data-id-secao"));
			console.log("carrega_versoes_scroll: ganhou foco nivel");
			carrega_versoes_scroll("versoes_teclado",  matriz_ganha_foco[x][1][y].getAttribute("data-id-chave"), "textarea_teclado", e.key);
		}
		if (matriz_ganha_foco[x][0].includes("flutua_para_direita")){
			id_secao_mouse.innerHTML = matriz_ganha_foco[x][1][y].getAttribute("data-id-secao");
			id_pai_mouse.innerHTML = matriz_ganha_foco[x][1][y].getAttribute("data-id-pai");
			//			data_mouse.innerHTML = matriz_ganha_foco[x][1][y].getAttribute("data-version-date").split(".")[0];
			textarea_mouse.value = matriz_ganha_foco[x][1][y].getAttribute("data-titulo");
			if (matriz_ganha_foco[x][1][y].getAttribute("data-da-lixeira") == "nao" && tipo_secao_selecionado_no_check!='raiz') {botao_lixeira_mouse.disabled = false;} else {botao_lixeira_mouse.disabled = true;}
			textarea_mouse.setAttribute("data-alterado","gravado");
			textarea_mouse.setAttribute("data-id-chave-secao", matriz_ganha_foco[x][1][y].getAttribute("data-id-chave"));
			textarea_mouse.setAttribute("data-id-secao", matriz_ganha_foco[x][1][y].getAttribute("data-id-secao"));
			console.log("carrega_versoes_scroll: ganhou foco flutua direita");
			carrega_versoes_scroll("versoes_mouse",  matriz_ganha_foco[x][1][y].getAttribute("data-id-chave"), "textarea_mouse", e.key);
		}
	if (matriz_ganha_foco[x][0].includes("nivel")) {
		gemeo_atual_na_arvore = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
		if (y>=0) {gemeo_atual_no_nivel = matriz_ganha_foco[x][1][y];}
		else {
			if (y<1 && y < matriz_ganha_foco[x][1].length -1) {gemeo_atual_no_nivel = matriz_ganha_foco[x][1][y - 1];} // muitos anos depois percebo que esse y<1 estah inutil. aqui soh entra se y for negativo. 
			else {gemeo_atual_no_nivel = null;}
		}
			
		if (e.key == " " && !modo_edicao) {
				// alert("clicou espaco 2");
				// alert("clicou espaco modo edicao 2 =" + modo_edicao);
				console.log("segunda chamada");
				console.log("lula0 " + matriz_ganha_foco[x][1][y].id);
				matriz_ganha_foco[x][1][y].style.border = velha_borda_focalizada;
				document.getElementById(matriz_ganha_foco[x][0]).style.border = velha_borda_de_nivel_focalizada;
				y = futuro_y;
				x = matriz_ganha_foco.length -2; // -2 eh a flutua_para_direita. Por que? pela ordem de criacao
				teclado(e); 
			}

	}

if (matriz_ganha_foco[x][1][y].style.display == "none") // este if eh para a situacao em que todos os filhos de um estrutura estao escondidos, para evitar um loop infinito quando aperta alguma seta 
{

	if (x==0 && y==0) {
		simula_key_down("ArrowDown");
	}

//	if (e.key.includes("ArrowLeft")) {
//		x = 0;
//		y = 0;
//		toggle_achei_secao_escondida = false;
//		primeira_secao_escondida = "";	
//		simula_key_down("Escape");
//	}
	
//	if (toggle_achei_secao_escondida && matriz_ganha_foco[x][1][y].id == primeira_secao_escondida) {
//		simula_key_down("ArrowRight");
//	}
	
	if (!toggle_achei_secao_escondida) {primeira_secao_escondida = matriz_ganha_foco[x][1][y].id;}
	toggle_achei_secao_escondida = true;

	if (e.key.includes("Arrow")) 
		{
			if (e.key.includes("Down") || e.key.includes("Up")) {teclado(e);}
			else {
				simula_key_down("ArrowDown");
			}
		};
}
else {

	toggle_achei_secao_escondida = false;
	primeira_secao_escondida = "";	
}

} // fim teclado



function inicializa_teclado(){

document.body.addEventListener("keydown", teclado);

}	



function inicializa_folhas_de_trechos(){

const arvore_com_trechos = document.getElementsByClassName("contem_trechos");
for (let i = 0; i < arvore_com_trechos.length; i++) {

arvore_com_trechos[i].addEventListener("mouseout", 
	function ()
	{
		var that = this.id;
		setTimeout(function () {
			if (id_da_folha_onde_esta_flutuando == that){
			var hint = document.getElementById("hint_trechos");
			hint.style.visibility="hidden";}
			},1000);
			
	}
);

arvore_com_trechos[i].addEventListener("mouseover", 
	function ()
	{
		var hint = document.getElementById("hint_trechos");
//		var id_secao_mouse = document.getElementById("edita_secoes_mouse_id_secao");
//		var id_pai_mouse = document.getElementById("edita_secoes_mouse_id_pai");
//		var textarea_mouse = document.getElementById("textarea_mouse");

		id_da_folha_onde_esta_flutuando = this.id;
		
if (arvore_com_trechos[i].classList.contains("pode_mostrar_trechos"))	{hint.innerHTML="<b>id("+arvore_com_trechos[i].getAttribute("data-id-chave")+") "+arvore_com_trechos[i].getAttribute("data-version-date")+"</b><br>versoes:"+arvore_com_trechos[i].getAttribute("data-conta-versoes")+"<br><b>"+arvore_com_trechos[i].getAttribute("data-id-secao")+"</b><br>" + arvore_com_trechos[i].getAttribute("data-titulo");}
else {hint.innerHTML="<b>("+arvore_com_trechos[i].getAttribute("data-id-chave")+") "+arvore_com_trechos[i].getAttribute("data-version-date")+"</b><br>versoes:"+arvore_com_trechos[i].getAttribute("data-conta-versoes")+"<br><b>"+arvore_com_trechos[i].getAttribute("data-id-secao")+"</b><br>"+arvore_com_trechos[i].getAttribute("data-nome-tipo-secao");}
//		id_secao_mouse.innerHTML="<b>"+arvore_com_trechos[i].getAttribute("data-id-secao")+"</b>";
//		id_pai_mouse.innerHTML=arvore_com_trechos[i].getAttribute("data-id-pai");

//		textarea_mouse.innerHTML = arvore_com_trechos[i].getAttribute("data-titulo");
		hint.style.maxHeight=document.body.offsetHeight * 0.2 + "px"
		hint.style.maxWidth=document.body.offsetWidth * 0.2 + "px"
		hint.style.top=parseInt(this.getBoundingClientRect().top) - parseInt(hint.clientHeight) + "px";
		hint.style.left=parseInt(this.getBoundingClientRect().left) - parseInt(hint.clientWidth) + "px";
	
		hint.style.visibility="visible";
		//console.log(this.getBoundingClientRect().top + ' - ' +hint.clientHeight);
	});

}
} // fim inicializa_folhas_de_trechos


function percorre_arvore_trechos(mostra_trechos){

const arvore_com_trechos = document.getElementsByClassName("pode_mostrar_trechos");
for (let i = 0; i < arvore_com_trechos.length; i++) {
	     if (mostra_trechos) {
		arvore_com_trechos[i].innerHTML=arvore_com_trechos[i].getAttribute("data-titulo");
	     } else
	     {
	arvore_com_trechos[i].innerHTML=arvore_com_trechos[i].getAttribute("data-id-secao");

	     }
	}

} // fim percorre_arvore_trechos

function ajusta_scroll(){
const collection3 = document.getElementsByClassName("nivel");
for (let i = 0; i < collection3.length; i++) {
	collection3[i].scrollTop=document.getElementById("blank_"+collection3[i].getAttribute("data-nivel")+"_top").style.height.replace('px','');
}

}

function limpa_pais (nivel) {
const collection = document.getElementsByClassName("pai");
for (let i = 0; i < collection.length; i++) {
  if (collection[i].getAttribute("data-nivel") > nivel) { collection[i].style.opacity = baixa_opacidade;} else { collection[i].style.opacity = "1.0";};
}

}

function reduz_arvore(id_arvore, fator){
document.getElementById(id_arvore).style.width = document.getElementById(id_arvore).clientWidth * fator +"px" ;
const filhos = document.getElementById(id_arvore).children;

for (let m=0; m < filhos.length ; m++){
	//console.log(filhos[m].id);
	
	filhos[m].style.width = filhos[m].clientWidth * fator + "px";
	filhos[m].style.height = filhos[m].clientheight * fator + "px";
	filhos[m].style.left = filhos[m].style.left.replace("px","") * fator + "px";
	if (m==0) {
		filhos[m].style.top = filhos[m].style.top.replace("px","") * fator + "px";
	} else
	{
		filhos[m].style.top = parseInt(filhos[m - 1].style.top.replace("px","")) + filhos[m-1].clientHeight + padding_folha + "px";
	
	}


	if (filhos[m].children.length == 0) {
	filhos[m].style.fontSize = filhos[m].clientHeight *0.8 * fator + "px";

	}
	if (filhos[m].children.length == 1) {
	filhos[m].children[0].style.fontSize = filhos[m].clientHeight *0.8 * fator + "px";
	} 
	if (filhos[m].children.length == 2) {
	filhos[m].children[0].style.transform = "scale(" + fator*2 +  ")";
	filhos[m].children[0].style.padding = 4 * fator +  "px";
	filhos[m].children[1].style.fontSize = filhos[m].clientHeight *0.8 * fator + "px";
	} 


	
}


} // reduz_arvore()

function posiciona_janela_referencias(){


document.getElementById("janela_referencias").style.left = (document.body.offsetWidth * 0.1) + "px";
document.getElementById("janela_referencias").style.top = parseInt(document.getElementById("menu_principal").getBoundingClientRect().bottom + (document.body.offsetHeight - document.getElementById("menu_principal").getBoundingClientRect().bottom) * 0.1)  + "px";

document.getElementById("janela_referencias").style.width = (document.getElementById("edita_secoes_mouse").style.left.replace("px","")* 0.9 - parseInt(document.body.offsetWidth * 0.1)) + "px";
document.getElementById("janela_referencias").style.height = (document.body.offsetHeight * 0.9 - parseInt(document.getElementById("menu_principal").getBoundingClientRect().bottom + (document.body.offsetHeight - document.getElementById("menu_principal").getBoundingClientRect().bottom) * 0.1)) + "px";


//alert(document.getElementById("janela_referencias").style.height);

;

} // fim posiciona_janela_referencias

function posiciona_edicao(max_dir, min_esq) {

let menu_princ = document.getElementById("menu_principal").clientHeight;
document.getElementById("edita_secoes_mouse").style.left = max_dir + padding_de_screen + "px";
document.getElementById("edita_secoes_mouse").style.width = (min_esq - max_dir - 2*padding_de_screen) + "px";
document.getElementById("edita_secoes_mouse").style.top = menu_princ +  (document.body.offsetHeight - menu_princ)/2  + padding_de_screen + "px";
document.getElementById("edita_secoes_mouse").style.height = (document.body.offsetHeight - menu_princ)/2 - 2*padding_de_screen + "px";

document.getElementById("edita_secoes_teclado").style.left = max_dir + padding_de_screen + "px";
document.getElementById("edita_secoes_teclado").style.width = (min_esq - max_dir - 2*padding_de_screen) + "px";
document.getElementById("edita_secoes_teclado").style.top = menu_princ + padding_de_screen + "px";
document.getElementById("edita_secoes_teclado").style.height = (document.body.offsetHeight - menu_princ)/2 - 2*padding_de_screen + "px";
posiciona_janela_referencias();

}


function calcula_correcao_dos_niveis(max_dir, min_esq, excedente_percentual){
	
	
	let largura_disponivel = Math.floor((min_esq - (minima_largura_percentual_da_edicao+excedente_percentual) * document.body.offsetWidth) / (quantidade_total_de_niveis * 2 -1));

	let r;

 	largura_niveis_array[0] = 0;
	for (r = 0; r < quantidade_total_de_niveis; r++){
	    
		if (quantidade_total_de_niveis == 3) {if (r == 0) {largura_niveis_array[r+1] = largura_disponivel;} else {largura_niveis_array[r+1] = largura_disponivel * 2;}}
		if (quantidade_total_de_niveis == 4) {largura_niveis_array[r+1] = (largura_disponivel + 3 * largura_disponivel *2)/4;}	
	}

	recarrega(tipo_secao_selecionado_no_check,  radio_selecionado);

	
	
} // fim calcula_correcao_dos_niveis




function acha_dir_max_min_esq_niveis(){


//console.log("TENTATIVA "+conta_tentativas_de_ajuste_de_tela);

const colecao_niveis = document.getElementsByClassName("nivel");
	for (let i = 0; i < colecao_niveis.length; i++) {
		if (max_dir < colecao_niveis[i].getBoundingClientRect().right) { max_dir = colecao_niveis[i].getBoundingClientRect().right;} 
	}

min_esq = document.getElementById("seletor").style.left.replace("px","");

if (min_esq > document.getElementById("flutua_para_direita").style.left.replace("px","")) {
	min_esq = document.getElementById("flutua_para_direita").style.left.replace("px",""); 
}


let largura_de_edicao = min_esq - max_dir;

if (largura_de_edicao < minima_largura_percentual_da_edicao * document.body.offsetWidth ) 
	{
		if (conta_tentativas_de_ajuste_de_tela > 1) { // este if nunca eh true porque na segunda tentativa o contador eh zerado porque eh feita uma chamada de location.reload
			alert('A tela é muito pequena para conseguir uma configuração ótima. Teremos que trabalhar desse jeito!');
		}
		if (conta_tentativas_de_ajuste_de_tela == 0 && fator_de_reducao_da_largura_da_arvore == 1)
		{
			fator_de_reducao_da_largura_da_arvore = 0.7;
			reduz_arvore("flutua_para_direita",fator_de_reducao_da_largura_da_arvore);
			reduz_arvore("seletor",fator_de_reducao_da_largura_da_arvore);
			flutua_para_direita("flutua_para_direita");
			flutua_para_direita("seletor");
			conta_tentativas_de_ajuste_de_tela++;	
			acha_dir_max_min_esq_niveis(); // atencao! recursao! eu sou foda
		}
		if (conta_tentativas_de_ajuste_de_tela == 1 || (conta_tentativas_de_ajuste_de_tela ==0 && fator_de_reducao_da_largura_da_arvore != 1))
		{
			conta_tentativas_de_ajuste_de_tela++;	
			calcula_correcao_dos_niveis(max_dir, min_esq, 0.025);			
		}
	}

if (largura_de_edicao > (minima_largura_percentual_da_edicao + 0.05 )* document.body.offsetWidth ) {
	calcula_correcao_dos_niveis(max_dir, min_esq, 0.025);		
}
 
 posiciona_edicao(max_dir, min_esq);


}

function restringe_tipos_que_ganham_foco(tipo_pai){ // para a arvore de tipos, apenas os filhos do tipo que foi selecionado na arvore de secoes devem ser percorriveis

	let i;
	let indice_seletor = matriz_ganha_foco.length - 1; // descobre qual eh a arvore de tipos, que é sempre a última... por que? pela ordem de criacao das arvores... arvore_tipos eh a ultima criada pelo PHP 
	guarda_ultimo_visitado[indice_seletor]=-2; // ainda nao foi visitado
	matriz_ganha_foco[indice_seletor][1].length = 0;
	if (!matriz_ganha_foco[indice_seletor][0].includes("seletor")) {alert("Erro 12312: não foi possível encontrar a janela de seleção de tipos"); return;}
	let arvore_tipos_de_secoes = document.getElementsByClassName("arvore_de_tipos");
	//console.log(indice_seletor + " - "+tipo_pai);
	for (i=0; i < arvore_tipos_de_secoes.length; i++){
		if (arvore_tipos_de_secoes[i].getAttribute("data-id-pai") == tipo_pai || arvore_tipos_de_secoes[i].getAttribute("data-id-secao") == tipo_pai){
			matriz_ganha_foco[indice_seletor][1].push(arvore_tipos_de_secoes[i]);
			if ( i < arvore_tipos_de_secoes.length -1 && (arvore_tipos_de_secoes[i+1].getAttribute("data-id-pai") == arvore_tipos_de_secoes[i].getAttribute("data-id-secao") || arvore_tipos_de_secoes[i].getAttribute("data-id-secao") == tipo_pai)) {
				arvore_tipos_de_secoes[i].setAttribute("data-primeiro-filho", arvore_tipos_de_secoes[i+1].getAttribute("data-id-secao"));
			}
			//console.log(matriz_ganha_foco[indice_seletor][1]);
			
		}

	}		
	
}

function acha_divs_que_ganham_foco(){
// guarda_ultimo_visitado = -2 -> significa que ainda nao foi visitado
// guarda_ultimo_visitado = -1 -> significa que nao tem filhos do nivel pai
// guarda_ultimo_visitado > -1 -> eh o ultimo visitado

guarda_ultimo_visitado.length = 0;
const colecao_ganha_foco = document.getElementsByClassName("ganha_foco");
	for (let i = 0; i < colecao_ganha_foco.length; i++) {
	guarda_ultimo_visitado.push(-2);
	
		var dupla_ganha_foco_e_filhos=[];
		dupla_ganha_foco_e_filhos.push(colecao_ganha_foco[i].id);
			const colecao_sub_ganha_foco = colecao_ganha_foco[i].getElementsByTagName("*");
			var matriz_sub_ganha_foco=[];
			let contador = 0;
			for (let j = 0; j < colecao_sub_ganha_foco.length; j++) {
				if (colecao_sub_ganha_foco[j].classList.contains("sub_ganha_foco")){
					matriz_sub_ganha_foco.push(colecao_sub_ganha_foco[j]);
					if (colecao_sub_ganha_foco[j].classList.contains("secao")) {matriz_sub_ganha_foco[matriz_sub_ganha_foco.length - 1].setAttribute("data-y",contador); contador++;}; // na arvore de secoes o data-y pode ser definido no momento do carregamento. Na arvore de niveis tem que ser pela ordem de criacao dos elementos
				}
			}
		dupla_ganha_foco_e_filhos.push(matriz_sub_ganha_foco);
		matriz_ganha_foco.push(dupla_ganha_foco_e_filhos);
	}


}

function scroll_arvore_especial(moldura_da_arvore, folha_da_arvore){
//alert("scroll_arvore_especial"); libere este alert para saber qual DIV do DOM estah chamando este scroll
let cabecalio = document.getElementById("cabecalio_seletor").clientHeight;

var itz = parseInt(folha_da_arvore.style.top.replace("px","")) + folha_da_arvore.clientHeight;

var itz2 =  moldura_da_arvore.clientHeight; 

var itz3 = parseInt(folha_da_arvore.style.top.replace("px",""));


//console.log("especiali itz: "+itz+" - itz2: "+ itz2);

if (itz3 - (moldura_da_arvore.scrollTop + cabecalio) < 0) {
	moldura_da_arvore.scrollTop = moldura_da_arvore.scrollTop + (itz3 - moldura_da_arvore.scrollTop - cabecalio);
	
}

if ( (itz - moldura_da_arvore.scrollTop)> (itz2 - folha_da_arvore.clientHeight)) {
	//console.log("itz2 "+itz2+ "folha_da_arvore: "+folha_da_arvore.clientHeight + " bateu embaixo" + (itz2 - folha_da_arvore.clientHeight));

moldura_da_arvore.scrollTop = itz - (itz2 - folha_da_arvore.clientHeight);

}

	
} // fim scroll_arvore_especial

function scroll_nivel(moldura_nivel, secao){
//console.log("scroll_nivel "+moldura_nivel.id + " secao:" + secao.id ); //libere este alerta para saber qual nivel estah chamando este scroll

//console.log("scroll_nivel ",secao," moldura: ",moldura_nivel);

//let cabecalio =  secao.getBoundingClientRect().height;  chama cabecalio porque representa um "ajuste" na posicao para tentar nao deixar a secao muito colada no topo da DIV quando scroll para cima, e por acaso height da secao funciona em alguns casos, mas nao quando a secao eh muito comprida
let cabecalio = secao.parentElement.children[0].getBoundingClientRect().height; // esta escolha de cabecalio eh bem melhor, porque escolhe a altura do div class=titulo, que eh bem mais controlada

//console.log(cabecalio + " - "+ secao.getBoundingClientRect().top + "quem eh: "+secao.parentElement.id);
var bottom_da_secao = secao.getBoundingClientRect().bottom;

//var altura_da_moldura =  moldura_nivel.clientHeight; 

var top_da_secao = parseInt(secao.getBoundingClientRect().top);

var top_da_moldura = moldura_nivel.getBoundingClientRect().top;

var bottom_da_moldura = moldura_nivel.getBoundingClientRect().bottom;

//console.log("especiali bottom_da_secao: "+bottom_da_secao+" - altura_da_moldura: "+ altura_da_moldura);

if (top_da_secao - (top_da_moldura) < 0) {
	moldura_nivel.scrollTop = moldura_nivel.scrollTop + (top_da_secao - top_da_moldura - cabecalio);
	
}

if ( (bottom_da_secao)> (bottom_da_moldura)) {

moldura_nivel.scrollTop = moldura_nivel.scrollTop + (bottom_da_secao - bottom_da_moldura + cabecalio);

}

	
} // fim scroll_nivel


function scroll_arvore(moldura_da_arvore, folha_da_arvore){
//	div_moldura_arvore.scrollTop = gemeu.getBoundingClientRect().top + div_moldura_arvore.scrollTop - div_moldura_arvore.getBoundingClientRect().top;
//
//console.log("simples: ",moldura_da_arvore.id, folha_da_arvore.id);
if (folha_da_arvore.getBoundingClientRect().bottom > moldura_da_arvore.getBoundingClientRect().bottom) {
	//console.log("bateu embaixo");
	moldura_da_arvore.scrollTop = moldura_da_arvore.scrollTop + (folha_da_arvore.getBoundingClientRect().bottom - moldura_da_arvore.getBoundingClientRect().bottom + 6 * folha_da_arvore.getBoundingClientRect().height);
}

if (folha_da_arvore.getBoundingClientRect().top < moldura_da_arvore.getBoundingClientRect().top) {
	//console.log("bateu em cima");
	moldura_da_arvore.scrollTop = moldura_da_arvore.scrollTop - (- folha_da_arvore.getBoundingClientRect().top + moldura_da_arvore.getBoundingClientRect().top + 6 * folha_da_arvore.getBoundingClientRect().height);
}
	
}


/**
 * Simulate a key event.
 * @param {Number} keyCode The keyCode of the key to simulate
 * @param {String} type (optional) The type of event : down, up or press. The default is down
 * @param {Object} modifiers (optional) An object which contains modifiers keys { ctrlKey: true, altKey: false, ...}
 * Fonte: https://gist.github.com/GlauberF/d8278ce3aa592389e6e3d4e758e6a0c2#file-keyeventsimulator-js
 */
function simulateKey (keyCode, type, modifiers) {
	var evtName = (typeof(type) === "string") ? "key" + type : "keydown";	
	var modifier = (typeof(modifiers) === "object") ? modifier : {};

	var event = document.createEvent("HTMLEvents");
	event.initEvent(evtName, true, false);
	event.keyCode = keyCode;
	
	for (var i in modifiers) {
		event[i] = modifiers[i];
	}

	document.dispatchEvent(event);
}

// Setup some tests



//function simulateKey(view, keyCode, key) {
//  let event = document.createEvent("Event")
//  event.initEvent("keydown", true, true)
//  event.keyCode = keyCode
//  event.key = event.code = key
//  return view.someProp("handleKeyDown", f => f(view, event))
//}



function simula_key_down(caracter){

document.body.dispatchEvent(
  new KeyboardEvent("keydown", {
    key: caracter,
    keyCode: caracter.charCodeAt(0), // example values.
    code: "Key"+caracter, // put everything you need in this object.
    which: caracter.charCodeAt(0),
    shiftKey: false, // you don't need to include values
    ctrlKey: false,  // if you aren't going to use them.
    metaKey: false   // these are here for example's sake.
  })
);

}

function simula_key_down_ctrl(caracter){

document.body.dispatchEvent(
  new KeyboardEvent("keydown", {
    key: caracter,
    keyCode: caracter.charCodeAt(0), // example values.
    code: "Key"+caracter, // put everything you need in this object.
    which: caracter.charCodeAt(0),
    shiftKey: false, // you don't need to include values
    ctrlKey: true,  // if you aren't going to use them.
    metaKey: false   // these are here for example's sake.
  })
);

}

function altura_scroll(){
// Creating invisible container
  const outer = document.createElement('div');
  outer.style.visibility = 'hidden';
  outer.style.overflow = 'scroll'; // forcing scrollbar to appear
  outer.style.msOverflowStyle = 'scrollbar'; // needed for WinJS apps
  document.body.appendChild(outer);

  // Creating inner element and placing it in the container
  const inner = document.createElement('div');
  outer.appendChild(inner);

  // Calculating difference between container's full width and the child width
  const scrollbarWidth = (outer.offsetWidth - inner.offsetWidth);

  // Removing temporary elements from the DOM
  outer.parentNode.removeChild(outer);

  return scrollbarWidth;
}

function refaz_tamanho_edita_secoes(div_edita_secoes, div_edita_secoes_2){
	let div = document.getElementById(div_edita_secoes);   // box1
	let div2 = document.getElementById(div_edita_secoes_2);// box2
//console.log(div);
//console.log(div2);
//console.log(div.children[0]);
//console.log(div2.children[0]);



cabecalio = div.children[0];   // cabecalio do box1
cabecalio2 = div2.children[0];  // cabecalio do box2 que pode nao existir na primeira rodada, porque o box2 soh tera versao depois que o cursor for no flutua_para_direita

	 cabecalio.style.fontSize = Math.round(div.clientHeight * 0.05) + "px"; // muda tamanho da fonte de Box 1
	cabecalio2.style.fontSize = Math.round(div.clientHeight * 0.05) + "px"; // muda o tamanho da fonte de Box2

//console.log(div.children[0].children[1]);  // tecle 1
//console.log(div2.children[0].children[0]); // tecle 2

      div.children[0].children[1].style.fontSize = Math.round(div.clientHeight * 0.05/2) + "px";// muda o tamanho da fonte de tecle 1  
      div2.children[0].children[0].style.fontSize = Math.round(div2.clientHeight * 0.05/2) + "px";// muda o tamanho da fonte de tecle 2  


const inputs = div.children[2].getElementsByTagName("input"); // prove um array com todos os botoes de box 1
// console.log(inputs);

let font_type_button = 0.02; // define o tamanho da fonte dos botoes que estao dentro do box 1 e do box 2
let font_dos_tds = 0.025;

let fonte_do_botao_grava_etc = Math.round(div.clientHeight * font_type_button);


let i;
let altura_div = div.children[2].children[0].children[0].children[1].children[0].children[0].children[0].offsetHeight; // esse aqui eh o cabecalio que nao existe para Box2 na primeira rodada
for (i = 0; i < inputs.length; i++){
	inputs[i].style.fontSize = Math.round(div.clientHeight * font_type_button) + "px"; // muda tamanho dos botoes de box 1
}
 // basta pegar o ultimo do loop


const inputs2 = div2.children[2].getElementsByTagName("input"); // prove um array com todos os botoes de box 2
//console.log(inputs2);
for (i = 0; i < inputs2.length; i++){
	inputs2[i].style.fontSize = Math.round(div.clientHeight * font_type_button) + "px";
 
}

let tds_primeira_1 = div.children[1].children[0].children[0].getElementsByTagName("td"); // tds da primeira tabela, box 1
for (i = 0; i < tds_primeira_1.length; i++){
	tds_primeira_1[i].style.fontSize = Math.round(div.clientHeight * font_dos_tds) + "px"; // muda a fonte de todos os tds da primeira table do box 1
}

let tds_primeira_2 = div2.children[1].children[0].children[0].getElementsByTagName("td"); // tds da primeira tabela, box 2
for (i = 0; i < tds_primeira_2.length; i++){
	tds_primeira_2[i].style.fontSize = Math.round(div2.clientHeight * font_dos_tds) + "px"; // muda a fonte de todos os tds da primeira table do box 2
}
let altura_div_versoes = 0;
let font_percent = 0.025; // fonte usada no botao amarelo
let altura_percent = 0.0255;
	let cabecalio_div_versao =document.getElementsByClassName("cabecalio_versoes")[0];
	let cabecalio_div_versao2 =document.getElementsByClassName("cabecalio_versoes")[1];

let conta_divs_versao = 0;

const divs_que_mostram_versoes = div.children[2].children[0].children[0].children[1].children[0].children[0].children;
for (i = 1; i < divs_que_mostram_versoes.length; i++){ // tem que comecar no i=1 para nao pegar o cabecalio
	fonte_do_botao_de_versao = Math.round(div.clientHeight * font_percent);
	largura_do_botao_de_versao = 15 *Math.round(div.clientHeight * font_percent * 0.5); // ja corrige para as proximas cargas, porque esta funcao so ajusta o tamanho dos divs de data de versao presentes no box 1
	separacao_do_botao_de_versao = fonte_do_botao_de_versao;
	altura_do_botao_de_versao = Math.round(div.clientHeight * altura_percent * 2 * 1.2);
	unidade = "px";

	cabecalio_div_versao.style.height =  Math.round(div.clientHeight * altura_percent) + "px";
	cabecalio_div_versao.style.fontSize = fonte_do_botao_de_versao + "px";
	cabecalio_div_versao.style.top =  "0px";
	cabecalio_div_versao.style.left = "1px";
// os itens abaixo não funcionam na primeira vez... acaba que a utilidade de rodar isso aqui eh so estabelecer o parametros que vao ser usados por devolve_divs_versoes.php porque as linhas abaixo vao dar crash de qualquer jeito

	if (cabecalio_div_versao2 != null) {
		//console.log(cabecalio_div_versao2);
		cabecalio_div_versao2.style.height =  Math.round(div.clientHeight * altura_percent) + "px";
		cabecalio_div_versao2.style.fontSize = fonte_do_botao_de_versao + "px";
		cabecalio_div_versao2.style.top =  "0px";
		cabecalio_div_versao2.style.left = "1px";
	}


	divs_que_mostram_versoes[i].style.fontSize = fonte_do_botao_de_versao + "px"; // divs amarelos que mostram as datas das versoes
	divs_que_mostram_versoes[i].style.width = largura_do_botao_de_versao + "px"; // divs amarelos que mostram as datas das versoes
	divs_que_mostram_versoes[i].style.height = altura_do_botao_de_versao * 1.2 + "px"; // divs amarelos que mostram as datas das versoes
	divs_que_mostram_versoes[i].style.top = document.getElementsByClassName("cabecalio_versoes")[0].style.fontSize.replace("px","") * fator_fonte_versao + "px"; ;
	divs_que_mostram_versoes[i].style.left = Math.round((i-1) * (largura_do_botao_de_versao + separacao_do_botao_de_versao ) + largura_do_botao_de_versao) + "px"; 
	altura_div_versoes = 	divs_que_mostram_versoes[i].offsetHeight;
	conta_divs_versao++;
}



//const divs_que_mostram_versoes2 = div2.children[2].children[0].children[0].children[1].children[0].children[0].children;
//for (i = 0; i < divs_que_mostram_versoes2.length; i++){
//	divs_que_mostram_versoes2[i].style.fontSize = Math.round(div.clientHeight * 0.01) + "px";
// 
//}

let linha_de_versoes = div.children[2].children[0].children[0].children[1]; 
let linha_de_versoes2 = div2.children[2].children[0].children[0].children[1];
//let alt_scroll = 0;
//let alt_scroll2 = 0;
let alt_scroll = altura_scroll();
let alt_scroll2 = altura_scroll();
linha_de_versoes.style.height =  Math.round(1.2 * altura_div_versoes + altura_div + alt_scroll) + "px"; 
linha_de_versoes2.style.height = Math.round(1.2 * altura_div_versoes + altura_div + alt_scroll2) + "px"; 
let ultima_table = div.children[2];
let ultima_table2 = div2.children[2];
let linha_1_box_1 = div.children[1].children[0].children[0].children[0];
let linha_2_box_1 = div.children[1].children[0].children[0].children[1];
let linha_1_box_2 = div2.children[1].children[0].children[0].children[0];
let linha_2_box_2 = div2.children[1].children[0].children[0].children[1];
let rebarba = div.getBoundingClientRect().bottom - ultima_table.getBoundingClientRect().bottom;
let rebarba2 = div2.getBoundingClientRect().bottom - ultima_table2.getBoundingClientRect().bottom;



let ajuste_padding = 35;
//console.log(linha_1_box_1.clientHeight);

	let sobra = -ajuste_padding -rebarba + div.getBoundingClientRect().height - cabecalio.getBoundingClientRect().height - linha_1_box_1.getBoundingClientRect().height - linha_2_box_1.getBoundingClientRect().height - (ultima_table.getBoundingClientRect().height + alt_scroll); // menos cabecalio,  altura da primeira tabela e altura da ultima linha de versoes
	let sobra2 =-ajuste_padding -rebarba2 + div2.getBoundingClientRect().height - cabecalio2.getBoundingClientRect().height - linha_1_box_2.getBoundingClientRect().height - linha_2_box_2.getBoundingClientRect().height - (ultima_table2.getBoundingClientRect().height - alt_scroll2); // menos cabecalio,  altura da primeira tabela e altura da ultima linha de versoes


	document.getElementById("textarea_teclado").style.height= sobra + "px";
	document.getElementById("textarea_mouse").style.height= sobra2 + "px";
	document.getElementById("linha_chave_teclado").style.height= sobra + "px";
	document.getElementById("linha_chave_mouse").style.height= sobra2 + "px";
	document.getElementById("linha_chave_teclado").children[0].style.height= sobra + "px";
	document.getElementById("linha_chave_mouse").style.height= sobra2 + "px";
//console.log(sobra);
//	div.children[1].style.height = sobra * 0.7 + "px";
//	div.children[2].style.height = sobra * 0.3 + "px";

// rebarba_chave busca dar conta de uma rebarba que surge entre o textarea e o td da table. Eu tentei mudar cellspacing e border-spacing para dar conta disso mas parece que os browsers reagem de forma diferente. Entao eh melhor medir essa rebarba e descontar da linha de versoes.

let rebarba_chave  = 	document.getElementById("linha_chave_teclado").getBoundingClientRect().height - document.getElementById("textarea_teclado").getBoundingClientRect().height;
let rebarba_chave2 = 	document.getElementById("linha_chave_mouse").getBoundingClientRect().height - document.getElementById("textarea_mouse").getBoundingClientRect().height;
// alert(rebarba_chave2);
linha_de_versoes.style.height =  linha_de_versoes.clientHeight - rebarba_chave  + "px"; 
linha_de_versoes2.style.height = linha_de_versoes2.clientHeight- rebarba_chave2 + "px";
    
carrega_array_de_scroll_horizontal(elemento);
scroll_horizontal(elemento); 

	
}

function cria_listener_textarea(){

const textareas = document.getElementsByClassName("edicao_versao");
for (let i = 0; i < textareas.length; i++) {
			textareas[i].addEventListener("keydown",function (e)
				{
					if (e.key == "ArrowRight" && modo_edicao && e.shiftKey && textarea_em_edicao.getAttribute("data-alterado")=="gravado"){
						x_versao++; if (x_versao > array_scroll_horizontal.length - 1) {x_versao=array_scroll_horizontal.length - 1;} else {
						scroll_horizontal(versoes_em_edicao);
						carrega_versao_selecionada(array_scroll_horizontal[x_versao].getAttribute("data-id-chave"), textarea_em_edicao);	
						}
						return;
					} 
				
					if (e.key == "ArrowLeft" && modo_edicao && e.shiftKey && textarea_em_edicao.getAttribute("data-alterado")=="gravado"){
						x_versao--; if (x_versao <0) {x_versao=0;} else {
						scroll_horizontal(versoes_em_edicao);
						carrega_versao_selecionada(array_scroll_horizontal[x_versao].getAttribute("data-id-chave"), textarea_em_edicao);	
						}
						return;	
					} 

					if (e.shiftKey) 
						{
						//	alert("apertou SHIFT");
							return;
						}
					if ((e.key == "ArrowLeft" || e.key == "ArrowRight") && modo_edicao && e.shiftKey && textarea_em_edicao.getAttribute("data-alterado")=="gravado"){return;} //nao pode entrar em modo edicao se apertar shift
					
					if (modo_edicao && document.activeElement == textarea_em_edicao) {
					this.setAttribute("data-alterado","sem_gravar");
					this.style.backgroundColor = cor_de_edicao; 
					if (matriz_ganha_foco[x][0].includes("nivel")) {document.getElementById("grava_"+textarea_em_edicao.id).disabled=false;} // nao pode habilitar o botao grava se eh para inserir novo
					if (matriz_ganha_foco[x][0].includes("nivel")) {document.getElementById("separa_"+textarea_em_edicao.id).disabled=false;} // nao pode habilitar o botao grava se eh para inserir novo
					if (matriz_ganha_foco[x][0].includes("nivel")) {document.getElementById("junta_"+textarea_em_edicao.id).disabled=false;} // nao pode habilitar o botao grava se eh para inserir novo
					if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {document.getElementById("grava_"+textarea_em_edicao.id).disabled=false;} // nao pode habilitar o botao grava se eh para inserir novo
					console.log("grava_"+textarea_em_edicao.id);
					console.log(document.getElementById("grava_"+textarea_em_edicao.id).disabled);
					}
				}
			);

  			} 
}


function inicializa(){

// alert("Antes de inicializa: "+x+" ---> "+y);


desabilita_box("true", "edita_secoes_mouse");
desabilita_box("true", "edita_secoes_teclado");

console.log(matriz_ganha_foco);




document.getElementById("radio_niveis_"+quantos_niveis_mostra).checked=true;
document.getElementById(radio_selecionado).checked=true;
document.getElementById("check_mostra_filhos").checked=mostra_filhos_check;
inicializa_teclado();
acha_divs_que_ganham_foco();

if (x > matriz_ganha_foco.length - 1) {
	x=0;
	y=0;
	// alert("zerou xy - tamanho matriz_ganha_foco "+ matriz_ganha_foco.length );
}

if (y > matriz_ganha_foco[x][1].length -1)
{
	x=0;
	y=0;
	// alert("zerou xy - tamanho matriz_ganha_foco "+ matriz_ganha_foco.length );
}



if (x < matriz_ganha_foco.length) {

	if (matriz_ganha_foco[x][0].includes("nivel")) {
			gemeo_atual_na_arvore = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
	}

	if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {
			gemeo_atual_no_nivel = document.getElementById(matriz_ganha_foco[x][1][y].getAttribute("data-gemeo"));
	}
	
	if (matriz_ganha_foco[x][0].includes("flutua_para_direita") && gemeo_atual_na_arvore == null) {
			gemeo_atual_no_nivel = matriz_ganha_foco[x][1][y];
			gemeo_atual_na_arvore = matriz_ganha_foco[matriz_ganha_foco[x][1][y].getAttribute("data-nivel")][1][y];
			if (y>0) {guarda_ultimo_visitado[matriz_ganha_foco[x][1][y].getAttribute("data-nivel")-1] = y - 1;} else
				     {guarda_ultimo_visitado[matriz_ganha_foco[x][1][y].getAttribute("data-nivel")-1] = y + 1;}
	}
}
velha_borda_focalizada = matriz_ganha_foco[x][1][y].style.border;
velha_borda_de_nivel_focalizada=document.getElementById(matriz_ganha_foco[x][0]).style.border;
velho_gemeo_no_nivel = matriz_ganha_foco[x][1][y];

cria_listener_textarea();



matriz_ganha_foco[x][1][y].style.border=borda_focalizada;


simula_key_down("e"); // este evento eh para tirar um erro aparentemente inofensivo que aparece na primeira carga, porque nem todos os elementos estao criados. Forca o evento de teclado para criar.

limpa_pais(1);
flutua_para_direita("flutua_para_direita");
flutua_para_baixo("flutua_para_direita", "cabecalio_flutua_para_direita");
flutua_para_direita("seletor");
flutua_para_cima("seletor", "cabecalio_seletor");
maximiza_altura('nivel');

coloca_setas_no_pai();
if (fator_de_reducao_da_largura_da_arvore != 1) {
			reduz_arvore("flutua_para_direita",fator_de_reducao_da_largura_da_arvore);
			reduz_arvore("seletor",fator_de_reducao_da_largura_da_arvore);
			flutua_para_direita("flutua_para_direita");
			flutua_para_direita("seletor");
}
percorre_arvore_trechos(true)
inicializa_folhas_de_trechos();
//ajusta_scroll();
const collection2 = document.getElementsByClassName("secao");
let velho_selecionado = document.getElementById("folha_arvore_corpo_tese");
for (let i = 0; i < collection2.length; i++) {
  let that = collection2[i].getAttribute("data-id-filho"); // se colocar var não funciona
  let that2 = collection2[i];
  collection2[i].addEventListener("click",function ()
		{
			//console.log("crick chamou");
			let arvore = document.getElementById("flutua_para_direita");
			let gemeo = document.getElementById(that2.getAttribute("data-gemeo"));

			velho_selecionado.style.opacity = "1.0"; // volta aa cor original 
			gemeo.style.opacity             = "0.4";
			

//			velho_selecionado.style.backgroundColor = velho_selecionado.getAttribute("data-cor-nivel"); // volta aa cor original 
//			velho_selecionado.style.color = velho_selecionado.getAttribute("data-cor-letra"); // volta aa cor original 
//			gemeo.style.backgroundColor="blue";
//			gemeo.style.color="white";
			velho_selecionado = gemeo;
			scroll_arvore(arvore,gemeo);

			limpa_pais(that2.getAttribute("data-nivel"));
			// alert(this.getAttribute("data-id-filho")+" - "+that + " + " + this.id);
			const pais = document.getElementsByClassName("pai");
			for (let j = 0; j < pais.length; j++){
				
				if (pais[j].getAttribute("data-id-pai") == that){
//alert(document.getElementById("blank_"+pais[j].getAttribute("data-nivel")+"_top").style.height.replace('px',''));					
					//alert(pais[j].id);
					pais[j].style.opacity = "1.0";
					div_nivel = document.getElementById("nivel_"+pais[j].getAttribute("data-nivel"));
					//alert((pais[j].getBoundingClientRect().top ) - div_nivel.getBoundingClientRect().top);
					div_nivel.scrollTop=(pais[j].getBoundingClientRect().top ) + div_nivel.scrollTop - div_nivel.getBoundingClientRect().top;
					
										
				}
			}
	
		}
);
}

const percorre_niveis = document.getElementsByClassName("nivel");
for (let i = 0; i < percorre_niveis.length; i++) {
	//console.log(percorre_niveis[i]);
	flutua_para_cima_mantem_altura(percorre_niveis[i].id, "cabecalio_de_nivel_"+percorre_niveis[i].getAttribute("data-nivel"));

}

acha_dir_max_min_esq_niveis();

setTimeout( function () {
	refaz_tamanho_edita_secoes("edita_secoes_teclado", "edita_secoes_mouse");
		let paizao = document.getElementById(matriz_ganha_foco[x][0]);

	if (matriz_ganha_foco[x][0].includes("flutua_para_direita")) {scroll_arvore_especial(paizao,matriz_ganha_foco[x][1][y]); alert("scroll");}  // nao precisava desta complicacao de 2 ifs
	if (matriz_ganha_foco[x][0].includes("seletor")) {scroll_arvore_especial(paizao,matriz_ganha_foco[x][1][y]);alert("scroll2");}

	}, 1000);
} // fim inicializa()


setTimeout(function () {inicializa();}, 1000);

</script>


</body>

</html>
