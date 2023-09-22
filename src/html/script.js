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
  
		searchInputs.forEach(si=>
			{
			  si.addEventListener
			  (
			  	'focus', function () 
					{
						searchInputs.forEach(sub_si=>{
			  			if (sub_si.getAttribute("data-selecionou")=="nao") {sub_si.value=""};
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
                `<div class="item${index === currentSelection ? ' selected' : ''}" data-index="${index}">${item}</div>`
            ).join('');


		

            resultsDiv.querySelectorAll('.item').forEach(item => {
                item.addEventListener('click', function(e) {

//                e.preventDefault(); 
					item.parentElement.parentElement.children[0].setAttribute("data-selecionou","sim");
					console.log("clicou");
//					console.log(item.parentElement.parentElement.children[0]);
                    searchInput.value = e.target.innerText;
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
                searchInput.value = currentItems[currentSelection];
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
