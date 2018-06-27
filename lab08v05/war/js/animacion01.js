

/*Animacion Simple para sessionAlumno y Session Profesor .jsp*/

$(document).ready(function(){
$('.panel-title a').click(function () {
        /* var hermano=$(this).siblings();
         $(hermano[0]).toggle(600);
         */
        var padre = $(this).parent().parent();
        var tio = $(padre).siblings();
        $(tio[0]).toggle('fast');


    });
    }
);