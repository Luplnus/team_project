        const searchIcon = document.getElementById('search_icon');
        const searchBar = document.getElementById('search_bar');

        searchIcon.addEventListener('click', function(e) {
            e.preventDefault();
            searchBar.classList.toggle('active');
            if (searchBar.classList.contains('active')) {
                setTimeout(() => {
                    searchBar.focus();
                }, 100);
            }
        });