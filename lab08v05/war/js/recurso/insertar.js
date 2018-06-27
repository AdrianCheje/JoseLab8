
//INERTAR POR AJAX
$(document).ready(function () {
//Id del Formulario que ponemos 
	
	$('#form1').submit(function () {
		
		//DatosJSON : Datos del Formulario, los campos imput (Nombres, Apellidos Gmail y el resto)
		var datosJSON = $('#form1').serialize();
		//Metodo de Envio especificado en el Formulario (POST o GET)
		var metodo = $('#form1').attr("method");
		//A que servlet se va a ir los datos del Form /profesor/Insertar
		var action = $('#form1').attr("action");

		$.ajax({
			//Despues de Presionar enviar 
			beforeSend: function () {
				//Muestra simbolo de cargando ... Una animacion que se hizo en CSS
				$('#cargando').attr('class', 'preloader1');
				$('#resultado').text("");
			},
			method: metodo,
			url: action,
			data: datosJSON,
			success: function (data) {
				//Los datos se enviaron al Servidor y este da una RPTA : VER SERVLET controlador.profesor.insertar.java
				console.log(data);
				//Oculta el simbolo cargando ... Una animacion que se hizo con CSS
				$('#cargando').removeClass('preloader1');

				var charA = data.toString()[0];//VER: servlet controlador.profesor.insertar

				if (charA === "1") {

					var mensaje = "Recurso Insertardo al Sistema ";

					$('#resultado').html("<div class='alert alert-info'>\n\
							<button class='close' data-dismiss='alert'><span>&times;</span>\n\
							</button> <strong>" + "" + mensaje +
					"</strong></div>");
					//El formulario se reinicia con imput vacios (Nombre = "",Apellido="" y el resto)
					$('#form1')[0].reset();

				} else if(charA == "2"){

					var mensaje = "El Recurso ya existe en el Sistema";

					$('#resultado').html("<div class='alert alert-warning'>\n\
							<button class='close' data-dismiss='alert'><span>&times;</span>\n\
							</button> <strong>" + "" + mensaje +
					"</strong></div>");
					//El formulario se reinicia con imput vacios (Nombre = "",Apellido="" y el resto)
					
					
				}
				else {
					//EL servlet : controlador.profesor.insertar.java no mando NADA : ERROR
					
					var mensaje = "Fallo al intentar Insertar el Recurso al Sistema";

					$('#resultado').html("<div class='alert alert-danger'>\n\
							<button class='close' data-dismiss='alert'><span>&times;</span>\n\
							</button> <strong>" + "" + mensaje +
					"</strong></div>");


				} 

			},
			error: function (data) {
				//Si OCURRE UN FATAL ERROR: El servlet no es ENCONTRADO o SE demora demasiado
				//de devolver algo
				
				//Oculta el simobolo de Cargando y muestra el mensaje
				$('#cargando').removeClass('preloader1');
				
				$('#resultado').text("Se produjo un ERROR");
				console.log("Error " + data);
			},
			//TIEMPO MAXIMO de ESPERA de una RPTA por parte del SERVLET 10s
			timeout: 10000

		});
		//Para no se recargue la PAGINA y todo sea MEDIANTE AJAX
		return false;
	});

	//FUNCION SIN IMPORTANCIA , para un button reset
	$('#reset').click(function () {
		$('#form1')[0].reset();

	});
	

});