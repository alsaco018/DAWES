<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Bd"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <% 
    List<Producto> productos = Bd.consultaProductos();
    HttpSession sesion = request.getSession();
    int id = Integer.parseInt(sesion.getAttribute("productoActual").toString());
    Producto prod = productos.get(id);
      %>
  <title><%=prod.getNombre() %></title>
  <link rel="stylesheet" href="assets/css/comprarProducto.css">
  <link rel="stylesheet" href="assets/css/header.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

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
    <% if(sesion.getAttribute("nick") != null){ %>
    <form action="ServletCompra" method="POST">
        <input type="text" value="<%=prod.getId() %>" hidden name="id" id="id">
  <div>
      <img src="<%=prod.getFoto() %>" width="50%" height="50%" />
  </div>
  <div class="slideshow-buttons">
    <div class="one"></div>
    <div class="two"></div>
    <div class="three"></div>
    <div class="four"></div>
  </div>
  
  
  
  <div class="product">
    <p><%=Bd.consultaCategoria(prod.getCategoria())%></p>
    <h1><%=prod.getNombre() %></h1>
    <h2><%=(double)Math.round(prod.getPrecio() * 100d) / 100d %> Euros<input type="text" value="<%=prod.getPrecio() %>" hidden name="precio" id="precio"></h2>
    <div class="sizes" style="margin-top: -1%">
      <p class="pick"  style="margin-top: -50%; margin-left: -44%">Cantidad</p>
      <input type="number" name="cantidad"  style="margin-left: -156%" min="1" max="20"  autofocus>
  </div>
    <p class="desc"><%=prod.getDescripcion() %></p>
    <div class="buttons">
        <button type="submit" class="button fit primary">Añadir</button>
      
    </div>
  </div>
    </form>
    <%}else{ %>
    <div>
        <h1 style="color: red"><br>Debes logearte para poder realizar una compra.</h1><br>
        <div align="center"><form><button class="button fit primary" type="submit" formaction="SignUp.html">Log in</button></form></div>
    </div>
             
<%} %>
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
</body>
</html>