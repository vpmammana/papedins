function hideResults(itz) {
		itz.innerText = '';
            	setTimeout(function () {itz.innerText = '';}, 400); // bizarrices do browser: sem esse timeout ele não apaga quando é enter.
            	return -1;
        }

function setupDropdown(dropdown) {
	const searchInputs = document.querySelectorAll('.search-input');

	const searchInput = dropdown.querySelector('.search-input');
        const resultsDiv = dropdown.querySelector('.results');
		searchInput.setAttribute("data-selecionou","nao");
        let currentSelection = -1;
        let currentItems = [];

        function displayResults(items, ekey) {
			console.log('teste');
			console.log(resultsDiv);
            resultsDiv.innerHTML = items.map((item, index) => 
                `<div class="item${index === currentSelection ? ' selected' : ''}" data-id-token="${item.id_token}" data-index="${index}">${item.nome_tipo}</div>`
            ).join('');

			resultsDiv.querySelectorAll('.item').forEach(item => {
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
		  	console.log("searchInput oi");
		  	console.log(searchInput);
		  	console.log(resultsDiv);

			resultsDiv.style.left = searchInput.getBoundingClientRect().left+"px";
			resultsDiv.style.width = searchInput.getBoundingClientRect().width+"px";
			resultsDiv.style.top = searchInput.getBoundingClientRect().top;
		
        }

	
		
        searchInput.addEventListener('blur', function() {
					if (searchInput.value == ""){
					searchInput.setAttribute("data-selecionou", "nao"); 
					}
				//		setTimeout(function () {hideResults(searchInput.parentElement.children[1]);}, 100);
					//	alert("catso");
			
		});

		searchInput.addEventListener
			  (
			  	'focus', function () 
					{
						console.log("foco");
						searchInputs.forEach(sub_si=>{
			  			if (sub_si.getAttribute("data-selecionou")=="nao") {sub_si.value=""; sub_si.setAttribute("data-id-token","")};
						console.log('sub_si -> '+sub_si.id+" ->  "+ sub_si.value);
						if (sub_si != searchInput) {setTimeout(function () {currentSelection = hideResults(document.getElementById(sub_si.getAttribute("data-companion-results")));}, 300);}
						});
			   
					
					}
			  );

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
			if (e.key==='Tab') {} // por algum motivo este if eh necessario para que o if (['Tab'].includes funcionar
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
                currentSelection = hideResults(resultsDiv);
            }

            if (['ArrowDown', 'ArrowUp', 'Enter', 'Escape', 'Tab'].includes(e.key)) {
                if(e.key!="Tab") {displayResults(currentItems, e.key);}
				else {currentSelection = hideResults(resultsDiv);}
            } else {
						searchInput.setAttribute("data-selecionou","nao");
				   }

        });



} // fim setDropdown



document.addEventListener("DOMContentLoaded", function() {
    const dropdowns = document.querySelectorAll('.dropdown-wrapper');
		

	document.body.addEventListener ('click', 
		 		function (e) {
					//alert("tipo_automata"); // este alert eh importante para testar se o evento estah sendo ativado por divs internos ao div tipo_automata. 
			        let rDiv = document.querySelectorAll('.results');
					rDiv.forEach(rd => {
							currentSelection = hideResults(rd);
						}
					);
				});

 	 dropdowns.forEach(dropdown => {
		setupDropdown(dropdown);
            });
});
