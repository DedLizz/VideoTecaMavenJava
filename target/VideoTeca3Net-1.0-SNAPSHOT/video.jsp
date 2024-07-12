<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    /*boton para agregar favorito*/
    /* CSS */
    .button-89 {
      --b: 3px;   /* border thickness */
      --s: .45em; /* size of the corner */
      --color: #373B44;

      padding: calc(.5em + var(--s)) calc(.9em + var(--s));
      color: var(--color);
      --_p: var(--s);
      background:
        conic-gradient(from 90deg at var(--b) var(--b),#0000 90deg,var(--color) 0)
        var(--_p) var(--_p)/calc(100% - var(--b) - 2*var(--_p)) calc(100% - var(--b) - 2*var(--_p));
      transition: .3s linear, color 0s, background-color 0s;
      outline: var(--b) solid #0000;
      outline-offset: .6em;
      font-size: 16px;

      border: 0;

      user-select: none;
      -webkit-user-select: none;
      touch-action: manipulation;
    }

    .button-89:hover,
    .button-89:focus-visible{
      --_p: 0px;
      outline-color: var(--color);
      outline-offset: .05em;
    }

    .button-89:active {
      background: var(--color);
      color: #fff;
    }
    /*fin boton de favoritos*/
    
    body {
    display:flex;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.video-container {
    width: 98%;
    margin: 20px auto;
    box-shadow: 0px 0px 16px 8px rgb(255 255 255);
    border-radius: 8px;
    overflow: hidden;
}

.video {
    width: 100%;
    height: 400px;
}

.video-title {
    padding: 10px;
    margin: 0;
    font-size: 18px;
}

.description-container {
    width: 96%;
    margin: 20px auto;
    background-color: #000;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 20px;
}

.video-description {
    margin: 0;
    font-size: 16px;
}

.atributosVideo {
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1%;
}

.descripcion {
    background: #fff;
    padding: 10px;
    border-radius: 10px;
    margin-bottom: 15px;
}

</style>
</head>
<body>
    <div class="container" style="background: #000;margin: 0 auto;width: 60vw;">
        <div class="video-container">
            <iframe class="video" src="<%= session.getAttribute("urlVideo") %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            
            <div class="atributosVideo">
                <h2 class="video-title">Título: <%= session.getAttribute("tituloVideo") %></h2>
                <div class="botones">
                    <!-- Modificar los botones para que pasen los parámetros al servlet -->
                    <button class="button-89 add" onclick="agregarFavorito('<%= session.getAttribute("id") %>', '<%= session.getAttribute("idVideo") %>')">Agregar a Favoritos</button>
                    <button class="button-89 remove" onclick="eliminarFavorito('<%= session.getAttribute("id") %>', '<%= session.getAttribute("idVideo") %>')">Eliminar de Favoritos</button>
                </div>
            </div>
        </div>
        <div class="description-container">
            <div class="descripcion">
                <h3>Descripción:</h3>
                <p class="video-description"><%= session.getAttribute("descripcionVideo") %></p>
                <!-- Imprimir los valores de sesión para depuración -->
                <p>ID de Usuario: <%= session.getAttribute("id") %></p>
                <p>ID de Video: <%= session.getAttribute("idVideo") %></p>
                <h1 id="estadoFavorito">Verificando favorito...</h1> 
            </div>
            
            <div class="comentariosClass">
                <jsp:include page="comentarios.jsp"/>
            </div>    
        </div>
    </div>
 
    <script>
        function agregarFavorito(idUsuario, idVideo) {
            // Crear la URL con los parámetros
            var url = "ServletFavorito?accion=agregar&idUsuarioPag=" + idUsuario + "&idVideoPag=" + idVideo;
            // Realizar la solicitud GET
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al agregar a favoritos');
                    }
                    console.log('Video agregado a favoritos');
                    document.querySelector('.button-89.add').style.display = 'none';
                    document.querySelector('.button-89.remove').style.display = 'block';
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }

        function eliminarFavorito(idUsuario, idVideo) {
            // Crear la URL con los parámetros
            var url = "ServletFavorito?accion=eliminar&idUsuarioPag=" + idUsuario + "&idVideoPag=" + idVideo;
            // Realizar la solicitud GET
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al eliminar de favoritos');
                    }
                    console.log('Video eliminado de favoritos');
                    document.querySelector('.button-89.add').style.display = 'block';
                    document.querySelector('.button-89.remove').style.display = 'none';
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }

        $(document).ready(function() {
            consultaExistenciaFavorito();
        });

        function consultaExistenciaFavorito() {
            var idUsuario = '<%= session.getAttribute("id") %>';
            var idVideo = '<%= session.getAttribute("idVideo") %>';

            // Hacer una solicitud AJAX para verificar si el video es favorito
            $.ajax({
                url: 'ServletFavorito?accion=btnFavoritos',
                type: 'GET',
                data: { idUsuarioPag: idUsuario, idVideoPag: idVideo },
                dataType: 'json',
                success: function(response) {
                    // Manejar la respuesta JSON
                    console.log(response); // Imprimir en consola la respuesta
                    var mensaje = response ? 'Este video es uno de tus favoritos' : 'Este video no es uno de tus favoritos';
                    $('#estadoFavorito').text(mensaje);

                    if (response) {
                        document.querySelector('.button-89.add').style.display = 'none';
                        document.querySelector('.button-89.remove').style.display = 'block';
                    } else {
                        document.querySelector('.button-89.add').style.display = 'block';
                        document.querySelector('.button-89.remove').style.display = 'none';
                    }
                },
                error: function(xhr, status, error) {
                    // Manejar errores
                    console.error('Error al verificar favorito:', xhr.responseText);
                }
            });
        }
    </script>
</body>
</html>
