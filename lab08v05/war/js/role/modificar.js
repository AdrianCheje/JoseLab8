//MODFICAR POR AJAX
$(document).ready(function () {
	
	//ID  DEL Formulario 
	$('#form1').submit(function () {
		
		//Obtiene los datos del Formulario
		var datosJSON = $('#form1').serialize();
		//Metodo de envio : POST o GET
		var metodo = $('#form1').attr("method");
		var action = $('#form1').attr("action");

		$.ajax({
			//Despues de PRESIONAR MODIFICAR 
			beforeSend: function () {
				//Muestra Animacion de simbolo de cargando ...
				$('#cargando').attr('class', 'preloader1');
				$('#resultado').text("");
			},
			method: metodo,
			url: action,
			data: datosJSON,
			success: function (data) {
				console.log(data);
				//El servidor envio una rpta : el servlet controlador.profesor.modificar.java
				//Oculta el Simbolo cargando ...
				$('#cargando').removeClass('preloader1');

				
				var charA = data.toString()[0];

				//VER SERVLET: Yo imprimo en el servlet 1 si realizo la tarea Correctamente, tambien puede
				//Imprimir otro valor 
				//Servlet   out.print("ok"); y en ESTE ARCHIVO cambian a data === "ok" LISTO
				if (charA === "1") {
					
					//ESTA IGUAL QUE INSERTAR solo Modifico el mensaje 
					var mensaje = "Rol modificado en el Sistema ";

					$('#resultado').html("<div class='alert alert-info'>\n\
							<button class='close' data-dismiss='alert'><span>&times;</span>\n\
							</button> <strong>" + "" + mensaje +
					"</strong></div>");
					
				} else if(charA === "2"){
					
					var mensaje = "El rol ya existe en el Sistema";

					$('#resultado').html("<div class='alert alert-warning'>\n\
							<button class='close' data-dismiss='alert'><span>&times;</span>\n\
							</button> <strong>" + "" + mensaje +
					"</strong></div>");
					//El formulario se reinicia con imput vacios (Nombre = "",Apellido="" y el resto)
					
				}
				
				else {
					var mensaje = "Fallo al tratar de Modificar el El en el Sistema";

					$('#resultado').html("<div class='alert alert-danger'>\n\
							<button class='close' data-dismiss='alert'><span>&times;</span>\n\
							</button> <strong>" + "" + mensaje +
					"</strong></div>");


				} 

			},
			error: function (data) {
				//Si ocurre un error, por ejemplo la pagina dejo de exisitir
				//Oculta el simobolo de Cargando y muestra el mensaje
				$('#cargando').removeClass('preloader1');

				$('#resultado').html("<div class='text-danger'>Se produjo un Error</div>");
				console.log("Error " + data);
			},
			//Sirve el tiempo de espera maximo para la respuesta
			timeout: 10000

		});
		return false;
	});


});