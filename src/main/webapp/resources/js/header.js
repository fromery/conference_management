var loginButton = document.getElementById('logined_user_wrapper');
var subMenu = document.querySelector('.account_submenu');
var body = document.querySelector('body');

loginButton.addEventListener('click', function (event) {
    event.stopImmediatePropagation();
    var isClickOnSubmenu = event.path.includes(subMenu);
    var isHidden = !subMenu.classList.contains('show');

    if (!isClickOnSubmenu && isHidden) {
        subMenu.classList.add('show');
        body.addEventListener('click', hideSubmenu);
    } else if (!isClickOnSubmenu && !isHidden) {
        subMenu.classList.remove('show');
        body.removeEventListener('click', hideSubmenu);
    };
});

function hideSubmenu(event) {
    var isClickOutsideModal = !event.path.includes(loginButton);

    if (isClickOutsideModal) {
        subMenu.classList.remove('show');
        body.removeEventListener('click', hideSubmenu);
    }
}

/*To Logout the user*/
var logoutButton = document.getElementById('logout');
var logoutForm = document.getElementById('logout-form');

logoutButton.addEventListener('click', function(event) {
    event.preventDefault();
    logoutForm.submit();
});
