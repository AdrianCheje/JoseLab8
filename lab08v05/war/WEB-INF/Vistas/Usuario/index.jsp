<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.usuario.Usuario"%>
<%@page import="modelo.role.Role"%>
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
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/users/add">INSERTAR</a></li>
			<li class="active"><a href="">REGISTRO DE DATOS</a>
		</ul>
	</div>
	</nav> </header>

	<!--TABLA -->
	<div class="container-fluid">
		<h4>
			<b>Registro de Datos de Usuarios</b>
		</h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Email</th>
					<th>Rol</th>
					<th>Estado</th>
				</tr>
				<% 
					List<Usuario> array = (List<Usuario>)request.getAttribute("array");
					List<Role> arrayRole = (List<Role>)request.getAttribute("arrayRol");
 					if(array.size() > 0) {	
 						int i = 0;
 						Role rol;
						for(Usuario usuario:array){
						 rol = arrayRole.get(i);
				%>
				<tr>
					<td><%= usuario.getNombre() %></td>
					<td><%= usuario.getApellido() %></td>
					<td><%= usuario.getEmail() %></td>
					<td><%= rol.getNombre() %></td>
					<td><%= usuario.getEstadoDescripcion()%></td>

					<td class='btn btn-group'><a
						href="/users/view?codigo=<%= usuario.getCodigo() %>"
						class="btn btn-primary btn-sm">Modificar</a> <a
						href="/users/delete?codigo=<%= usuario.getCodigo() %>"
						class="btn btn-danger btn-sm">Eliminar</a></td>
				</tr>
				<% i++;}
				} %>

			</table>
			<div class="text-center">
				<a href="/users" class="btn btn-success">ACTUALIZAR</a> <br>
			</div>

		</div>

	</div>
</body>
</html>