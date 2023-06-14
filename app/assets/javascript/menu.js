$(document).ready(function(){
    let btnMenu = document.getElementById("btn-menu");
    let menu = document.getElementById("menu-collapse");
    let btnOculto = document.getElementById("btn-oculto");
    let menuOculto = document.getElementById("menu-oculto")

    btnMenu.onclick = function(){
        btnOculto.classList.remove('d-none');
        menu.classList.add('d-none');
    }

    btnOculto.onclick = function(){
        btnOculto.classList.add('d-none');
        menu.classList.remove('d-none');
    }

})
