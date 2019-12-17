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
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<link rel="stylesheet" href="assets/css/catalogo.css">
<%
    List<Producto> productos = Bd.consultaProductos();
    HttpSession sesion = request.getSession();
    int producto = 0;
    %>
    </head>
    <body>
        <!-- Header -->
					<header id="header" class="alt">
						<h1><a href="index.html">La Gallina Violeta</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
                                                                                    <% if(sesion.getAttribute("nick") != null){
                                                                                        if(sesion.getAttribute("perfil").toString().equals("administrador")){ %>
                                                                                            <li><a href="administracion.jsp">Administrar sitio</a></li>
                                                                                        <%}
                                                                                        %>
                                                                                        <li><a href="carritoUsuario.jsp">Carrito de <%=sesion.getAttribute("nick").toString() %></a></li>
                                        <% }else{ %>
                                            <li><a href="#banner">Home</a></li>
                                        <% }%>
											<li><a href="#cta">Pedidos</a></li>
                                            <li><a href="productos.jsp">Catálogo</a></li>
                                            <% if(sesion.getAttribute("nick") != null) {%><li><a href = "logOut.jsp">Cerrar sesión</a></li>
                                        <% }else{ %>
                                            <li><a href="SignUp.html">Iniciar sesión / Registrarse</a></li>
                                        <% } %>
											
											
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
    <div class="container">
    <div class="well well-sm">
        <div id="view" class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>

        
    <div id="products" class="row list-group">
        <% for(int i = 0; i < productos.size(); ++i){ producto = i;%>
        <div class="item  col-xs-4 col-md-3">
            <form action="" method="POST">
                <input type="text" value="<%=producto %>" name="id" id="id" hidden>
            <div class="thumbnail">
                <img class="group list-group-image" src="<%=productos.get(i).getFoto() %>" width="90%" height="90%" alt="<%=productos.get(i).getFoto() %>" />
              <div class="category">
                <h5 class="category-name"><%=Bd.consultaCategoria(productos.get(i).getCategoria()) %></h5>
              </div>
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        <%=productos.get(i).getNombre() %></h4>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                <%=(double)Math.round(productos.get(i).getPrecio() * 100d) / 100d %> Euros</p>
                        </div>
<div class="btn-group">
                      <!--<button class="btn btn-details" type="ServletDescripcion">Descripción</button>-->
                      <button class="btn btn-success" type="submit" formaction="ServletComprarProducto">Añadir al carrito</button>
  </div>
                 </div>
              </div>
              </div>
            </form>
            </div>



             <% } %>   
    </div>
    
</div>
    </div>
    <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
    <script src="assets/js/catalogo.js"></script>
    </body>
    
</html>

<!--
<div class="box">
            <div class="product">
                <span class="name"></span>
                <span class="description"></span>
            </div>
          </div>-->
