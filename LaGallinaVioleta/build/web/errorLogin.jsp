<!DOCTYPE html>
<html lang="es" >
<head>
  <meta charset="UTF-8">
  <title>Log in / Registro</title>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
<link rel="stylesheet" href="assets/css/logIn.css">
<script type="text/javascript">

  function compruebaContrasenna(){
      if(document.getElementById('pass').value !== document.getElementById('pass2').value){
        alert("Las contraseñas no coinciden");
        event.preventDefault();
        document.getElementById('pass').value = "";
        document.getElementById('pass2').value = "";
      }else{
        document.getElementById('formularioRegistro').action = "ServletRegistro";
      }
  }
  
</script>
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Log in</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Registrarse</label>
		<div class="login-form">
			<div class="sign-in-htm">
          <form action="ServletLogin" method="POST" name="form">
            <div class="group">
            <label for="nick" class="label">Nick</label>
              <input name="nick" id="nick" type="text" class="input">
            </div>
            <div class="group">
              <label for="pass0" class="label">Contraseña</label>
              <input name="pass0" id="pass0" type="password" class="input" data-type="password">
            </div>
            <!--<div class="group">
              <input id="check" type="checkbox" class="check" checked>
              <label for="check"><span class="icon"></span>Mantenerme conectado</label>
            </div>-->
            <div class="group">
              <input type="submit" class="button" value="Log in">
            </div>
            <div class="hr"></div>
            <div class="foot-lnk">
                <p style="color:red;">El nombre de usuario o contraseña no son correctos.</p>
            </div>
            </form>
      </div>
			<div class="sign-up-htm">
                            <form action="ServletRegistro" method="POST" ><!--id="formularioRegistro" enctype="multipart/form-data"--> 
            <div class="group">
              <label for="user" class="label">Nick</label>
              <input name="user" id="user" type="text" class="input">
            </div>
            <div class="group">
              <label for="pass" class="label">Contraseña</label>
              <input name="pass" id="pass" type="password" class="input" data-type="password">
            </div>

            <div class="group">
              <label for="nombre" class="label">Nombre</label>
              <input name="nombre" id="nombre" type="text" class="input">
            </div>
              
              <div class="group">
              <label for="apellidos" class="label">Apellidos</label>
              <input name="apellidos" id="apellidos" type="text" class="input">
            </div>
              
              <div class="group">
              <label for="direccion" class="label">Direccion</label>
              <input name="direccion" id="direccion" type="text" class="input">
            </div>
                           
            <div class="group">
                <input type="submit" class="button" value="Registrarse">

            </div>
                                
            <!--<div class="group">
              <label for="pass2" class="label">Vuelve a escribir la contraseña</label>
              <input id="pass2" type="password" class="input" data-type="password">
              
            </div>-->
            </form>
            <div class="hr"></div>
            <div class="foot-lnk">
              <label for="tab-1">¿Ya perteneces a la web?</a>
            </div>
            
			</div>
		</div>
	</div>
</div>

</body>
</html>