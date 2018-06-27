<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
      <li class="active"><a href="/factura/add">CREAR FACTURA</a></li>
      <li><a href="/factura">REGISTRO DE FACTURAS</a></li>
        </ul>
  </div>
</nav>
  
<div class="container">
  
    
       <div class="row">
  <h2>INGRESE DATOS </h2>
</div>
<div class="row">
  <div class="col-sm-6">
  <form class="form-horizontal" method="post" action="/factura/add">
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Alumno:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="ingrese nombre" name="nombre" required>
      </div>
      </div>
     
        <div class="form-group">
      <label class="control-label col-sm-2" for="direccion">Dirección:</label>
      <div class="col-sm-10">          
        <input type="street-address" class="form-control" id="direccion" placeholder="Ingrese direccion" name="direccion" required>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="row">
  <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Ingrese Monto en S/. :</label>
      <div class="col-sm-10">          
        <input type="text" value="120.0"class="form-control" id="pwd" placeholder="Ingrese monto" name="monto" required>
      </div>
      </div>
      </div>
      <div class="row">
     
     
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Pension:</label>
        <div class="col-sm-6"> 
          <select class="form-control" id="pwd" name="descripcion">
        
    
            <option value="Enero">Enero</option> 
             <option value="Febrero">Febrero</option> 
             <option value="Marzo">Marzo</option> 
             <option value="Abril">Abril</option> 
             <option value="Mayo">Mayo</option> 
             <option value="Junio">Junio</option> 
             <option value="Julio">Julio</option> 
             <option value="Agosto">Agosto</option> 
             <option value="Septiembre">Septiembre</option> 
             <option value="Octubre">Octubre</option> 
             <option value="Noviembre">Noviembre</option> 
             <option value="Diciembre">Diciembre</option> 
           </select>

          </div>
      </div>
        </div>
        <div class="row">
        <center>
      <div class="form-group" >    
      
      <div class="col-sm-4" >
        <button type="submit" class="btn btn-default">ENVIAR</button>
      </div>
    </div>
    </div>
    </center>
      
   </div>
    

      
  </form>

</div>
</div>

</body>
</html>