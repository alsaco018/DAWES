<%-- 
    Document   : carritoUsuario
    Created on : 01-ene-2020, 13:31:36
    Author     : alber
--%>

<%@page import="modelo.LineaPedido"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Bd"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <% 
    List<Producto> productos = Bd.consultaProductos();
    HttpSession sesion = request.getSession();
    int idPedido = (int) sesion.getAttribute("idPedido");
    List<LineaPedido> carrito = Bd.consultaLineaPedidos(idPedido);
    
    double total = 0;
      %>
      <link rel="stylesheet" href="assets/css/comprarProducto.css">
      <link rel="stylesheet" href="assets/css/carritoUsuario.css">
  <link rel="stylesheet" href="assets/css/header.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

        <title>Carrito</title>
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
                                                                                        //if(sesion.getAttribute("perfil").toString().equals("administrador")){ %>
                                                                                            <!--<li><a href="administracion.jsp">Administrar sitio</a></li>-->
                                                                                        <%//}
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
                                        
                                        
                                        <section>
  <!--for demo wrap-->
  <h1>Pedido</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Producto</th>
          <th>Precio</th>
          <th>Cantidad</th>
          
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
          <%
              for(int i = 0; i < carrito.size(); ++i){
              %>
        <tr>
            <td><%=Bd.consultaProducto(carrito.get(i).getProducto()) %></td>
            <td><%total += carrito.get(i).getPrecio(); %> <%= carrito.get(i).getPrecio()%> Euros</td>
            <td><%=carrito.get(i).getCantidad() %></td>
          
        </tr>
        <%
            }
%>
      </tbody>
    </table>
  </div>
</section>
      
      <section>
          <fieldset style="color: white">
              <table>
                  <tr>
                      <td>
                           Precio total: <%=(double)Math.round(total * 100d) / 100d %> euros
                      </td>
                      <td><form method="POST">
                              <input type="submit" class="button fit primary" formaction="ServletPagar" value="Pagar"></form></td>
                              <td> <form method="POST"><input type="submit" formaction="ServletBorrarCarrito" value="Borrar carrito">
               </form>
              
                      </td>
                  </tr>
              </table>
              
          </fieldset>
      </section>

              
                                        
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
