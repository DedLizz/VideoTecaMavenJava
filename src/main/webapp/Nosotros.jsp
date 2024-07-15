<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="icon" href="imagenes/icon.png">
    <title>Nosotros</title>
    <style>
        body{
            background: #2c2c2c;;
            margin:0px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        
        h1{
            font-size: 80px;
            margin-bottom: 0px;
            color: rgb(255, 255, 255);
        }

        h2{
            font-size: 45px;
            padding-bottom: 0px;
            margin-bottom: 0px;
            color: rgb(255, 255, 255);
        }

        h3{
            font-size: 45px;
            margin-bottom: 0px;
            margin-left:420px;
            color: rgb(255, 255, 255);
        }
        
        h4{
            font-size: 45px;
            text-align: center;
            margin-bottom: 10px;
            color: rgb(255, 255, 255);
        }
        
        p{
            line-height: 30px;
            color: rgb(255, 255, 255);
        }

        u{
            color:blueviolet;
        }

        .header{
            padding-left: 13%;
            padding-right: 13%;
        }
        .Historia{
            display: flex;
        }
        .ImagenInicio .ImgI{
            width: 500px;
            margin-top: 20px;
        }

        .Texto{
            margin-left: 3%;
            width: 500px;
        }

        .Vista{
            display: flex;
        }

        .InicioVideoTeca .ImgI{
            width: 580px;
            margin-top: 20px;
        }

        .Equipo {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 20px;
        }
        .integrantes {
            text-align: center;
        }
        .integrantes img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }
        .integrantes p {
            margin-top: 10px;
            font-weight: bold;
        }

        .footer {
            background-color: #3a3a3a;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .footer a {
            color: white;
            text-decoration: none;
            display: block;
            margin: 5px 0;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .footer div {
            flex: 1;
            margin: 10px;
            min-width: 150px;
        }

        .footer .footer-logo {
            text-align: left;
        }

        .footer .footer-logo img {
            width: 100px;
        }

        .footer .footer-right {
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="Container">
        <div class="header">
            <u><h1>VideoTeca</h1></u>
            <div class="Historia">
                <div class="ImagenInicio">
                    <img class="ImgI" src="imagenes/imgInicio.jpg">
                </div>

                <div class="Texto">
                    <h2 >En 2024 desarrollamos una página para ayudar a los demás.</h2>
                    <p>En VideoTeca priorizamos la calidad de los videos, y así poder aportar en la mejoria de los conocimientos o el refuerzo de estos mismos para cualquier clase de persona, desde un profesor o graduado hasta un estudiante colegial de primaria.</p>
                </div>
            </div>
            
            
            <div class="Mision">
                <h3>Misión</h3>
                <p>Somos una empresa de servicio de videos que ofrecer los mejores videos de educación en una versión gratuita y otra versión de suscripción.</p>
            </div>
            <div class="Vision">
                <h3>Visión</h3>
                <p>Tener el mejor servicio de educación virtual mediante videos.</p>
            </div>

            <div class="Vista">
                <div class="Texto">
                    <h2 >Página de Inicio</h2>
                    <p>Aquí observamos la interface de de inicio, luego de realizar el inicio de sesión y seleccionar el plan que desea usar en la VideoTeca</p>
                </div>
                
                <div class="InicioVideoTeca">
                    <img class="ImgI" src="imagenes/Inicio.png"><br><br><br>
                </div>
            </div>
            <h4>Equipo encargado</h4>
            <div class="Equipo">
                
                <div class="integrantes">
                    <img src="imagenes/ImgJoseph.png" alt="Joseph, Baila A.">
                    <p>Joseph, Baila A.</p>
                </div>
                <div class="integrantes">
                    <img src="imagenes/ImgWilly.png" alt="Willy, Cortez R.">
                    <p>Willy, Cortez R.</p>
                </div>
                <div class="integrantes">
                    <img src="imagenes/ImgBrandon.jpg" alt="Brandon Hualpa B.">
                    <p>Brandon Hualpa B.</p>
                </div>
                <div class="integrantes">
                    <img src="imagenes/ImgEdgardo.png" alt="Edgardo Rabanal G.">
                    <p>Edgardo Rabanal G.</p>
                </div>
                <div class="integrantes">
                    <img src="imagenes/ImgJose.png" alt="José Rojas A.">
                    <p>José Rojas A.</p>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div>
                <a href="#">VideoTeca Inicio</a>
                <a href="#">Consigue la aplicación</a>
                <a href="Nosotros.jsp">¿Quiénes somos?</a>
                <a href="#">Ponte en contacto con nosotros</a>
            </div>
            <div>
                <a href="PreFre.jsp">Preguntas frecuentes</a>
                <a href="#">Blog</a>
                <a href="#">Ayuda y asistencia</a>
                <a href="#">Afiliado</a>
            </div>
            <div>
                <a href="#">Condiciones</a>
                <a href="#">Política de privacidad</a>
                <a href="#">Configuración de cookies</a>
                <a href="#">Ubicación</a>
            </div>
            <div class="footer-right">
                © 2024 VideoTeca, Inc.
            </div>
        </footer>
    </div>
</body>
</html>