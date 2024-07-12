<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>VideoTeca</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
body, html {
background: #1c1c1c;
   height: 100%;
   margin: 0;
}
.header {
    background-color: #af190c; /* Color de fondo del header */
    color: #fff; /* Color del texto del header */
    padding: 10px 20px; /* Espaciado interno del header */
    position: fixed; /* Fijamos la posición del header */
    top: 0; /* Lo colocamos en la parte superior de la ventana */
    left: 0;
    width: 100vw; /* Ancho de la ventana */
    z-index: 1000; /* Aseguramos que esté por encima de otros elementos */
    display: flex; /* Utilizamos flexbox */
    justify-content: space-between; /*      Alineamos el contenido con espacio entre ellos */
    align-items: center; /* Centramos verticalmente el contenido */
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


.content {
    display: flex;
    height: 100%;
}
.sidebar {
    background-color: #000;
    /* Fijamos la posición del sidebar */
    position: fixed;
    top: 47px; /* Ajusta según la altura de tu encabezado (header) */
    left: 0;
    bottom: 0;
    /* Definimos un ancho fijo para el sidebar */
    width: 20vw; /* Puedes ajustar este valor según tus necesidades */
    overflow-y: auto; /* Agrega scroll si el contenido es más largo que la altura del sidebar */
}
.sidebar h4 {
text-align: center;
color: #20ebd1;
}
/*estilo del grid de videos*/
.main-content {
    background: #1c1c1c;
    margin-top: 60px;
    margin-left: 20vw; /* Igual al ancho del sidebar */
    height: 100%; /* Ocupa todo el alto disponible */
    width: 80vw; /* Ancho restante después del sidebar */
    padding: 5px 10px;
}
/*fin estilo grid de videos*/
.categoria-btn {
    display: block;
    margin-bottom: 10px;
    padding: 5px 10px;
    background-color: #ccc;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.categoria-grid {
    padding: 10px 10px;
    height: 60%;
}

.ayuda {
    flex-direction: column;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
}

/* Estilo del botón */
.ayuda button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    background: green;
    transition: background-color 0.3s, color 0.3s;
}

/* Estilo del botón en estado normal */
.ayuda button.button-normal {
    background-color: #3498db; /* Color de fondo del botón */
    color: #ffffff; /* Color del texto del botón */
}

/* Estilo del botón al pasar el mouse sobre él */
.ayuda button:hover {
    background-color: red; /* Color de fondo del botón al pasar el mouse */
}

/* Estilo del botón cuando está activo o presionado */
.ayuda button:active {
    background-color: #1f618d; /* Color de fondo del botón al estar activo */
}


.categoria-btn:hover {
    background-color: #bbb;
}

/* Estilos básicos de la categoría botones */
/* Estilos básicos de la categoría */
.categoria-info {
    margin-bottom: 10px;
    display: inline-block; /* Agregar esta línea para que los elementos estén en línea */
}

/* Estilos del enlace a */
.categoria-info a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #3498db;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    margin-left: 0.5vw;
}

/* Estilos de hover para el efecto de temblor */
.categoria-info a:hover {
    animation: shake 0.5s;
}

/* Animación de temblor */
@keyframes shake {
    0% { transform: translate(0, 0); }
    10%, 20% { transform: translate(-2px, 0); }
    30%, 50%, 70%, 90% { transform: translate(2px, 0); }
    40%, 60%, 80% { transform: translate(-2px, 0); }
    100% { transform: translate(0, 0); }
}


/*boton flotante*/
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
/*contenedor de cada video*/
.video-container {
    background: black;
    border-radius: 30px;
    padding-bottom: 10px;
    transition: transform 0.3s, box-shadow 0.3s;
}

.video-container:hover {
    transform: scale(1.05); /* Aplica un pequeño zoom */
    box-shadow: 0 0 50px rgba(255, 255, 255, 2); /* Ilumina el contorno */
}
/*fin de contenedor de video*/


iframe{
    border-radius:30px;
}

.btnPaqueteHeader a{
    margin-left: 70px;
    color: #14f314;
}

.buscador {
display: flex;
align-items: center;
width: 100%;
justify-content: center;
margin-top: 30px;
margin-bottom: 15px;
}
.buscador input {
    width: 50%;
    padding: 12px 20px;
    border: 1px solid #ccc;
    border-radius: 30px;
    background-color: #fff;
    font-size: 16px;
    transition: border-color 0.3s, box-shadow 0.3s;
    outline: none;
    margin-right: 5px;
}
.buscador input::placeholder {
    color: #aaa;
}
.buscador input:focus {
    border-color: #6200ea;
    box-shadow: 0 0 10px rgba(98, 0, 234, 0.2);
}
     .buscador a {
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    background: #6200ea;
    color: white;
    border: none;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    text-decoration: none;
    margin-top: 26px;
}
.buscador a:hover {
    background: #4500b5;
}
.buscador a i {
    font-size: 16px;
}





/* Estilos para el modal */
.modal {
margin-top: 70px;
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
        border-radius: 30px;
        background-color: #ff7434;
    margin: auto; /* Centrado horizontal y vertical */
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 400px; /* Ancho máximo del modal */
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}


.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.redes {
           display: flex;
           align-items: center;
           justify-content: center;
           width: 100%;
           margin-bottom: 20px;
}

.redes a{
    margin: 10px;
color: wheat;
}

/*CHATBOT*/
        .chatbot-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 100px;
            height: 100px;
            cursor: pointer;
            z-index: 1000;
            transition: transform 0.3s ease;
        }
        
        .chatbot-icon img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .chatbot-icon:hover {
            transform: scale(1.1);
        }
        
        .chatbot-popup {
            display: none;
            position: fixed;
            bottom: 120px; /* Adjusted for new icon size */
            right: 20px;
            width: 400px;
            height: 600px;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            border:none;
        }
        
        .chatbot-popup iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 50%;
            padding: 5px;
            width: 25px;
            height: 25px;
            text-align: center;
            line-height: 15px;
            font-weight: bold;
            z-index: 1001;
        }
        
        @keyframes vibrate {
            0% { transform: translateX(0); }
            25% { transform: translateX(-2px); }
            50% { transform: translateX(2px); }
            75% { transform: translateX(-2px); }
            100% { transform: translateX(0); }
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
        <div class="sidebar">
        	<div class="buscador">
		        <input type="text" id="buscadorInput" placeholder="Buscar..." />
		        <a href="#" onclick="buscarPalabraPag()"><i class="fas fa-search"></i></a>
		    </div>
			<h4>Favoritos</h4>
                        <div class="categoria-grid" id="lista-categorias"></div>
                        <div class="ayuda">
                        <div class="redes">
                        <!-- Icono de cerrar (X) -->
                        <a href="registroVideo.jsp" class="close">&times;</a>

                        <!-- Icono de Facebook -->
                        <a href="https://www.facebook.com/tupagina" target="_blank"><i class="fab fa-facebook"></i></a>

                        <!-- Icono de Instagram -->
                        <a href="https://www.instagram.com/tuinstagram" target="_blank"><i class="fab fa-instagram"></i></a>
					            	
            	</div>
            	 <!-- Botón para abrir el formulario modal -->
            		<button onclick="abrirModal()">Enviar Mensaje</button>
            </div>
        </div>
        <div class="main-content">
            <!-- Contenido principal 
            <jsp:include page="home.jsp" />-->
        </div>
    </div>
    
    
        <!-- Formulario modal para enviar mensaje -->
<!-- Formulario modal -->
<div id="modalMensaje" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModal()">&times;</span>
        <h2>Enviar Mensaje</h2>
        <form id="formMensaje" action="ServletReportComent?accion=guardar" method="post">
            <input type="hidden" name="idUserPag" value="${sessionScope.id}">
            <label for="comentario">Comentario:</label><br>
            <textarea id="comentario" name="comentPag" rows="4" cols="50"></textarea><br><br>
            <input type="submit" value="Enviar">
        </form>
    </div>
</div>

<!-- chat bot -->
    <div class="chatbot-icon" id="chatbotIcon" onclick="toggleChatbot()">
        <img src="imagenes/bot.png" alt="Chatbot Icon">
    </div>

    <div class="chatbot-popup" id="chatbotPopup">
        <div class="close-btn" onclick="toggleChatbot()">×</div>
        <iframe src="https://landbot.online/v3/H-2533554-AL69X0GS74IFEB7E/index.html"></iframe>
    </div>

    <script>
        function toggleChatbot() {
            var popup = document.getElementById('chatbotPopup');
            if (popup.style.display === 'none' || popup.style.display === '') {
                popup.style.display = 'block';
            } else {
                popup.style.display = 'none';
            }
        }

        function vibrateIcon() {
            var icon = document.getElementById('chatbotIcon');
            icon.style.animation = 'vibrate 0.3s linear infinite';
            setTimeout(function() {
                icon.style.animation = '';
            }, 300);
        }

        setInterval(vibrateIcon, 5000); // Vibrate every 5 seconds
    </script>
<!--  fin chat bot -->
            


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    cargarCategorias();
    verVideosDeCategoria(0);

    function cargarCategorias(){
        $.get("ServletCategoriaJSON", function(response){    
            // Recorrer la respuesta
            $.each(response, function(index, categoria){
                // Crear un elemento de lista por cada categoría
                var categoriaHTML = '<div class="categoria-info">';
                categoriaHTML += '<a href="#" onclick="verVideosDeCategoria(' + categoria.idCategoria + ')">' + categoria.nombreCategoria + '</a>';
                categoriaHTML += '</div>';

               
                $("#lista-categorias").append(categoriaHTML);
            });
        });
    }
    
    // Función para ver los videos de una categoría
    function verVideosDeCategoria(idCategoria) {
    	console.log("ID de la categoría:", idCategoria);
    	
        if (idCategoria === 0) {
            // Si no se presionó ningún botón, cargar la página home.jsp directamente
            $(".main-content").load("home.jsp");
        } else {
        	$.get("ServletVideoJSON?idCategoria=" + idCategoria, function(response){    
                $(".main-content").load("home.jsp");
            }); 
        }
    }
    
    $(document).ready(function() {
        // Agregamos el evento de clic al elemento de logo
        $("#logo").click(function() {
            // Realizamos una solicitud AJAX al servlet con el parámetro especial 'borrar'
            $.get("ServletVideoJSON?idCategoria=0", function(response){    
                // Si la solicitud se realiza correctamente, recargar la página home.jsp
                $(".main-content").load("home.jsp");
            });
        });
    });
    
    
    
    
    
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

<!-- para buscar la palabra -->
<script>
    function buscarPalabraPag() {
        // Obtener el valor del input de búsqueda
        var palabra = document.getElementById("buscadorInput").value;
        
        console.log(palabra);
        // Redirigir al servlet con la palabra como parámetro
        window.location.href = "ServletVideo?accion=buscarVi&palabraPag=" + palabra;
    }
</script>


<!-- para enviar mensaje -->
<script>
    // Función para abrir el modal
    function abrirModal() {
        document.getElementById("modalMensaje").style.display = "block";
    }

    // Función para cerrar el modal
    function cerrarModal() {
        document.getElementById("modalMensaje").style.display = "none";
    }
</script>


    
    
</body>
</html>