<!DOCTYPE html>
<html lang="es" >
<head>
  <meta charset="UTF-8">
  <title>Cierre de sesi�n</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Neuton|Oswald'>
<link rel="stylesheet" href="assets/css/signUp.css"><script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>


</head>
<%
    HttpSession sesion = request.getSession();
        sesion.invalidate();
    %>
<body>
<!-- partial:index.partial.html -->
<p>
  Se ha 
  <span>
    CERRADO
  </span>
  &mdash; tu sesi�n. &mdash;
</p><br>
<p style="margin-top: 35%">

  
  <a style="text-decoration:none;color:white;" href="index.jsp" data-toggle="tooltip" data-placement="bottom" title="�Gracias por registrarte!">&mdash; Volver a la p�gina principal &mdash;</a>

</p>
<!-- partial -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

   


</body>
</html>