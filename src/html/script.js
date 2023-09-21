function hideResults(itz) {
			console.log("entrou");
			console.log(itz);
			itz.innerText = '';
            setTimeout(function () {itz.innerText = '';}, 400); // bizarrices do browser: sem esse timeout ele não apaga quando é enter.
            currentSelection = -1;
        }

document.addEventListener("DOMContentLoaded", function() {
    const dropdowns = document.querySelectorAll('.dropdown-wrapper');

    dropdowns.forEach(dropdown => {
        const searchInput = dropdown.querySelector('.search-input');
        const resultsDiv = dropdown.querySelector('.results');
		resultsDiv.id="Res_"+dropdown.id;
        let currentSelection = -1;
        let currentItems = [];

        function displayResults(items) {
            resultsDiv.innerHTML = items.map((item, index) => 
                `<div class="item${index === currentSelection ? ' selected' : ''}" data-index="${index}">${item}</div>`
            ).join('');

            resultsDiv.querySelectorAll('.item').forEach(item => {
                item.addEventListener('click', function(e) {
                    searchInput.value = e.target.innerText;
                    hideResults(resultsDiv);
                });
            });
        }

        searchInput.addEventListener('input', function() {
            const searchTerm = searchInput.value;

            if (searchTerm.length < 3) {
                hideResults(resultsDiv);
                return;
            }

            fetch(`backend.php?term=${searchTerm}`)
                .then(response => response.json())
                .then(data => {
                    currentItems = data;
                    displayResults(currentItems);
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
                searchInput.value = currentItems[currentSelection];
				console.log("hideresults");
                hideResults(resultsDiv);
            }

            if (e.key === 'Escape') {
                hideResults(resultsDiv);
            }

            if (['ArrowDown', 'ArrowUp', 'Enter', 'Escape'].includes(e.key)) {
                displayResults(currentItems);
            }
        });
    });
});
