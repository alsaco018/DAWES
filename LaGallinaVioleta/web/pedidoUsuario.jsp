<%-- 
    Document   : pedidoUsuario
    Created on : 02-ene-2020, 22:31:05
    Author     : alber
--%>

<%@page import="modelo.Pedido"%>
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
    
    HttpSession sesion = request.getSession();
    String idCl = sesion.getAttribute("idCliente").toString();
    int idCliente = Integer.parseInt(idCl);
    List<Pedido> pedidos = Bd.consultaPedidos(idCliente);
    
    double total = 0;
      %>
      <link rel="stylesheet" href="assets/css/comprarProducto.css">
      <link rel="stylesheet" href="assets/css/carritoUsuario.css">
  <link rel="stylesheet" href="assets/css/header.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

        <title>Pedidos</title>
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
  <h1>Pedidos de <%=sesion.getAttribute("nick") %></h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Id</th>
          <th>Direccion</th>
          <th>Fecha</th>
          
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
          <%
              for(int i = 0; i < pedidos.size(); ++i){
              %>
        <tr>
            <td><%=pedidos.get(i).getIdPedido() %></td>
            <td><%=pedidos.get(i).getDireccion() %></td>
            <td><%=pedidos.get(i).getFecha()%></td>
          
        </tr>
        <%
            }
%>
      </tbody>
    </table>
  </div>
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
