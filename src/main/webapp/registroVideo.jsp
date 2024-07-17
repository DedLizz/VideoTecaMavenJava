<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mantenimiento de Videos</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /*boton 85 */
        .button-85 {
            padding: 0.6em 2em;
            border: none;
            outline: none;
            color: rgb(255, 255, 255);
            background: #111;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
          }

          .button-85:before {
            content: "";
            background: linear-gradient(
              45deg,
              #ff0000,
              #ff7300,
              #fffb00,
              #48ff00,
              #00ffd5,
              #002bff,
              #7a00ff,
              #ff00c8,
              #ff0000
            );
            position: absolute;
            top: -2px;
            left: -2px;
            background-size: 400%;
            z-index: -1;
            filter: blur(5px);
            -webkit-filter: blur(5px);
            width: calc(100% + 4px);
            height: calc(100% + 4px);
            animation: glowing-button-85 20s linear infinite;
            transition: opacity 0.3s ease-in-out;
            border-radius: 10px;
          }

          @keyframes glowing-button-85 {
            0% {
              background-position: 0 0;
            }
            50% {
              background-position: 400% 0;
            }
            100% {
              background-position: 0 0;
            }
          }

          .button-85:after {
            z-index: -1;
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: #222;
            left: 0;
            top: 0;
            border-radius: 10px;
          }
        /*fin boton 85*/
        
        #chart-container {
            width: 100%;
            max-width: 600px;
            height: 400px;
            margin: auto;
        }
        canvas {
            display: block;
        }
        /*este es el estilo del grafico con botnes nuevo video y generar exel*/
        .content-btn {
            display: flex;
            align-items: flex-end;
            width: 80vw;
            justify-content: space-around;
            font-size: 1vw;
        }
        .content-btn h1{
            color: #873939;
            font-family: fantasy;
        }
        
        /*este es el estilo del head de tabla */
        .table-warning, .table-warning>td, .table-warning>th {
            background-color: #a92771;
            text-align: center;
            font-weight: bold;
            font-family: cursive;
        }
        .barravertical {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        /* este es el estilo del nav */
        .barraVerticalContainer {
            background-color: #1c1c1c; /* Color de fondo */
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh; /* Altura completa del viewport */
            width: 16.666667%; /* Ancho de la barra lateral */
            z-index: 1030; /* Capa z-index para estar encima del contenido */
            /*overflow-y: auto;*/ /* Permitir scroll si el contenido es más largo que la altura */
            padding-top: 20px; /* Ajuste de padding opcional */
            margin-top: 80px;
        }

        /* header */
        #main-header {
            background: #333;
            color: white;
            height: 80px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        #main-header a {
            color: white;
            text-decoration: none;
        }

        #logo-header {
            float: left;
            padding: 15px 0 0 20px;
        }

        #logo-header .site-name {
            display: block;
            font-weight: 700;
            font-size: 1.2em;
        }

        #logo-header .site-desc {
            display: block;
            font-weight: 300;
            font-size: 0.8em;
            color: #999;
        }

        nav {
            float: right;
        }

        nav ul {
            margin: 0;
            padding: 0;
            list-style: none;
            padding-right: 20px;
        }

        nav ul li {
            display: inline-block;
            line-height: 80px;
        }

        nav ul li a {
            display: block;
            padding: 0 10px;
            text-decoration: none;
        }

        img {
            width: 60px;
            height: 60px;
        }

    </style>
</head>
<body>
<header id="main-header">
    <a id="logo-header" href="#">
        <span class="site-name">VideoTeca</span>
        <span class="site-desc">Admin: <strong>${sessionScope.nombreAdm} ${sessionScope.apellidoAdm}</strong></span>
    </a>
    <nav>
        <ul>
            <li><a href="#">Telefono: ${sessionScope.telefonoAdm}</a></li>
            <li><a href="#">DNI: ${sessionScope.dniAdm}</a></li>
            <li><a href="ServletUsuario?accion=cerrar">Cerrar Sesion</a></li>
        </ul>
    </nav>
</header>
                        
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="barraVerticalContainer" style="height: 100vh;">
                <div class="sidebar-sticky">
                    <div class="barravertical">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="button-85" href="#">Videos</a>
                            </li>
                            <!-- Puedes a�adir m�s elementos de men� aqu� seg�n sea necesario -->
                        </ul>
                    </div>
                </div>
            </nav>


            <!-- Contenido Principal -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="margin-top: 80px;">
                <h1 class="mt-5 text-center" style="color: #fdfdfd;font-family: fantasy;">VIDEOS</h1>
                
                <div class="content-btn">
                    <!-- Bot�n para abrir el modal de Nuevo Video -->
                    <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal"><img src="imagenes/fotografia.png"></button>
                    
                    <div class="grafico">
                            <jsp:include page="grafico.jsp" />
                    </div>
                    

                    <a type="button" class="btn" href="ServletVideo?accion=exel" ><img src="imagenes/xls.png"></a>

                    
                </div>
                
                
                <!-- Modal para Nuevo/Editar Video -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Nuevo Video</h1>
                            </div>
                            <div class="modal-body">
                                <form id="FormularioVideo" method="post" action="ServletVideo">
                                    <!-- Campos del formulario -->
                                    <div class="form-group">
                                        <label for="tituloVideo" class="form-label">T�tulo Video</label>
                                        <input type="text" class="form-control" id="tituloVideo" name="tituloPag">
                                    </div>
                                    <div class="form-group">
                                        <label for="descripVideo" class="form-label">Descripci�n del video</label>
                                        <textarea class="form-control" id="descripVideo" name="descripPag"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="urlVideo" class="form-label">Enlace video</label>
                                        <input type="text" class="form-control" id="urlVideo" name="urlPag">
                                    </div>
                                    <div class="form-group">
                                        <label for="idCategoria" class="form-label">Categor�a</label>
                                        <select class="form-control" id="idCategoria" name="idCategoriaPag" required>
                                            <option value="" selected>[Seleccione una categor�a]</option>
                                            <!-- Opciones cargadas din�micamente desde JavaScript -->
                                        </select>
                                    </div>
                                    <input type="hidden" id="idVideo" name="idVideoPag">
                                    
                                    <!-- Botones de acci�n -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" id="btnGuardar">Grabar</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para confirmaci�n de guardado -->
                <div class="modal fade" id="confirmacionModal" tabindex="-1" aria-labelledby="confirmacionModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmacionModalLabel">Confirmaci�n</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                �Est�s seguro de guardar los cambios?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary" id="btnConfirmarGuardar">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Modal para confirmaci�n de eliminaci�n -->
                <div class="modal fade" id="eliminarModal" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="eliminarModalLabel">Confirmaci�n de Eliminaci�n</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                �Est�s seguro de que deseas eliminar este video?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" id="btnConfirmarEliminar">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Tabla de Videos -->
                <div class="mt-3">
                    <table id="tablaVideos" class="table table-dark table-striped" style="width: 100%">
                        <thead class="table-warning">
                            <tr>
                                <th>ID</th>
                                <th>T�tulo Video</th>
                                <th>Descripci�n</th>
                                <th>URL</th>
                                <th>Categor�a</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody style="color: white;">
                            <!-- Aqu� se llenar�n din�micamente los datos -->
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Script para manejar la l�gica del modal y cargar los datos -->
    <script>
        $(document).ready(function() {
            var isEdit = false;

            // Evento antes de que se muestre el modal
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                isEdit = button.hasClass('btn-editar');

                // Configuraci�n del formulario dependiendo si es edici�n o nuevo
                if (isEdit) {
                    var id = button.data('id');
                    var titulo = button.data('titulo');
                    var descripcion = button.data('descripcion');
                    var url = button.data('url');
                    var categoria = button.data('categoria');

                    $('#FormularioVideo').attr('action', 'ServletVideo?accion=editar');
                    $('#tituloVideo').val(titulo);
                    $('#descripVideo').val(descripcion);
                    $('#urlVideo').val(url);
                    $('#idCategoria').val(categoria);
                    $('#idVideo').val(id);
                } else {
                    $('#FormularioVideo').attr('action', 'ServletVideo?accion=guardar');
                    $('#FormularioVideo')[0].reset();
                }
            });

            // Evento para el bot�n "Guardar" dentro del modal
            $('#btnGuardar').on('click', function() {
                // Mostrar modal de confirmaci�n
                $('#confirmacionModal').modal('show');
            });

            // Evento para confirmar el guardado
            $('#btnConfirmarGuardar').on('click', function() {
                // Ocultar modal de confirmaci�n
                $('#confirmacionModal').modal('hide');

                // Env�o del formulario
                $('#FormularioVideo').submit();
            });

            // Funci�n para cargar las categor�as desde el servlet
            function cargarCategorias() {
                $.ajax({
                    url: 'ServletCategoriaJSON',
                    type: 'GET',
                    dataType: 'json',
                    success: function(categorias) {
                        var select = $('#idCategoria');
                        select.empty(); // Limpiar opciones anteriores

                        $.each(categorias, function(index, categoria) {
                            select.append($('<option></option>').val(categoria.idCategoria).text(categoria.nombreCategoria));
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al cargar las categor�as. Estado de la solicitud:', status);
                    }
                });
            }

            // Llamada inicial para cargar las categor�as cuando el documento est� listo
            cargarCategorias();

            // Funci�n para cargar los videos desde el servlet
            function cargarVideos() {
                $.ajax({
                    type: 'GET',
                    url: 'ServletVideo?accion=lista',
                    dataType: 'json',
                    success: function(data) {
                        // Limpiamos la tabla antes de llenarla
                        $('#tablaVideos tbody').empty();

                        // Iteramos sobre los datos recibidos y los agregamos a la tabla
                        $.each(data, function(index, video) {
                            var row = '<tr>' +
                                '<td>' + video.idVideo + '</td>' +
                                '<td>' + video.tituloVideo + '</td>' +
                                '<td>' + truncateText(video.descripcion, 50) + '</td>' + // Trunca a 50 caracteres
                                '<td><iframe width="220" height="100" src="' + video.urlVideo + '"></iframe></td>' + // Carga video en dimensión pequeña
                                '<td>' + video.categoriaVideo + '</td>' +
                                '<td>' +
                                '<button type="button" class="btn btn-success btn-editar" ' +
                                'data-toggle="modal" data-target="#exampleModal" ' +
                                'data-id="' + video.idVideo + '" ' +
                                'data-titulo="' + video.tituloVideo + '" ' +
                                'data-descripcion="' + video.descripcion + '" ' +
                                'data-url="' + video.urlVideo + '" ' +
                                'data-categoria="' + video.categoriaVideo + '"><img src="imagenes/edicion.png"></button> ' +
                                '<button type="button" class="btn btn-danger btn-eliminar" ' +
                                'data-id="' + video.idVideo + '"><img src="imagenes/borrar.png"></button>' +
                                '</td>' +
                                '</tr>';
                            $('#tablaVideos tbody').append(row);
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log('Error en la carga de videos:', errorThrown);
                    }
                });
            }

            // Llamamos a la funci�n para cargar los videos cuando la p�gina est� lista
            cargarVideos();
        });
    </script>
    
    <script>
        // Evento para el bot�n "Eliminar" dentro de la tabla
        $(document).on('click', '.btn-eliminar', function() {
            var id = $(this).data('id'); // Obtener el ID del video a eliminar
            $('#eliminarModal').data('id', id).modal('show'); // Mostrar modal de confirmaci�n
        });

        // Evento para confirmar la eliminaci�n
        $('#btnConfirmarEliminar').on('click', function() {
            var id = $('#eliminarModal').data('id');
            $('#eliminarModal').modal('hide');

            // Aqu� puedes realizar la llamada AJAX para eliminar el video utilizando el ID
            $.ajax({
                type: 'POST',
                url: 'ServletVideo?accion=eliminar',
                data: { idVideoPag: id },
                success: function(response) {
                    // Recargar la p�gina despu�s de eliminar el video
                    window.location.href = 'registroVideo.jsp';
                },
                error: function(xhr, status, error) {
                    console.error('Error al eliminar el video. Estado de la solicitud:', status);
                }
            });
        });

    </script>

<!-- funciones de las tablas -->
<script>
    // Función para truncar y expandir la descripción
    function truncateText(text, maxLength) {
        if (text.length > maxLength) {
            var truncated = text.substr(0, maxLength) + '...';
            var fullText = text;
            return '<span class="truncated-text">' + truncated + '</span>' +
                '<button class="btn btn-link expand-btn" onclick="expandDescription(this)">Ver más</button>' +
                '<span class="full-text" style="display:none;">' + fullText + '</span>';
        }
        return text;
    }

    // Función para expandir la descripción completa
    function expandDescription(btn) {
        var $btn = $(btn);
        var $truncatedText = $btn.prev('.truncated-text');
        var $fullText = $btn.next('.full-text');

        $truncatedText.hide();
        $fullText.show();
        $btn.hide();
    }

</script>
    


</body>
</html>
