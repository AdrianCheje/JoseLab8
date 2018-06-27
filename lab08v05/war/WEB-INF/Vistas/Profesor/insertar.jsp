<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">
<script type="text/javascript" src="/js/jQuery.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>

</head>
<body>
	<header> <nav class="navbar navbar-default ">
	<div class="navbar-header">
		<!-- Id navegacion  debe coincidir con el nombre id de abajo-->
		<button class="navbar-toggle" data-toggle="collapse"
			data-target="#navegacion">
			<!-- Mostrar en dispositivos de lectura que no reconocen los iconens-->
			<span class="sr-only">Mostrar Navegacion</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a href="/" class="navbar-brand">Inicio Profesor</a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">INSERTAR</a></li>
			<li><a href="/profesor">REGISTRO DE DATOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
					 <h4><b>Insertar Profesor</b></h4>
				<form id="form1" class="form-horizontal" action="/profesor/insertar"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Nombre del Profesor" autofocus name="nombre"
								type="text" required="">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Apellido</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Apellido del Profesor" name="apellido"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Profesion</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese la direccion del Profesor" name="profesion"
								type="text" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Direccion</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese la direccion del Profesor" name="direccion"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-info">Email</label>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon">@</div>
								<input class="form-control"
									placeholder="Ingrese gmail del Profesor" name="email"
									type="email" required>
							</div>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-success" id="enviar" type="submit">Insertar
							Alumno</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>