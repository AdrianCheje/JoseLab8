<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modelo.factura.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
	 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<title></title>
</head>
<body>
	<nav class="nav nav-tabs">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../index.html">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/factura/add">CREAR FACTURA</a></li>
      <li class="active"><a href="/factura">REGISTRO DE FACTURAS</a></li>
        </ul>
  </div>
</nav>
<br>
 <div class="col-sm-10"></div>
  	<div >
			<a href="/factura" class="btn btn-success">ACTUALIZAR</a>
			<br>
			</div>
<br>
 

		<div class="table-responsive  ">
			<table class="table table-sm table-dark">
 				 <thead>
			
				<tr>
					<th>Codigo Factura</th>
					<th>Alumno</th>
					<th>Pensión</th>
					<th>Monto</th>
					<th>Fecha</th>
					<Th>Dirección</th>
					<Th>Estado</th>
					

				</tr>
				  </thead>
				   <tbody>	
				
				<% 
					List<Factura> array =(List<Factura>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Factura prof:array){
				%>
				<tr>
					<td><%= prof.getCodigo() %></td>
					<td><%= prof.getCustomer() %></td>
					<td><%= prof.getPension() %></td>
					<td><%= prof.getPrice() %></td>
					<td><%= prof.getDate()%></td>
					<td><%= prof.getAddress() %></td>
					<td><%= prof.getStatus() %></td>
					
					<td >
						<a href="/factura/modificar?codigo=<%= prof.getCodigo() %>" class="btn btn-primary">Modificar</a> 
						<a href="/factura/delete?codigo=<%= prof.getCodigo()%>" class="btn btn-primary">Eliminar</a>
					</td>
					
				
				</tr>
				<% }
				} %>
				</tbody>
			</table>
		
		
	

</body>
</html>