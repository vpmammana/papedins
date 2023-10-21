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
	const tipos_automatas = document.querySelectorAll('.tipo_automata'); 
		
  
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
	                e.stopPropagation(); 
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
						searchInputs.forEach(sub_si=>{
			  			if (sub_si.getAttribute("data-selecionou")=="nao") {sub_si.value=""; sub_si.setAttribute("data-id-token","")};
						console.log('sub_si -> '+ sub_si.value);
						if (sub_si != searchInput) {setTimeout(function () {hideResults(sub_si.parentElement.children[1]);}, 300);}
						});
			   
					
					}
			  );

		searchInput.addEventListener
			  (
			  	'click', function (e) 
					{
				e.stopPropagation();
				setTimeout(function () {fetch(`carrega_tokens.php?term=&query=`+dropdown.getAttribute('data-sql'))
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
				searchInput.value = currentItems[currentSelection].nome_token;
				searchInput.setAttribute("data-id-token", currentItems[currentSelection].id_chave_token);// tem que substituir por id
				console.log("hideresults");
                hideResults(resultsDiv);
            }

            if (e.key === 'Escape') {
                hideResults(resultsDiv);
            }

            if (['ArrowDown', 'ArrowUp', 'Enter', 'Escape', 'Tab'].includes(e.key)) {
                if(e.key!="Tab") {displayResults(currentItems, e.key);}
				else {hideResults(resultsDiv);}
            } else {
						searchInput.setAttribute("data-selecionou","nao");
				   }

        });
    });
});
