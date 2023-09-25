class token_na_frase {
	constructor(id_token, ordem, nome_tipo_sintatico, id_tipo_sintatico) {
		this.id_token = id_token;
		this.ordem = ordem;
		this.nome_tipo_sintatico = nome_tipo_sintatico;
		this.id_tipo_sintatico = id_tipo_sintatico;
	}
}

let matriz_tokens = [];

function manda_tokens(nome_tipo_sintatico, id_tipo_sintatico, matriz_tokens){

let lista_tokens = document.querySelectorAll("."+nome_tipo_sintatico);
console.log("lista "+nome_tipo_sintatico);
console.log(lista_tokens);
for (let i = 0; i < lista_tokens.length; i++) {
	let id_token = lista_tokens[i].getAttribute("data-id-token");
	let ordem = lista_tokens[i].getAttribute("data-ordem");
	let token = new token_na_frase(id_token, ordem, nome_tipo_sintatico, id_tipo_sintatico);
	console.log(token);
	matriz_tokens.push(token);
}


//let arrayOfObjects = [
//    {nome: 'João', idade: 25},
//    {nome: 'Maria', idade: 30},
//    // ... outros objetos
//];
//
//fetch('processar.php', {
//    method: 'POST',
//    headers: {
//        'Content-Type': 'application/json',
//    },
//    body: JSON.stringify(arrayOfObjects),
//})
//.then(response => response.json())
//.then(data => {
//    console.log('Success:', data);
//})
//.catch((error) => {
//    console.error('Error:', error);
//});


} // fim manda_tokens


function hideResults(itz) {
//			console.log("entrou");
//			console.log(itz);
			itz.innerText = '';
            setTimeout(function () {itz.innerText = '';}, 400); // bizarrices do browser: sem esse timeout ele não apaga quando é enter.
            currentSelection = -1;
        }

document.addEventListener("DOMContentLoaded", function() {
    const dropdowns = document.querySelectorAll('.dropdown-wrapper');
	const searchInputs = document.querySelectorAll('.search-input');
	const botoes_grava = document.querySelectorAll('.botao');
 
	botoes_grava.forEach(bg => {
		bg.addEventListener ('click', 
		 		function () {
					manda_tokens(bg.getAttribute("data-nome-tipo-sintatico"),bg.getAttribute("data-id-tipo-sintatico"), matriz_tokens);								
					console.log(matriz_tokens);	
				});
		});



		searchInputs.forEach(si=>
			{
			  si.addEventListener
			  (
			  	'focus', function () 
					{
						searchInputs.forEach(sub_si=>{
			  			if (sub_si.getAttribute("data-selecionou")=="nao") {sub_si.value=""; sub_si.setAttribute("data-id-token","")};
						hideResults(sub_si.parentElement.children[1]);
						});
			  		}
			  )
			}
		
		);
	
  
 	 dropdowns.forEach(dropdown => {
        const searchInput = dropdown.querySelector('.search-input');
        const resultsDiv = dropdown.querySelector('.results');
		searchInput.setAttribute("data-selecionou","nao");
		resultsDiv.id="Res_"+dropdown.id;
        let currentSelection = -1;
        let currentItems = [];

        function displayResults(items, ekey) {
            resultsDiv.innerHTML = items.map((item, index) => 
                `<div class="item${index === currentSelection ? ' selected' : ''}" data-id-token="${item.id_chave_token}" data-index="${index}">${item.nome_token}</div>`
            ).join('');


		

            resultsDiv.querySelectorAll('.item').forEach(item => {
                item.addEventListener('click', function(e) {

//                e.preventDefault(); 
					item.parentElement.parentElement.children[0].setAttribute("data-selecionou","sim");
					console.log("clicou");
//					console.log(item.parentElement.parentElement.children[0]);
                    searchInput.value = e.target.innerText;
					searchInput.setAttribute("data-id-token",e.target.getAttribute("data-id-token"));
                    hideResults(resultsDiv);
             });
  				 if (item.classList.contains('selected')) {
				 	  console.log('item');
					  console.log()
				      if (ekey == 'ArrowDown') {resultsDiv.scrollTop = item.offsetTop - resultsDiv.clientHeight + item.clientHeight;}
				      if (ekey == 'ArrowUp') {resultsDiv.scrollTop = item.offsetTop; console.log("sobe");}
    			 }
          });
			resultsDiv.style.left = searchInput.getBoundingClientRect().left;
			resultsDiv.style.top = searchInput.getBoundingClientRect().top;
		
        }

		
//        searchInput.addEventListener('blur', function() {
//			setTimeout(function () {if (searchInput.getAttribute("data-selecionou")=="nao") {searchInput.value="";}}, 300);
//			hideResults(resultsDiv);
//		});
        searchInput.addEventListener('input', function() {
            const searchTerm = searchInput.value;

            if (searchTerm.length < 1) {
                hideResults(resultsDiv);
                return;
            }

            fetch(`carrega_tokens.php?term=${searchTerm}&query=`+dropdown.getAttribute('data-sql'))
                .then(response => response.json())
                .then(data => {
                    currentItems = data;
					console.log(data);
                    displayResults(currentItems,'');
                })
                .catch(error => console.error('Erro:', error));
        });
        searchInput.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowDown') {
                e.preventDefault(); 
                currentSelection++;
                if (currentSelection >= currentItems.length) currentSelection = 0;
			}

            if (e.key === 'ArrowUp') {
                e.preventDefault(); 
                currentSelection--;
                if (currentSelection < 0) currentSelection = currentItems.length - 1;
            }

            if (e.key === 'Enter' && currentSelection > -1) {
                e.preventDefault(); 
				searchInput.setAttribute("data-selecionou","sim");
                searchInput.value = currentItems[currentSelection].nome_token;
				searchInput.setAttribute("data-id-token", currentItems[currentSelection].id_chave_token);// tem que substituir por id
				console.log("hideresults");
                hideResults(resultsDiv);
            }

            if (e.key === 'Escape') {
                hideResults(resultsDiv);
            }

            if (['ArrowDown', 'ArrowUp', 'Enter', 'Escape'].includes(e.key)) {
                displayResults(currentItems, e.key);
            } else {searchInput.setAttribute("data-selecionou","nao");}
        });
    });
});
