<%-- 
    Document   : recuperardos
    Created on : 4 jun. 2024, 22:06:23
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Cuenta</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            background: linear-gradient(to bottom, #0f0067, #191543, #010157);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }
        
        .card {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease; /* Transición para el efecto de luz difuminada */
        }
        
        .card:hover {
            box-shadow: 0 8px 16px rgba(255, 255, 255, 0.2); /* Efecto de luz difuminada al pasar el mouse */
        }
        
        .card-title {
            color: #000; /* Color del título */
            text-align: center;
            font-size: 24px; /* Tamaño del título */
            margin-bottom: 20px;
            font-weight: bold;
        }
        
        .form-group label {
            color: #000; /* Color del texto del label */
            font-size: 18px; /* Tamaño del texto del label */
        }
        
        .form-control {
            background-color: #fff; /* Color de fondo del input */
            color: #333; /* Color del texto del input */
            border-color: #ccc; /* Color del borde del input */
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Sombra del input */
        }
        
        .btn-primary {
            background-color: #573b8a; /* Color de fondo del botón */
            border-color: #573b8a; /* Color del borde del botón */
            color: #fff; /* Color del texto del botón */
            font-size: 18px; /* Tamaño del texto del botón */
            transition: background-color 0.3s ease; /* Transición para el cambio de color al pasar el mouse */
        }
        
        .btn-primary:hover {
            background-color: #6d44b8; /* Color de fondo del botón al pasar el mouse */
            border-color: #6d44b8; /* Color del borde del botón al pasar el mouse */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body text-center">
                <h3 class="card-title">${sessionScope.nombre}<span id="userName"></span></h3>
                <p id="userEmail"></p>
                <p>Revisa tu correo electrónico para continuar con el proceso de recuperación de cuenta.</p>
                <button onclick="location.href='ServletRecuperarCuenta?accion=cerrar'" class="btn btn-primary btn-block">Volver</button>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
