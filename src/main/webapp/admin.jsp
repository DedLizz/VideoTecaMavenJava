<%--
  Created by IntelliJ IDEA.
  User: brandon
  Date: 7/16/24
  Time: 2:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #2e0066;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background-color: #4b0082;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        .icon-wrapper {
            width: 4rem;
            height: 4rem;
            margin-bottom: 1rem;
            background-color: #ff6f61;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .icon-wrapper svg {
            width: 2rem;
            height: 2rem;
            color: white;
        }
        .title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ff6f61;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: medium;
            color: white;
        }
        .form-group input {
            width: 100%;
            height: 2.5rem;
            margin-top: 0.25rem;
            padding: 0.5rem;
            font-size: 0.875rem;
            border: 1px solid #cccccc;
            border-radius: 0.375rem;
            background-color: #f3f3f3;
            outline: none;
        }
        .form-group input:focus {
            border-color: #ff6f61;
            box-shadow: 0 0 0 2px rgba(255, 111, 97, 0.2);
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        .checkbox-group input[type="checkbox"] {
            width: 1rem;
            height: 1rem;
            margin-right: 0.5rem;
        }
        .checkbox-group label {
            font-size: 0.875rem;
            color: white;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 2.5rem;
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
            font-weight: medium;
            color: white;
            background-color: #ff6f61;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .btn:hover {
            background-color: #e65c50;
        }
        .links {
            margin-top: 1.5rem;
            text-align: center;
        }
        .links a {
            display: block;
            font-size: 0.875rem;
            color: #ff6f61;
            text-decoration: none;
            margin-top: 0.5rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="icon-wrapper">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                <circle cx="12" cy="7" r="4"></circle>
            </svg>
        </div>
        <h2 class="title">Registro</h2>
    </div>
    <form action="ServletAdmin?accion=registro" method="post">
        <div class="form-group">
            <label for="name">Nombre</label>
            <input id="name" type="text" placeholder="Ingresa tu nombre"  name="nombreAdmPag"/>
        </div>
        <div class="form-group">
            <label for="lastName">Apellido</label>
            <input id="lastName" type="text" placeholder="Ingresa tu apellido" name="apellidoAdmPag"/>
        </div>
        <div class="form-group">
            <label for="password">Contraseña</label>
            <input id="password" type="password" placeholder="Ingresa tu contraseña" name="contrasenaAdmPag"/>
        </div>
        <div class="form-group">
            <label for="phone">Teléfono</label>
            <input id="phone" type="text" placeholder="Ingresa tu número de teléfono" name="telefonoAdmPag" />
        </div>
        <div class="form-group">
            <label>DNI</label>
            <input type="text" placeholder="Ingrese el DNI" name="dniAdmPag" />
        </div>

        <button type="submit" class="btn">REGISTRARSE</button>
    </form>

</div>
</body>
</html>
