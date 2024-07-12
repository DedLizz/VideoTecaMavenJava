<%-- 
    Document   : comentarios
    Created on : 14 jun. 2024, 02:06:19
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comentarios del Video</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            padding: 2px;
        }
        .comment-section {
            width: auto;
            margin: 0 auto;
            background-color: #1c1c1c;
            border: 1px solid #1add00;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px -1px 12px 17px rgb(0 255 19 / 10%);
        }
        .comment-form, .reply-form {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            font-family: fantasy;
        }
        .comment-form textarea, .reply-form textarea {
            width: auto;
            margin-bottom: 10px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #44ff03;
            border-radius: 3px;
        }
        .comment {
            margin-top: 20px;
            border-bottom: 1px solid #00d110;
            padding-bottom: 10px;
        }
        .comment:last-child {
            border-bottom: none;
        }
        .comment .author {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .comment .date {
            font-size: 12px;
            color: #999;
        }
        .comment p {
            margin: 0;
        }
        /* ete es el botn de responder*/
        /* Estilo para el botón con clase "responder-comentario" */
        .boton.responder-comentario {
            background: #1fb525;
            border: 1px solid #1fb525;
            border-radius: 6px;
            box-shadow: rgba(0, 0, 0, 0.1) -3px 8px 5px 2px;
            box-sizing: border-box;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            font-family: 'Nunito', 'Roboto', 'Proxima Nova', sans-serif;
            outline: 0;
            padding: 5px 5px;
            text-align: center;
            text-rendering: geometricprecision;
            text-transform: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            vertical-align: middle;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .boton.responder-comentario:hover,
        .boton.responder-comentario:active {
          background-color: initial;
          background-position: 0 0;
          color: #1fb525;
        }

        .boton.responder-comentario:active {
          opacity: .5;
        }
        
        /*fin estilo de boton responder comentario*/
        
        /*boton para comentar*/
        .button-24 {
            background: #FF4742;
            border: 1px solid #FF4742;
            border-radius: 6px;
            box-shadow: rgba(0, 0, 0, 0.1) 1px 2px 4px;
            box-sizing: border-box;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            font-family: nunito,roboto,proxima-nova,"proxima nova",sans-serif;
            font-size: 16px;
            font-weight: 800;
            line-height: 16px;
            min-height: 40px;
            outline: 0;
            padding: 12px 14px;
            text-align: center;
            text-rendering: geometricprecision;
            text-transform: none;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            vertical-align: middle;
          }

          .button-24:hover,
          .button-24:active {
            background-color: initial;
            background-position: 0 0;
            color: #FF4742;
          }

          .button-24:active {
            opacity: .5;
          }
         /*fin del boton para comentar*/

        .acciones button {
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
            border-radius: 3px;
        }
        .acciones button:hover {
            background-color: #e0e0e0;
        }
        .respuestas {
            margin-left: 20px;
            border-left: 2px solid #ccc;
            padding-left: 10px;
        }
        .reply {
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px solid #ccc;
        }
        .reply .author {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .reply .date {
            font-size: 12px;
            color: #999;
        }
        /*estilos ce info de comentarios*/
        /*estilo para el texto comentario */
        .comentario-principal {
            font-size: 16px;
            font-weight: bold;
            font-family: cursive;
            color: #d6ff00;
        }
        .comentario-respuesta {
            font-size: 14px;
            font-weight: bold;
            font-family: cursive;
            color: #FF4742;
        }

        /*datos adiciones de los comentarios corresponde a comentario de video y respustas de comentario*/
        .respuesta-usuario, .respuesta-fecha, .respuesta-id {
            font-size: 9px;
            color: #f9fff9c7;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="comment-section">
        <h2 style="color: white;">Comentarios:</h2>
        <input type="hidden" id="idVideoPag" value="<%= session.getAttribute("idVideo") %>">
        <input type="hidden" id="idUsuarioPag" value="<%= session.getAttribute("id") %>">
        <input type="hidden" id="fechaPag" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">

        <!-- Formulario para comentar el video -->
        <div id="form-comentario" class="comment-form">
            <textarea id="comentarioPag" rows="3" cols="50" placeholder="Escribe tu comentario..."></textarea><br>
            <button class="button-24" id="btnComentar" class="boton">Comentar</button>
        </div>

        <!-- Contenedor de comentarios -->
        <div id="comentarios">
            <!-- Aquí se cargarán los comentarios -->
        </div>
    </div>

    <script>
        $(document).ready(function() {
            cargarComentarios();

            // Enviar comentario con AJAX
            $('#btnComentar').click(function() {
                var comentario = $('#comentarioPag').val();
                var idVideoPag = $('#idVideoPag').val();
                var idUsuarioPag = $('#idUsuarioPag').val();
                var fechaPag = $('#fechaPag').val();

                $.ajax({
                    url: 'ServletComentarioVideo',
                    type: 'POST',
                    data: {
                        accion: 'comentar',
                        comentarioPag: comentario,
                        idVideoPag: idVideoPag,
                        idUsuarioPag: idUsuarioPag,
                        fechaPag: fechaPag
                    },
                    dataType: 'json',
                    success: function(response) {
                        if (response.status === 'success') {
                            alert('Comentario guardado exitosamente');
                            // Agregar el comentario al DOM sin recargar la página
                            agregarComentarioAlDom(response.comentario);
                            $('#comentarioPag').val(''); // Limpiar el campo de texto
                        } else {
                            alert('Hubo un error al comentar el video.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al enviar comentario:', error);
                    }
                });
            });

            // Enviar respuesta con AJAX
            $(document).on('submit', '.reply-form form', function(e) {
                e.preventDefault();
                var form = $(this);
                var respuesta = form.find('textarea[name="respuestaPag"]').val();
                var idUsuarioPag = form.find('input[name="idUsuarioPag"]').val();
                var idComentarioPadre = form.find('input[name="idComentarioPadre"]').val();
                var fechaPag = form.find('input[name="fechaPag"]').val();

                $.ajax({
                    url: 'ServletComentarioVideo',
                    type: 'POST',
                    data: {
                        accion: 'respuesta',
                        respuestaPag: respuesta,
                        idUsuarioPag: idUsuarioPag,
                        idComentarioPadre: idComentarioPadre,
                        fechaPag: fechaPag
                    },
                    dataType: 'json',
                    success: function(response) {
                        if (response.status === 'success') {
                            alert('Respuesta guardada exitosamente');
                            // Agregar la respuesta al DOM sin recargar la página
                            agregarRespuestaAlDom(response.respuesta);
                            form.find('textarea[name="respuestaPag"]').val(''); // Limpiar el campo de texto
                        } else {
                            alert('Hubo un error al responder el comentario.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al enviar respuesta:', error);
                    }
                });
            });

            // Función para cargar comentarios desde el servidor
            function cargarComentarios() {
                var idVideo = $('#idVideoPag').val();

                $.ajax({
                    url: 'ServletComentarioVideo',
                    type: 'GET',
                    data: {
                        accion: 'lista',
                        idVideoPag: idVideo
                    },
                    dataType: 'json',
                    success: function(data) {
                        const comentariosDiv = $('#comentarios');
                        comentariosDiv.empty(); // Limpiar comentarios anteriores

                        data.forEach(comentario => {
                            agregarComentarioAlDom(comentario);
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al obtener comentarios:', error);
                    }
                });
            }

            // Función para agregar comentario al DOM
            function agregarComentarioAlDom(comentario) {
                const comentariosDiv = $('#comentarios');

                const comentarioDiv = $('<div>').addClass('comment').attr('id', 'comentario-'+comentario.idComentario);
                const contenido = $('<p>').addClass('comentario-principal').text(comentario.textoComentario);
                const usuario = $('<p>').addClass('respuesta-usuario').text('Usuario (ID: ' + comentario.idUsuario + '): ');
                usuario.append($('<strong>').text(comentario.idUsuario));
                const fecha = $('<p>').addClass('respuesta-fecha').text('Fecha: ');
                fecha.append($('<strong>').text(comentario.fechaComentario));
                const idComentario = $('<p>').addClass('respuesta-id').text('Comentario ID: ' + comentario.idComentario + ' | Video ID: ' + comentario.idVideo);
                idComentario.prepend($('<strong>').text('ID: '));

                comentarioDiv.append(usuario);
                comentarioDiv.append(fecha);
                comentarioDiv.append(idComentario);
                comentarioDiv.append(contenido);

                const accionesDiv = $('<div>').addClass('acciones');
                const responderButton = $('<button class="boton responder-comentario">Responder</button>');
                responderButton.on('click', function() {
                    toggleReplyForm(this);
                });
                accionesDiv.append(responderButton);
                comentarioDiv.append(accionesDiv);

                const replyForm = $('<div class="reply-form comment-form">').append(`
                    <form>
                        <textarea name="respuestaPag" rows="3" cols="50" placeholder="Escribe tu respuesta..."></textarea><br>
                        <input type="hidden" name="idUsuarioPag" value="<%= session.getAttribute("id") %>">
                        <input type="hidden" name="idComentarioPadre" value="${comentario.idComentario}">
                        <input type="hidden" name="fechaPag" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                        <button type="submit" class="boton">Responder</button>
                    </form>
                `);
                
                replyForm.find('input[name="idComentarioPadre"]').val(comentario.idComentario);
                
                replyForm.hide();
                comentarioDiv.append(replyForm);

                if (comentario.respuestas && comentario.respuestas.length > 0) {
                    const respuestasDiv = $('<div>').addClass('respuestas');
                    comentario.respuestas.forEach(respuesta => {
                        agregarRespuestaAlDom(respuesta, respuestasDiv);
                    });

                    comentarioDiv.append(respuestasDiv);
                }

                comentariosDiv.append(comentarioDiv);
            }

            // Función para agregar respuesta al DOM
            function agregarRespuestaAlDom(respuesta, container = null) {
                const respuestaDiv = $('<div>').addClass('reply');
                const contenidoRespuesta = $('<p>').addClass('comentario-respuesta').text(respuesta.textoRespuesta);
                const usuarioRespuesta = $('<p>').addClass('respuesta-usuario').text('Usuario (ID: ' + respuesta.idUsuario + '): ');
                usuarioRespuesta.append($('<strong>').text(respuesta.idUsuario));
                const fechaRespuesta = $('<p>').addClass('respuesta-fecha').text('Fecha: ');
                fechaRespuesta.append($('<strong>').text(respuesta.fechaRespuesta));
                const idRespuesta = $('<p>').addClass('respuesta-id').text('Respuesta ID: ' + respuesta.idRespuesta + ' | Comentario ID: ' + respuesta.idComentario);
                idRespuesta.prepend($('<strong>').text('ID: '));

                respuestaDiv.append(usuarioRespuesta);
                respuestaDiv.append(fechaRespuesta);
                respuestaDiv.append(idRespuesta);
                respuestaDiv.append(contenidoRespuesta);

                if (container) {
                    container.append(respuestaDiv);
                } else {
                    const comentarioDiv = $('#comentario-'+respuesta.idComentario);
                    let respuestasDiv = comentarioDiv.find('.respuestas');
                    if (respuestasDiv.length === 0) {
                        respuestasDiv = $('<div>').addClass('respuestas');
                        comentarioDiv.append(respuestasDiv);
                    }
                    respuestasDiv.append(respuestaDiv);
                }
            }

            // Función para manejar el mostrar/ocultar del formulario de respuesta
            function toggleReplyForm(button) {
                var replyForm = $(button).closest('.comment').find('.reply-form');
                if (replyForm.is(':visible')) {
                    replyForm.hide();
                    $(button).text('Responder');
                } else {
                    $('.reply-form').hide(); // Oculta cualquier otro formulario de respuesta abierto
                    $('.responder-comentario').text('Responder'); // Restablece el texto de todos los botones de respuesta
                    replyForm.show();
                    $(button).text('Cancelar respuesta');
                }
            }
        });
    </script>
</body>
</html>