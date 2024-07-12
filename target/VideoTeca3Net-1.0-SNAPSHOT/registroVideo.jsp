<!DOCTYPE html>
<html lang="es">
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
    </style>
</head>
<body>
                        
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-2 d-none d-md-block bg-secondary sidebar fixed-top" style="height: 100vh;">
                <div class="sidebar-sticky">
                    <div class="barravertical">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="button-85" href="MenuHome.jsp">VIDEOS HOME</a>
                            </li>
                            <!-- Puedes añadir más elementos de menú aquí según sea necesario -->
                        </ul>
                    </div>
                </div>
            </nav>


            <!-- Contenido Principal -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                <h1 class="mt-5 text-center" style="color: #fdfdfd;font-family: fantasy;">VIDEOS</h1>
                
                <div class="content-btn">
                    <!-- Botón para abrir el modal de Nuevo Video -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Nuevo Video</button>
                    
                    <div class="grafico">
                            <jsp:include page="grafico.jsp" />
                    </div>
                    

                    <a type="button" class="btn btn-primary" href="ServletVideo?accion=exel" >Generar Exel Videos</a>

                    
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
                                        <label for="tituloVideo" class="form-label">Título Video</label>
                                        <input type="text" class="form-control" id="tituloVideo" name="tituloPag">
                                    </div>
                                    <div class="form-group">
                                        <label for="descripVideo" class="form-label">Descripción del video</label>
                                        <textarea class="form-control" id="descripVideo" name="descripPag"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="urlVideo" class="form-label">Enlace video</label>
                                        <input type="text" class="form-control" id="urlVideo" name="urlPag">
                                    </div>
                                    <div class="form-group">
                                        <label for="idCategoria" class="form-label">Categoría</label>
                                        <select class="form-control" id="idCategoria" name="idCategoriaPag" required>
                                            <option value="" selected>[Seleccione una categoría]</option>
                                            <!-- Opciones cargadas dinámicamente desde JavaScript -->
                                        </select>
                                    </div>
                                    <input type="hidden" id="idVideo" name="idVideoPag">
                                    
                                    <!-- Botones de acción -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" id="btnGuardar">Grabar</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para confirmación de guardado -->
                <div class="modal fade" id="confirmacionModal" tabindex="-1" aria-labelledby="confirmacionModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmacionModalLabel">Confirmación</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de guardar los cambios?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary" id="btnConfirmarGuardar">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Modal para confirmación de eliminación -->
                <div class="modal fade" id="eliminarModal" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="eliminarModalLabel">Confirmación de Eliminación</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas eliminar este video?
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
                                <th>Título Video</th>
                                <th>Descripción</th>
                                <th>URL</th>
                                <th>Categoría</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody style="color: white;">
                            <!-- Aquí se llenarán dinámicamente los datos -->
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

    <!-- Script para manejar la lógica del modal y cargar los datos -->
    <script>
        $(document).ready(function() {
            var isEdit = false;

            // Evento antes de que se muestre el modal
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                isEdit = button.hasClass('btn-editar');

                // Configuración del formulario dependiendo si es edición o nuevo
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

            // Evento para el botón "Guardar" dentro del modal
            $('#btnGuardar').on('click', function() {
                // Mostrar modal de confirmación
                $('#confirmacionModal').modal('show');
            });

            // Evento para confirmar el guardado
            $('#btnConfirmarGuardar').on('click', function() {
                // Ocultar modal de confirmación
                $('#confirmacionModal').modal('hide');

                // Envío del formulario
                $('#FormularioVideo').submit();
            });

            // Función para cargar las categorías desde el servlet
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
                        console.error('Error al cargar las categorías. Estado de la solicitud:', status);
                    }
                });
            }

            // Llamada inicial para cargar las categorías cuando el documento esté listo
            cargarCategorias();

            // Función para cargar los videos desde el servlet
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
                                      '<td>' + video.descripcion + '</td>' +
                                      '<td>' + video.urlVideo + '</td>' +
                                      '<td>' + video.categoriaVideo + '</td>' +
                                      '<td>' +
                                      '<button type="button" class="btn btn-success btn-editar" ' +
                                      'data-toggle="modal" data-target="#exampleModal" ' +
                                      'data-id="' + video.idVideo + '" ' +
                                      'data-titulo="' + video.tituloVideo + '" ' +
                                      'data-descripcion="' + video.descripcion + '" ' +
                                      'data-url="' + video.urlVideo + '" ' +
                                      'data-categoria="' + video.categoriaVideo + '">Editar</button> ' +
                                      '<button type="button" class="btn btn-danger btn-eliminar" ' +
                                      'data-id="' + video.idVideo + '">Eliminar</button>' +
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

            // Llamamos a la función para cargar los videos cuando la página esté lista
            cargarVideos();
        });
    </script>
    
    <script>
        // Evento para el botón "Eliminar" dentro de la tabla
        $(document).on('click', '.btn-eliminar', function() {
            var id = $(this).data('id'); // Obtener el ID del video a eliminar
            $('#eliminarModal').data('id', id).modal('show'); // Mostrar modal de confirmación
        });

        // Evento para confirmar la eliminación
        $('#btnConfirmarEliminar').on('click', function() {
            var id = $('#eliminarModal').data('id');
            $('#eliminarModal').modal('hide');

            // Aquí puedes realizar la llamada AJAX para eliminar el video utilizando el ID
            $.ajax({
                type: 'POST',
                url: 'ServletVideo?accion=eliminar',
                data: { idVideoPag: id },
                success: function(response) {
                    // Recargar la página después de eliminar el video
                    window.location.href = 'registroVideo.jsp';
                },
                error: function(xhr, status, error) {
                    console.error('Error al eliminar el video. Estado de la solicitud:', status);
                }
            });
        });

    </script>
    


</body>
</html>
