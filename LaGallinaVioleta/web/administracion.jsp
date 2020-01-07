<%-- 
    Document   : administracion
    Created on : 06-ene-2020, 21:27:02
    Author     : alber
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="assets/css/comprarProducto.css">
      <link rel="stylesheet" href="assets/css/carritoUsuario.css">
  <link rel="stylesheet" href="assets/css/header.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<% 
    
    HttpSession sesion = request.getSession();
    List<Pedido> pedidos = Bd.consultaPedidos();
      %>
        <title>Filtrar pedidos</title>
    </head>
    <body> <!-- Header -->
					<header id="header" class="alt">
						<h1><a href="index.html">La Gallina Violeta</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
                                                                                    <li><a href="index.jsp">Home</a></li>
                                                                                    <% if(sesion.getAttribute("nick") != null){
                                                                                        if(sesion.getAttribute("perfil").toString().equals("administrador")){ %>
                                                                                            <li><a href="administracion.jsp">Administrar sitio</a></li>
                                                                                        <%}
                                                                                        %>
                                                                                        
                                                                                        <li><a href="carritoUsuario.jsp">Carrito de <%=sesion.getAttribute("nick").toString()%></a></li>
                                       
											<li><a href="pedidoUsuario.jsp">Pedidos</a></li>
                                                                                        <%
                                                                                            }%>
                                            <li><a href="productos.jsp">Productos</a></li>
                                            <% if(sesion.getAttribute("nick") != null) {%><li><a href = "logOut.jsp">Cerrar sesión</a></li>
                                        <% }else{ %>
                                            <li><a href="SignUp.html">Iniciar sesión / Registrarse</a></li>
                                        <% } 
%>
											
											
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
                      
<!-- partial:index.partial.html -->
<div class="container2">
    
    <form action="ServletFiltrado" method="POST">
        <br><br><br>
     <h1 style="color: #9954c7">Elija el intervalo de fechas <p>por el que desea filtrar</p></h1> 
     <div style="margin-left: 20%"><br>
     <p>Fecha de inicio:</p>
    <input type="date" name="fechaInicio" id="fechaInicio" class="form-control">
    <br> <br>
     </div>
     
  <div class="slideshow-buttons">
    <div class="one"></div>
    <div class="two"></div>
    <div class="three"></div>
    <div class="four"></div>
  </div>
  
  
     
  <div class="product">
      <br><br><br>
    
      <br><br><br>
      <div style="margin-top: 12%">
          <p>Fecha de fin:</p>
    <input type="date" name="fechaFin" id="fechaFin"><br>
     <br><br><br>
      </div>
    
     <div class="buttons" style="margin-left: -120%">
        <button type="submit" class="button fit primary">Añadir</button>
      
    </div>
  </div>
    </form>
     

</div>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="assets/js/comprarProducto.js"></script>
<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
<script src="assets/js/carritoUsuario.js"></script> 
    </body>
</html>
