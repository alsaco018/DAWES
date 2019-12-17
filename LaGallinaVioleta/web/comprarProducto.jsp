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

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
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
      <input type="number" name="cantidad" style="margin-left: -156%">
  </div>
    <p class="desc"><%=prod.getDescripcion() %></p>
    <div class="buttons">
        <button type="submit" class="add">Añadir al carrito</button>
      
    </div>
  </div>
    </form>
</div>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="assets/js/comprarProducto.js"></script>

</body>
</html>