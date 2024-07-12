<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    body{
	background:black;
}
/*cabecera*/
.header {
    background-color: #af190c;
    color: #fff;
    padding: 10px 20px;
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    z-index: 1000;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-family: system-ui;
}
.logo {
    font-size: 24px;
    font-weight: bold;
}

.logo a {
  text-decoration: none;
  color: white;
  font-weight: bold;
  transition: transform 0.3s, color 0.3s; 
}

.logo a:hover {
  transform: scale(1.1); 
  color: #0ab500; 
}

.user-info a{
text-decoration: none;
color: white;
font-weight: bold;
}

.user-btn {
    background-color: transparent;
    border: none;
    color: #fff;
    cursor: pointer;
    font-size: 18px;
}
.tooltip {
    margin-right: 3%;
    display: flex;
}
.user-btn:hover + .tooltiptext, .tooltiptext:hover {
    display: block;
}
.tooltiptext {
    display: none;
    position: absolute;
    bottom: -28px;
    left: 95%;
    transform: translateX(-50%);
}
#cerrar-sesion-btn {
    background-color: #1df700;
    color: black;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    font-weight: bold;
}

/*cuerpo*/




.sidebar {
 position: fixed;
 top: 47px;
 right: 0;
 width: 27vw;
}


.btnPaqueteHeader a{
margin-left: 70px;
color: #14f314;
}


    /* Estilo para el contenedor de favoritos */
    .favoritos {
        display: flex;
        flex-direction: column;
        height: 88vh;
        overflow-y: auto;
        background: #1c1c1c;
        padding: 10px;
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
        margin-top: 20px;
        margin-right: 5px;
    }
    
    
    
    
    
    
    
    
    .contenedor-video {
        background: white;
        position: relative;
        margin-left: 6vw;
        margin-top: 90px;
    }
</style>
</head>
<body>


    <div class="header">
    
        <div class="user-info">
        	<a>${sessionScope.nombre}</a>
        	<a>${sessionScope.apellido}</a>
        	<div class="btnPaqueteHeader">
        		<a  id="botonPaquete" href="#"></a>
        	</div>
        </div>
        
        <div class="logo" id="logo"><a href="MenuHome.jsp">VideoTeca</a></div>

        
		<!-- Contenedor del botón de usuario -->
		<div class="tooltip" onmouseover="mostrarCerrarSesion()" onmouseout="ocultarCerrarSesion()">
		    <!-- Botón de usuario -->
		    <span class="user-btn">&#128100;</span>
		    <!-- Tooltip -->
		    <div class="tooltiptext" id="tooltip">
		        <!-- Botón de cerrar sesión -->
		        <button id="cerrar-sesion-btn" onclick="cerrarSesion()" onmouseover="mostrarCerrarSesion()" onmouseout="ocultarCerrarSesion()">Cerrar sesión</button>
		        <!-- Botón de información -->
		        <button id="cerrar-sesion-btn" onclick="redirigirUsuario()">Información</button>
		    </div>
		</div>
        
    </div>
    
    <div class="content">
    
    	<div class="contenedor-video">
          
                <div class="video">
                    <jsp:include page="video.jsp" />
                </div>
            
        </div>
    
        <div class="sidebar">
            <div class="favoritos" >
               <jsp:include page="favoritos2.jsp" />
            </div>
        </div>
        
    </div>


    
    
<script type="text/javascript">
    //fuciones para btn de cerrar cesion
    // Función para mostrar el botón de cerrar sesión en el tooltip
    function mostrarCerrarSesion() {
        var cerrarSesionBtn = document.getElementById("cerrar-sesion-btn");
        cerrarSesionBtn.style.display = "inline-block";
    }

    // Función para ocultar el botón de cerrar sesión en el tooltip
    function ocultarCerrarSesion() {
        var cerrarSesionBtn = document.getElementById("cerrar-sesion-btn");
        cerrarSesionBtn.style.display = "none";
    }

    // Función para redirigir a usuario.jsp
    function redirigirUsuario() {
        window.location.href = "infoUsuario.jsp";
    }

    // Función para enviar la solicitud a ServletUsuario con acción 'cerrar'
    function cerrarSesion() {
        // Aquí se puede hacer la llamada AJAX para enviar la solicitud al servlet
        // Por simplicidad, se redirige directamente a la URL deseada
        window.location.href = "ServletUsuario?accion=cerrar";
    }
    
    //funcion para el boton paquete
    window.onload = function() {
        var idTipoCuenta = "${sessionScope.idTipoCuenta}";
        var botonPaquete = document.getElementById("botonPaquete");

        if (idTipoCuenta === "1") {
            botonPaquete.innerHTML = "Free";
            botonPaquete.href = "paquetes2.jsp";
        } else {
            botonPaquete.innerHTML = "Premium";
        }
    };

    
</script>
</body>
</html>