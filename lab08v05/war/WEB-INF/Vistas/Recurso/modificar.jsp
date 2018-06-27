<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelo.recurso.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">
<script type="text/javascript" src="/js/jQuery.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<style>
.titulo {
	/*color:inherit;*/
	color: inherit;
	margin-bottom: 20px;
}

.alert {
	padding: 10px;
}
</style>
<script type="text/javascript">
</script>
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
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/resources/add">INSERTAR RECURSO</a></li>
			<li><a href="/resources">REGISTRO DE RECURSOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">MODIFICAR REGISTRO</h3>

				<%
				Recurso rec = (Recurso)request.getAttribute("recurso");
				%>
				<form id="form1" class="form-horizontal" action="/resources/view"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input type="text" hidden name="id" value=<%= rec.getId() %>>
							<input class="form-control" placeholder="Ingrese URL del Recurso"
								name="url" type="text" required=""
								value=<%= rec.getUrl() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!rec.isEstado()) {%>
								<option <%="selected"%>>INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<a href="/resources" class="btn btn-danger">CANCELAR</a>
						<button class="btn btn-success" id="enviar" type="submit">MODIFICAR
							DATOS</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>