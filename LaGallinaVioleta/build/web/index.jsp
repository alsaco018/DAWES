<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>La Gallina Violeta</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="landing is-preload">
            <%
              
            HttpSession sesion = request.getSession();
            
                %>
		<!-- Page Wrapper -->
			<div id="page-wrapper">

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

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<h2>La Gallina Violeta</h2>
							<p>La Gallina Violeta es un proyecto de vida. <br>Un lugar especial donde cualquiera puede acudir y adquirir huevos y pollos de campo, pan ecológico y verduras ecológicas.<br> Es el entorno adecuado para reuniones de grupos, encuentros y retiros cortos.
							</p>
							
						</div>
						<a href="#one" class="more scrolly">Saber mas</a>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style1 special">
						<div class="inner">
							<header class="major">
								<h2>Un modo de autoabastecimiento donde ofrecer diferentes productos producidos en pequeñas cantidades,<br> con calidad y buen precio.</h2>
								<p>La Gallina Violeta reparte productos ecológicos a las personas consumidoras sin intermediarios. Antonio Guillén, explica que este proyecto reduce el impacto medioambiental ya que todo se produce de artesanal.</p>
							</header>
							<ul class="icons major">
								<li><span class="icon solid fa-pepper-hot major style1"><span class="label">Lorem</span></span></li>
								<li><span class="icon solid fa-bread-slice major style2"><span class="label">Ipsum</span></span></li>
								<li><span class="icon solid fa-glass-cheers major style3"><span class="label">Dolor</span></span></li>
							</ul>
						</div>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper alt style2">
						<section class="spotlight">
							<div class="image"><img src="images/panes.jpg" alt="" /></div><div class="content">
								<h2>Pan</h2>
								<p>Elaboramos una amplia variedad de panes, que podrás probar en tu próximo pedido.</p>
							</div>
						</section>
						<section class="spotlight">
							<div class="image"><img src="images/celebraciones.jpg" alt="" /></div><div class="content">
								<h2>Ven a celebrar tu fiesta a<br /> 
									La Gallina Violeta
								</h2>
								<p>Celebra con nosotros esa reunión, comida o celebración.<br>Y disfruta de la paz y la intimidad del campo</p>
							</div>
						</section>
						<section class="spotlight">
							<div class="image"><img src="images/comidas.jpg" alt="" /></div><div class="content">
								<h2>Ven a comer</h2>
								<p>Preparamos nuestras maravillosas comidas.<br>Para que tú y los tuyos disfruteis de un plan diferente.</p>
							</div>
						</section>
					</section>

				<!-- Three 
					<section id="three" class="wrapper style3 special">
						<div class="inner">
							<header class="major">
								<h2>Accumsan mus tortor nunc aliquet</h2>
								<p>Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet eleifend<br />
								fringilla tincidunt. Nullam dui leo Aenean mi ligula, rhoncus ullamcorper.</p>
							</header>
							<ul class="features">
								<li class="icon fa-paper-plane">
									<h3>Arcu accumsan</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon solid fa-laptop">
									<h3>Ac Augue Eget</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon solid fa-code">
									<h3>Mus Scelerisque</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon solid fa-headphones-alt">
									<h3>Mauris Imperdiet</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-heart">
									<h3>Aenean Primis</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-flag">
									<h3>Tortor Ut</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
							</ul>
						</div>
					</section>-->

				<!-- CTA -->
					<section id="cta" class="wrapper style3">
						<div class="inner">
							<header>
								<h2>Haz tu pedido</h2>
								<p>Realiza tu pedido y te lo enviaremos a casa.</p>
							</header>
							<ul class="actions stacked">
								<li><a href="productos.jsp" class="button fit primary">Hacer pedido</a></li>
								
							</ul>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							
							<li><a href="https://es-es.facebook.com/LaGallinaVioleta" class="icon brands fa-facebook-f" target="_blank"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<ul class="copyright">
							<li>&copy; Hecho por Alberto Saldaña Contreras</li>
						</ul>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>