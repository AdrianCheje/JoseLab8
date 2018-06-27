<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modelo.profesor.Profesor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">
<script type="text/javascript" src="/js/jQuery.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/profesor/eliminar.js"></script>

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
			<li><a href="/profesor/insertar">INSERTAR</a></li>
			<li class="active"><a href="">REGISTRO DE DATOS</a>
		</ul>
	</div>
	</nav> </header>

	<!--TABLA -->
	<div class="container-fluid">
	 <h4><b>Registro de Datos de Profesores</b></h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Profesion</th>
					<th>Direccion</th>
					<th>Email</th>
					<th>Estado</th>

				</tr>
				<% 
					List<Profesor> array = (List<Profesor>)request.getAttribute("array");
				
					if(array.size() > 0) {	
						for(Profesor prof:array){
				%>
				<tr>
					<td><%= prof.getNombre() %></td>
					<td><%= prof.getApellido() %></td>
					<td><%= prof.getProfesion() %></td>
					<td><%= prof.getDireccion() %></td>
					<td><%= prof.getEmail() %></td>
					<td><%= prof.getEstadoDescripcion()%></td>

					<td class='btn btn-group'>
						<a href="/profesor/modificar?codigo=<%= prof.getCodigo() %>" class="btn btn-primary btn-sm">Modificar</a> 
						<a href="profesor/eliminar?codigo=<%= prof.getCodigo() %>" class="btn btn-danger btn-sm">Eliminar</a>
					</td>
				</tr>
				<% }
				} %>
				
			</table>
			<div class="text-center">
			<a href="/profesor" class="btn btn-success">ACTUALIZAR</a>
			<br>
			</div>
			
		</div>

	</div>
</body>
</html>