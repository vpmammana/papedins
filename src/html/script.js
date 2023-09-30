class token_na_frase {
	constructor(id_token, ordem, nome_tipo_sintatico, id_tipo_sintatico, token) {
		this.id_token = id_token;
		this.ordem = ordem;
		this.nome_tipo_sintatico = nome_tipo_sintatico;
		this.id_tipo_sintatico = id_tipo_sintatico;
		this.token = token;
	}
}

let matriz_tokens = [];

function manda_tokens(nome_tipo_sintatico, id_tipo_sintatico, matriz_tokens){
matriz_tokens = [];

let lista_tokens = document.querySelectorAll("."+nome_tipo_sintatico);
console.log("lista "+nome_tipo_sintatico);
console.log(lista_tokens);
for (let i = 0; i < lista_tokens.length; i++) {
	let id_token = lista_tokens[i].getAttribute("data-id-token");
	let token_string = lista_tokens[i].value;
	let ordem = lista_tokens[i].getAttribute("data-ordem");
	let token = new token_na_frase(id_token, ordem, nome_tipo_sintatico, id_tipo_sintatico, token_string);
	console.log(token);
	matriz_tokens.push(token);
}

fetch('grava_tokens.php', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify(matriz_tokens),
})
.then(response => response.json())
.then(response => {
    alert(response.message);
})
.catch((error) => {
    alert('Error:', error);
});

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
				 	  
				      if (ekey == 'ArrowDown') { if (item.offsetTop + item.clientHeight > resultsDiv.scrollTop + resultsDiv.clientHeight || item.offsetTop < resultsDiv.scrollTop) {resultsDiv.scrollTop = item.offsetTop - resultsDiv.clientHeight + item.clientHeight;}}
				      if (ekey == 'ArrowUp') {console.log("resultTop: "+resultsDiv.offsetTop+" resultHeight: "+resultsDiv.clientHeight+" itemTop: "+item.offsetTop + "scrollTop: "+ resultsDiv.scrollTop); if (item.offsetTop < resultsDiv.scrollTop || item.offsetTop > resultsDiv.scrollTop + resultsDiv.clientHeight) { resultsDiv.scrollTop = item.offsetTop; console.log("sobe");}}
				 	  console.log('item how come? '+  resultsDiv.scrollTop + " soma: " +(item.offsetTop - resultsDiv.clientHeight + item.clientHeight));
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

            if (searchTerm.length < 0) {
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
			if (e.key==='Tab') {} // por algum motivo este if eh necessario para que o if (['Tab'].includes funcionar
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

            if (['ArrowDown', 'ArrowUp', 'Enter', 'Escape', 'Tab'].includes(e.key)) {
                displayResults(currentItems, e.key);
            } else {searchInput.setAttribute("data-selecionou","nao");}
        });
    });
});
