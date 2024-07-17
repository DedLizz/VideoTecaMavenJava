<%--
  Created by IntelliJ IDEA.
  User: brandon
  Date: 7/16/24
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Equipo VideoTeca</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: blue;
            margin: 0;
        }
        .modal {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .modal h2 {
            margin-bottom: 20px;
        }
        .modal textarea,
        .modal select,
        .modal input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .modal button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .modal button:hover {
            background-color: #ddd;
        }
        .btn-submit {
            background-color: green;
            color: white;
        }
        .btn-back {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
<div class="modal">
    <h2>Equipo VideoTeca</h2>
    <form action="ServletAdmin?accion=solicitud" method="post">
        <textarea name="habilidadesSoli" Style="width: 90%;" placeholder="Ingrese sus habilidades" required></textarea>
        <select name="tipoPersonaSoli" required>
            <option value="" disabled selected>Seleccione el tipo de persona</option>
            <option value="estudiante">Estudiante</option>
            <option value="profesor">Profesor</option>
            <option value="investigador">Investigador</option>
            <option value="otro">Otro</option>
        </select>
        <input type="email" Style="width: 90%;" name="correoSoli" placeholder="Correo personal" required>
        <p>Revisa tu correo para confirmar si tu solicitud fue aceptada. Atentamente, equipo VideoTeca. En el correo recibirás las instrucciones necesarias.</p>
        <button type="submit" class="btn-submit">Enviar Solicitud</button>
        <button type="button" class="btn-back" onclick="history.back()">Retroceder</button>
    </form>
</div>
</body>
</html>
