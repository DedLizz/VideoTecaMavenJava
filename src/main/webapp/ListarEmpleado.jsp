
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../Imagenes/PeruBus.png">   
        
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

        
        <!-- =========== BoxIcons =========== -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Empleados</title>
        <style>
        	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
			@import url('https://fonts.googleapis.com/css2?family=Poetsen+One&display=swap');
			* {
			    font-family: 'Poppins', sans-serif;
			    margin: 0;
			    padding: 0;
			    box-sizing: border-box;
			}
			:root {
			    /* ============= Colores ============= */
			    --body-color: #E4E9F7;
			    --table-color: #fff;
			    --sidebar-color: #940d11;
			    --primary-color: #ffffff;
			    --text-color: #ffffff;
			
			    /* =========== Transiciones =========== */
			    --tran-02: all 0.2s ease;
			    --tran-03: all 0.3s ease;
			    --tran-04: all 0.4s ease;
			    --tran-05: all 0.5s ease;
			}
			
			body {
			    height: 100vh;
			    background: var(--body-color);
			    padding: 5%;
			}
			
			/* ============= Side bar ============= */
			.sidebar {
			    position: fixed;
			    top: 0;
			    left: 0;
			    height: 100%;
			    width: 250px;
			    padding: 10px 14px;
			    background-color: var(--sidebar-color);
			} 
			
			/* =========== Reusable CSS =========== */
			.sidebar .text {
			    font-size: 16px;
			    font-weight: 500;
			    color: var(--text-color);
			}
			
			.sidebar li {
			    margin-top: 10px;
			    list-style: none;
			    overflow: hidden;
			    align-items: center;
			}
			
			.sidebar li .icon {
			    padding: 0;
			    height: 50px;
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    min-width: 60px;
			    font-size: 20px;
			}
			
			.sidebar li .icon, .sidebar li .text {
			    color: var(--text-color);
			    transition: var(--tran-02);
			}
			
			.side header {
			    position: relative;
			}
			
			.sidebar header .image-text {
			    display: flex;
			    align-items: center;
			}
			
			header .image-text .header-text {
			    display: flex;
			    padding-left: 20%;
			    align-items: center;
			    flex-direction: column;
			    font-size: 28px;
			}
			
			.header-text .frase {
			    font-weight:  600;
			}
			
			.header-text .empresa {
			    margin-top: -2px;
			}
			
			/* Estilos de los a */
			.sidebar li a {
			    height: 100%;
			    width: 100%;
			    display: flex;
			    align-items: center;
			    text-decoration: none;
			    border-radius: 6px;
			    transition: var(--tran-04);
			}
			
			/* Cambio del color del fondo cuando pasa el cursor por el menú */
			.sidebar li a:hover {
			    background: var(--primary-color);
			}
			
			/* Cambio del color del icono y texto cuando pasa el cursor por el menú */
			.sidebar li a:hover .icon, .sidebar li a:hover .text {
			    color: var(--sidebar-color);
			}
			
			/* Establecer la altura inicial de las sublistas a 0 */
			.sidebar .menu-links .nav-link ul {
			    height: 0;
			    overflow: hidden;
			    transition: var(--tran-02);
			}
			
			/* Rotación del icono */
			.rotate {
			    transform: rotate(90deg);
			    transition: var(--tran-02);
			}
			
			
			/* ================ Main ================ */
			.main {
			    position: absolute;
			    width: calc(100% - 300px);
			    left: 300px;
			    min-height: 100vh;
			    background: var(--white);
			    transition: 0.5s;
			}
			.main.active {
			    width: calc(100% - 80px);
			    left: 80px;
			    
			}
			
			/* ====================== Generales ====================== */
			
			/* ====================== DashBoard Inicio ====================== */
			/* =========== Título del DBInicio =========== */
			.main .titulo{
			    position: relative;
			    display: block;
			    padding: 0 10px;
			    height: 60px;
			    font-size: 80px;
			    line-height: 60px;
			    text-align: center;
			}
			
			/* =========== Párrafo de la visión de la empresa =========== */
			.main .vision{
			    font-size: 20px;
			    line-height: 30px;
			    padding: 40px 10% 0px 10%;
			    text-align: center;
			}
			
			/* =========== Imagén del bus de DBInico.jsp =========== */
			.main .ImgBusInicio{
			    width: auto;
			    height: 380px;
			    padding: 0px 0px 0px 48%;
			}
			
			/* =========== Label de las tareas pendientes =========== */
			.main .Tareas{
			    position: absolute;
			    padding: 50px 0px 0px 10%;
			    font-size: 20px;
			    line-height: 35px;
			}
			
			/* ====================== DashBoard Administradores ====================== */
			.main--admin{
			    position: absolute;
			    width: calc(100% - 300px);
			    left: 275px;
			    min-height: 100vh;
			    background: var(--white);
			    transition: 0.5s;
			}
			
			.main--content{
			    position: relative;
			    background-color: var(--body-color);
			    width: 100%;
			    padding: 1rem;
			}
			
			.option--header button{
			    width: 150px;
			    height: 50px;
			    cursor: pointer;
			    border-radius: 12px;
			    background: var(--sidebar-color);
			    color: var(--text-color);
			    font-size: 17px;
			    border-color: var(--sidebar-color);
			    font-family: "Poetsen One", sans-serif;
			}
			
			.option--header{
			    display: flex;
			    justify-content: space-between;
			    align-items: center;
			    flex-wrap: wrap;
			    background: var(--table-color);
			    border-radius: 10px;
			    padding: 20px 3rem;
			    margin-bottom: 1rem;
			}
			
			.search--box{
			    background: var(--body-color);
			    border-radius: 15px;
			    color: var(--sidebar-color);
			    display: flex;
			    align-items: center;
			    gap: 5px;
			    padding: 4px 20px;
			}
			
			.search--box input {
			    background-color: transparent;
			    width: 230px;
			    padding: 10px;
			    border: 0;
			    outline: none;
			}
			
			.table{
			    display: flex;
			    flex-wrap: wrap;
			    text-align: center;
			    background: var(--table-color);
			    border-radius: 10px;
			    padding: 1px 10px;
			    margin-bottom: 1rem;
			    
			}
			
			.general-table{
			    width: 100%;
			    border-collapse: collapse;
			    margin: 20px 0;
			}
			
			
			.general-table .enunciado{
			    font-size: 16px;
			}
			
			.general-table th,
			.general-table td{
				padding: 10px 0px;
			    font-size: 12px;
			    max-width: 200px;
			}	
			
			.general-table tbody tr{
			    border-bottom: 1px solid #DDDDDD;
			    
			}
			
			.modificar,.eliminar{
			    background: none;
			    outline: none;
			    border: none;
			    font-size: 18px;
			}
			
			.modificar .icona:hover,
			.eliminar .icona:hover{
			    color: var(--sidebar-color);
			}
			
			.hidden{
				display: none;
			}
			
			
        </style>
    </head>
<body>
    <div class="container">
        <!-- ================ Barra Lateral ================ -->
        <nav class="sidebar">
            <header>
                <div class="image-text">
                    <div class="text header-text">
                        <span class="frase">Somos</span>
                        <span class="empresa">PerúBus</span>
                    </div>
                </div>
            </header>

            <div class="menu-bar">
                <div class="menu">
                    <ul class="menu-links">
                        <!-- ============ Opción de Inicio ============ -->
                        <li class="nav-link">
                            <a href="../../Inicio.jsp">
                                <i class='bx bx-home icon'></i>
                                <span class="text nav-text">Inicio</span>
                            </a>
                        </li>

                        <!-- ============ Opción de Gestión ============ -->
                        <li class="nav-link nav-link--click">
                            <div class="nav-button nav-button--click">
                                <a href="#">
                                    <i class='bx bx-group icon'></i>
                                    <span class="text nav-text">Gestión</span>
                                    <i class='bx bx-chevron-down icon'></i>
                                </a>
                            </div>

                            <ul>
                                <!-- ============ Opción de Empleados ============ -->
                                <li class="nav-link">
                                    <a href="../Empleados/ListarEmpleado.jsp" class="nav_link nav_link--inside">
                                        <i class='bx bxs-universal-access icon'></i>
                                        <span class="text nav-text">Empleados</span>
                                    </a>
                                </li>

                                <!-- ============ Opción de Cuentas ============ -->
                                <li class="nav-link">
                                    <a href="../Cuentas/ListarCuenta.jsp" class="nav_link nav_link--inside">
                                        <i class='bx bxs-universal-access icon'></i>
                                        <span class="text nav-text">Cuentas</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- ============== Opción de Buses ============== -->
                        <li class="nav-link">
                            <a href="../Buses/ListarBus.jsp">
                                <i class='bx bx-bus icon'></i>
                                <span class="text nav-text">Buses</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Programación ============== -->
                        <li class="nav-link">
                            <a href="../Programacion/ListarProgramacion.jsp">
                                <i class='bx bx-compass icon'></i>
                                <span class="text nav-text">Programación</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Asientos ============== -->
                        <li class="nav-link">
                            <a href="../Asientos/ListarAsientos.jsp">
                                <i class='bx bx-home icon'></i>
                                <span class="text nav-text">Asientos</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Clientes ============== -->
                        <li class="nav-link">   
                            <a href="../Clientes/ListarCliente.jsp">
                                <i class='bx bx-male-female icon'></i>
                                <span class="text nav-text">Clientes</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Pasajes ============== -->
                        <li class="nav-link">
                            <a href="../Pasajes/ListarPasaje.jsp">
                                <i class='bx bx-receipt icon'></i>
                                <span class="text nav-text">Pasajes</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Cerrar sesión ============== -->
                        <li class="nav-link">
                            <a href="../../Login.jsp">
                                <i class='bx bx-x icon'></i>
                                <span class="text nav-text">Cerrar sesión</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <button class="btn btn-warning editar-producto" data-toggle="modal" data-target="#XXXXXX" style="background-color: transparent; border:none;"
                SFGSFGSDFG
                                </button>

    <!-- ================================== TABLA Y FORMULARIO DE NUEVO REGISTRO ================================== -->
    <div class="main--admin">
        <div class="main--content">
            <div class="option--header">
                <div class="search--box">
                    <i class='bx bx-search-alt-2'></i>
                    <input type="text" placeholder="Búsqueda por idEmpleado"/>
                </div>
                <div class="content">
                    <!-- Botón para abrir el modal de Nuevo Empleado -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registroEmpleadoModal">Nuevo Empleado</button>
                </div>
            </div>
            
            <div class="table">
                <table id="general-table" class="general-table">
                    <thead>
                        <tr>
                            <th>IdEmpleado</th>
                            <th>IdCargo</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Sexo</th>
                            <th>Telefono</th>
                            <th>Email</th>
                            <th>Fecha de Ingreso</th>
                            <th>Sueldo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        
     
                    </tbody>
                </table>
            </div>
                    

            <!-- Modal para agregar empleado -->
            <div class="modal fade" id="registroEmpleadoModal" tabindex="-1" aria-labelledby="registroEmpleadoModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="registroEmpleadoModalLabel">Agregar Empleado</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                       <div class="modal-body">
                        <iframe src="ModalsAgregar/registroCliente.jsp" style="width: 100%; height: 400px; border: none;"></iframe>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal para editar empleado -->
            <div class="modal fade" id="XXXXXX" tabindex="-1" aria-labelledby="editarEmpleadoModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editarEmpleadoModalLabel">Editar Empleado</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="editarEmpleadoForm" action="ServletEmpleado?accion=editar" method="post">
                                <!-- Campos del formulario -->
                                <div class="form-group">
                                    <label for="id" class="form-label">IdEmpleado</label>
                                    <input type="text" class="form-control" id="id" name="idPag">
                                </div>
                                <div class="form-group">
                                    <label for="cargo" class="form-label">IdCargo</label>
                                    <input type="text" class="form-control" id="cargo" name="cargoPag">
                                </div>
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombrePag">
                                </div>
                                <div class="form-group">
                                    <label for="apellido" class="form-label">Apellido</label>
                                    <input type="text" class="form-control" id="apellido" name="apellidoPag">
                                </div>
                                <div class="form-group">
                                    <label for="fechaIngreso" class="form-label">Fecha de Ingreso</label>
                                    <input type="date" class="form-control" id="fechaIngreso" name="fechaIngresoPag">
                                </div>
                                <div class="form-group">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="emailPag">
                                </div>
                                <div class="form-group">
                                    <label for="telefono" class="form-label">Telefono</label>
                                    <input type="text" class="form-control" id="telefono" name="telefonoPag">
                                </div>
                                <div class="form-group">
                                    <label for="sexo" class="form-label">Sexo</label>
                                    <input type="text" class="form-control" id="sexo" name="sexoPag">
                                </div>
                                <div class="form-group">
                                    <label for="sueldo" class="form-label">Sueldo</label>
                                    <input type="text" class="form-control" id="sueldo" name="sueldoPag">
                                </div>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Script para desplegar el menú de Gestión -->
    <script>
        let listElements = document.querySelectorAll('.nav-button--click');
    
        listElements.forEach(listElement => {
            listElement.addEventListener('click', () => {
                listElement.classList.toggle('arrow');
    
                // Selecciona el icono dentro del botón y aplica la rotación
                let icon = listElement.querySelector('.bx-chevron-down');
                icon.classList.toggle('rotate');
    
                let height = 0;
                let menu = listElement.nextElementSibling;
                if (menu.clientHeight === 0) {
                    height = menu.scrollHeight;
                }
    
                menu.style.height = height + "px";
            });
        });
    </script>
    
    <!-- Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('.editar-producto').click(function() {
                var button = $(this);
                var id = button.data('id');
                var cargo = button.data('cargo');
                var nombre = button.data('nombre');
                var apellido = button.data('apellido');
                var fechaIngreso = button.data('fechaingreso');
                var email = button.data('email');
                var telefono = button.data('telefono');
                var sexo = button.data('sexo');
                var sueldo = button.data('sueldo');
    
                $('#id').val(id);
                $('#cargo').val(cargo);
                $('#nombre').val(nombre);
                $('#apellido').val(apellido);
                $('#fechaIngreso').val(fechaIngreso);
                $('#email').val(email);
                $('#telefono').val(telefono);
                $('#sexo').val(sexo);
                $('#sueldo').val(sueldo);
            });
        });
    </script>
    <script>
        document.querySelectorAll('.editar-btn').forEach(button => {
            button.addEventListener('click', () => {
                // Lógica para editar el puesto
                console.log('Editar');
            });
        });
        
        document.querySelectorAll('.eliminar-btn').forEach(button => {
            button.addEventListener('click', () => {
                // Lógica para eliminar el puesto
                console.log('Eliminar');
            });
        });
    </script>
</body>
</html>