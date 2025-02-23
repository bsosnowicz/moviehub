document.addEventListener("turbo:load", function () {
    const searchField = document.querySelector(".searchBar");
    const suggestionsList = document.getElementById("suggestionsList");

    searchField.addEventListener("keyup", function () {
        const query = searchField.value.trim();
        if (query.length > 0) {
            fetch(`/suggestions?q=${query}`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/javascript',
                }
            })
            .then(response => response.text())
            .then(data => {
                suggestionsList.innerHTML = data; 
                suggestionsList.style.display = "block"; 
            })
            .catch(error => {
                console.error('Error fetching suggestions:', error);
            });
        } else {
            suggestionsList.style.display = "none"; 
        }
    });

    document.addEventListener("click", function (e) {
        if (!searchField.contains(e.target) && !suggestionsList.contains(e.target)) {
            suggestionsList.style.display = "none";
        }
    });
});
