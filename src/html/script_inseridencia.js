const observer = new MutationObserver((mutations) => { // o observer eh necessario para que o dropdown funcione em elementos que sao inseridos dinamicamente no DOM, mas acho que só detecta o pai
    mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
            // Verifica o próprio nó e seus filhos
            checkNodeAndChildren(node);
        });
    });
});


function updateElementPosition(alvo, referencia) {
    // Código para atualizar a posição do elemento
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
    alvo.style.top = referencia.getBoundingClientRect().bottom + scrollTop + "px";
    alvo.style.visibility="visible";	
}

function moverParaBody(elemento) { 
    // Obtém o elemento body 
    var body = document.body; 
 
    // Move o elemento para ser um filho direto de body 
    body.appendChild(elemento); 
}



function checkNodeAndChildren(node) { // funcao recursiva que percorre a arvore completa de filhos de um nó
    // Primeiro, verifica se o nó é um elemento do DOM e possui classList
    if (node.nodeType === Node.ELEMENT_NODE && node.classList) {
        if (node.classList.contains('dropdown-wrapper')) {
            // console.log('Elemento .dropdown-wrapper encontrado:', node);
	    setupDropdown(node); // faz o setup do dropdown-wrapper recem inserido no DOM
        }
    }
    // Depois, verifica cada um dos filhos do nó
    if (node.hasChildNodes()) {
        node.childNodes.forEach(childNode => {
            checkNodeAndChildren(childNode);
        });
    }
}

observer.observe(document.body, { childList: true, subtree: true });

function hideResults(itz) {
		itz.innerText = '';
		itz.style.height="0px";
		itz.style.visibility="hidden";
            	setTimeout(function () {itz.innerText = ''; itz.style.height='0px'; itz.style.visibility="hidden";}, 400); // bizarrices do browser: sem esse timeout ele não apaga quando é enter.
            	return -1;
        }

function setupDropdown(dropdown) {
	const searchInputs = document.querySelectorAll('.search-input');
	const todos_inputs = document.querySelectorAll('input');
	const searchInput = dropdown.querySelector('.search-input');
	const resultsDiv = document.getElementById(searchInput.getAttribute("data-companion-results"));
	moverParaBody(resultsDiv);
        //const resultsDiv = dropdown.querySelector('.results');
		if (searchInput.hasAttribute("data-default")) {} else { searchInput.setAttribute("data-selecionou","nao");}
        let currentSelection = -1;
        let currentItems = [];

        function displayResults(items, ekey) {
			console.log('teste');
			console.log(resultsDiv);
            resultsDiv.innerHTML = items.map((item, index) => 
                `<div class="item${index === currentSelection ? ' selected' : ''}" data-id-token="${item.id_token}" data-index="${index}">${item.nome_tipo}</div>`
            ).join('');
		const todos_items = resultsDiv.querySelectorAll('.item');

			todos_items.forEach(item => {
                item.addEventListener('click', function(e) {
	                e.stopPropagation(); 
                    searchInput.value = e.target.innerText;
					searchInput.setAttribute("data-id-token",e.target.getAttribute("data-id-token"));
					searchInput.setAttribute("data-selecionou","sim");

					document.getElementById(searchInput.getAttribute('data-companion-id')).value=e.target.getAttribute("data-id-token"); // hidden input que vai mandar o id_token para o server
                    currentSelection = hideResults(resultsDiv);
             });
			 		
  				 if (item.classList.contains('selected')) {
				 	  
				      if (ekey == 'ArrowDown') { if (item.offsetTop + item.clientHeight > resultsDiv.scrollTop + resultsDiv.clientHeight || item.offsetTop < resultsDiv.scrollTop) {resultsDiv.scrollTop = item.offsetTop - resultsDiv.clientHeight + item.clientHeight;}}
				      if (ekey == 'ArrowUp') {console.log("resultTop: "+resultsDiv.offsetTop+" resultHeight: "+resultsDiv.clientHeight+" itemTop: "+item.offsetTop + "scrollTop: "+ resultsDiv.scrollTop); if (item.offsetTop < resultsDiv.scrollTop || item.offsetTop > resultsDiv.scrollTop + resultsDiv.clientHeight) { resultsDiv.scrollTop = item.offsetTop; console.log("sobe");}}

				 	  console.log('item how come? '+  resultsDiv.scrollTop + " soma: " +(item.offsetTop - resultsDiv.clientHeight + item.clientHeight));
    			 
				 }
          });


			resultsDiv.style.visibility="hidden";
			resultsDiv.style.left = (searchInput.getBoundingClientRect().left //- searchInput.parentElement.parentElement.getBoundingClientRect().left
			)+"px";
			resultsDiv.style.width = searchInput.getBoundingClientRect().width+"px";
			const sobra_de_tela = window.innerHeight - searchInput.getBoundingClientRect().bottom - 10;
			
			//console.log("sobra_de_tela: "+sobra_de_tela);
			//console.log("itemHeight: "+todos_items[0].style.height);
			//console.log("todos: "+todos_items[0].getBoundingClientRect().height);

			if (todos_items.length > 0 && todos_items[0].getBoundingClientRect().height) {
			    const itemHeight = todos_items[0].getBoundingClientRect().height;
			    const totalHeight = todos_items.length * itemHeight;
			
			    if (totalHeight > sobra_de_tela) {
			        resultsDiv.style.height = sobra_de_tela + 'px'; // Adicione 'px' se sobra_de_tela for um número
			    } else {
			        resultsDiv.style.height = totalHeight + 'px';
			    }
			} else {console.log("Algo inesperado ocorreu mas provavelmente não afetará seu trabalho. Para ajudar o desenvolvimento, contate o Victor.");}


			//resultsDiv.style.top = parseInt(searchInput.getBoundingClientRect().top  - searchInput.parentElement.parentElement.parentElement.getBoundingClientRect().top + searchInput.getBoundingClientRect().height
			//)+"px";
				requestAnimationFrame( function () 
					{
						updateElementPosition(resultsDiv, searchInput);	
					} 
				);
				//resultsDiv.style.top = parseInt(searchInput.getBoundingClientRect().top  - document.getElementById("cabecalio").getBoundingClientRect().height + searchInput.getBoundingClientRect().height)+"px";
		
        }

	
		
        searchInput.addEventListener('blur', function() {
					//alert("catso"+searchInput.getAttribute("data-selecionou")+" value:"+searchInput.value); 
					if (searchInput.value == ""){
					searchInput.setAttribute("data-selecionou", "nao");
					}
				//		setTimeout(function () {hideResults(searchInput.parentElement.children[1]);}, 100);
					//	alert("catso");
			
		});

		todos_inputs.forEach(tis=>{
			tis.addEventListener
			  (
			  	'focus', function () 
					{
						console.log("foco");
						searchInputs.forEach(sub_si=>{
			  			if (sub_si.getAttribute("data-selecionou")=="nao") {sub_si.value=""; sub_si.setAttribute("data-id-token","")} else { if (sub_si.hasAttribute("data-default")) {sub_si.value = sub_si.getAttribute("data-default");}
}
						console.log('sub_si -> '+sub_si.id+" ->  "+ sub_si.value);
						if (sub_si != searchInput) {setTimeout(function () {currentSelection = hideResults(document.getElementById(sub_si.getAttribute("data-companion-results"))); if (sub_si.hasAttribute("data-default")) {sub_si.value = sub_si.getAttribute("data-default"); } }, 30);}
						});
			   
					
					}
			  );
		});

		searchInput.addEventListener
			  (
			  	'click', function (e) 
					{
				e.stopPropagation();
				setTimeout(function () {fetch(`carrega_tokens_inseridencia.php?term=&query=`+dropdown.getAttribute('data-sql'))
                .then(response => response.json())
                .then(data => {
                    currentItems = data;
					console.log(data);
                    displayResults(currentItems,'');
                })
                .catch(error => console.error('Erro:', error));
				}, 350);

										
					}
			  );


         searchInput.addEventListener('input', function() {
            const searchTerm = searchInput.value;
			
			if (searchTerm.length === 0) 
				{ 
					searchInput.setAttribute("data-selecionou", "nao"); 
				}

            if (searchTerm.length < 0) { // eu acho que coloquei isso para nunca acontecer, porque queria o drop sempre aberto, mas nao estah acontecendo assim, por ora - desconsidere esta mensagem se estiver
                currentSelection = hideResults(resultsDiv);
                return;
            }

            fetch(`carrega_tokens_inseridencia.php?term=${searchTerm}&query=`+dropdown.getAttribute('data-sql'))
                .then(response => response.json())
                .then(data => {
                    currentItems = data;
					console.log(data);
                    displayResults(currentItems,'');
                })
                .catch(error => console.error('Erro:', error));
        });
        searchInput.addEventListener('keydown', function(e) {
			if (e.key==='Tab') { if (this.hasAttribute("data-default")) {this.value=this.getAttribute("data-default");} } // por algum motivo este if eh necessario para que o if (['Tab'].includes funcionar
            if (e.key === 'ArrowDown') {
				console.log('teste '+searchInput.id+resultsDiv.id);
                e.preventDefault();
                if (resultsDiv.innerHTML=="") {searchInput.click();}
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
				searchInput.value = currentItems[currentSelection].nome_tipo;
				//alert( currentItems[currentSelection].nome_tipo);
				document.getElementById(searchInput.getAttribute('data-companion-id')).value=currentItems[currentSelection].id_token;
				searchInput.setAttribute("data-id-token", currentItems[currentSelection].id_token);// tem que substituir por id
				console.log("hideresults");
                currentSelection = hideResults(resultsDiv);
            }

            if (e.key === 'Escape') {
		if (searchInput.hasAttribute("data-default")) {searchInput.value = searchInput.getAttribute('data-default'); searchInput.setAttribute("data-selecionou","sim");}
		else {searchInput.value = ''; searchInput.setAttribute("data-selecionou","nao");}
                currentSelection = hideResults(resultsDiv);
            }

            if (['ArrowDown', 'ArrowUp', 'Enter', 'Escape', 'Tab'].includes(e.key)) {
                if(e.key!="Tab") {displayResults(currentItems, e.key);}
				else {currentSelection = hideResults(resultsDiv);}
            } else {
					if (searchInput.hasAttribute("data-default")) {} else {searchInput.setAttribute("data-selecionou","nao");}
				   }

        });



} // fim setDropdown



document.addEventListener("DOMContentLoaded", function() {
    const dropdowns = document.querySelectorAll('.dropdown-wrapper');
		

	document.body.addEventListener ('click', 
		 		function (e) {
//    document.querySelectorAll('*').forEach(function(element) {
//    var style = window.getComputedStyle(element);
//    if (style.position === 'absolute') {
//        console.log(element);
//    }
//    });
					//alert("tipo_automata"); // este alert eh importante para testar se o evento estah sendo ativado por divs internos ao div tipo_automata. 
			        let rDiv = document.querySelectorAll('.results');
					rDiv.forEach(rd => {
							currentSelection = hideResults(rd);
						}
					);
				let inputs_default = document.querySelectorAll('.search-input');
					inputs_default.forEach(inp => {
							if (inp.hasAttribute("data-default")) {inp.value = inp.getAttribute("data-default"); inp.setAttribute("data-selecionou","sim");}
						}
					);
				});

 	 dropdowns.forEach(dropdown => {
		setupDropdown(dropdown);

            });


});


