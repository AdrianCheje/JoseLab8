$(document).ready(function(){
	$('.btn-danger').click(function(){
		var a = confirm("Estas Seguro de Eliminar");
		if(!a){
			return false;
		}
	});

});