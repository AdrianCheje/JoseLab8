<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modelo.acceso.*" %>
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
<script>
            $(document).ready(function(){
                $('.btn-danger').click(function(){
                    var a = confirm("Estas Seguro de Eliminar");
                    if(!a){
                        return false;
                    }
                });
                
            });
            
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
			<li><a href="/access/add">INSERTAR ACCESO</a></li>
			<li class="active"><a href="">REGISTRO DE ACCESOSS</a>
		</ul>
	</div>
	</nav> </header>

	<br>
	<!--TABLA -->
	<div class="container">
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo Acceso</th>
					<th>Role</th>
					<th>Recurso</th>
					<th>Estado</th>
					<th></th>
				</tr>
				<% 
					List<AccesoAux> array = (List<AccesoAux>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(AccesoAux accesoAux:array){
				%>
				<tr>
					<td><%= accesoAux.getId() %></td>
					<td><%= accesoAux.getRole() %></td>
					<td><%= accesoAux.getRecurso() %></td>
					<td><%= accesoAux.estadoDescripcion() %></td>

					<td class='btn btn-group'>
						<a href="/access/view?id=<%= accesoAux.getId() %>" class="btn btn-primary btn-sm">Modificar</a> 
						<a href="/access/delete?id=<%= accesoAux.getId() %>" class="btn btn-danger btn-sm">Eliminar</a>
					</td>
				</tr>
				<% }
				} %>
				
			</table>
			<div class="text-center">
			<a href="/access" class="btn btn-success">ACTUALIZAR</a>
			<br>
			</div>
			
		</div>

	</div>
</body>
</html>