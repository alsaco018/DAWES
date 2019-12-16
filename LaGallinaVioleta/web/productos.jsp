<%-- 
    Document   : productos
    Created on : 16-dic-2019, 10:11:34
    Author     : alber
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Productos</title>
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel="stylesheet" href="assets/css/catalogo.css">
<%
    List<Producto> productos = Bd.consultaProductos();
    HttpSession sesion = request.getSession();
    %>
    </head>
    <body>
    <div class="container">
    <div class="well well-sm">
        <div id="view" class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>

        
    <div id="products" class="row list-group">
        <% for(int i = 0; i < productos.size(); ++i){ %>
        <div class="item  col-xs-4 col-md-3">
            <div class="thumbnail">
                <img class="group list-group-image" src="<%=productos.get(i).getFoto() %>" alt="" />
              <div class="category">
                <h5 class="category-name"><%=Bd.consultaCategoria(productos.get(i).getCategoria()) %></h5>
              </div>
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        <%=productos.get(i).getNombre() %></h4>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                <%=productos.get(i).getPrecio() %></p>
                        </div>
<div class="btn-group">
                      <a class="btn btn-details" href="">Descripción</a>
 <a class="btn btn-success" href="">Añadir al carrito</a>
  </div>
                 </div>
              </div>
              </div>
            </div>



             <% } %>   
    </div>
    
</div>
    </div>
    </body>
    <script src="assets/js/catalogo.js"></script>
</html>

<!--
<div class="box">
            <div class="product">
                <span class="name"></span>
                <span class="description"></span>
            </div>
          </div>-->
