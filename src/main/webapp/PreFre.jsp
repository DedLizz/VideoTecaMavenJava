<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Preguntas Frecuentes</title>
        <link rel="icon" href="ImgNos/icon.png">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #2c2c2c;
                margin: 0;
                padding: 0;
            }

            h1{
                font-size: 80px;
                margin-bottom: 0px;
                text-align: center;
                color: #fff;
            }

            u{
                color:blueviolet;
            }

            .faq-container {
                max-width: 800px;
                margin: 50px auto;
                background-color: gray;
                padding: 20px;
                box-shadow: 0 0 10px #000;
            }

            h2 {
                font-size: 40px;
                text-align: center;
                color: #fff;
                margin-top: 0px;
                margin-bottom: 15px;
            }

            .faq-item {
                border-bottom: 1px solid #ccc;
                padding: 10px 0;
            }

            .faq-question {
                font-weight: bold;
                cursor: pointer;
                position: relative;
                padding-right: 20px;
                color: #fff;
            }

            .faq-question::after {
                content: '+';
                position: absolute;
                right: 0;
                top: 0;
                font-size: 20px;
                transition: transform 0.3s;
            }

            .faq-item.active .faq-question::after {
                content: '-';
                transform: rotate(180deg);
            }

            .faq-answer {
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.3s ease;
                color: #fff;
            }

            .faq-item.active .faq-answer {
                max-height: 200px; /* Ajusta este valor según el contenido */
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
                <div class="faq-container">
                    <h2>Preguntas Frecuentes</h2>
                    <div class="faq-item">
                        <div class="faq-question">¿Que métodos de pagos aceptan?</div>
                        <div class="faq-answer">
                            <p>Aceptamos varios métodos de pago, incluyendo tarjetas de crédito, tarjetas de débito y plataformas de pago.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">¿Al suscribirme podre acceder a todos los videos?</div>
                        <div class="faq-answer">
                            <p>¡Sí! Al momento de suscribirte en VideoTeca podrás gozar de todos los videos en cualquier momento las veces que quieras</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">¿Puedo usar mi cuenta en más de 1 dispositivo?</div>
                        <div class="faq-answer">
                            <p>VideoTeca ofrece el beneficio de acceder desde cualquier dispositivo, siempre y cuando este pueda acceder a internet.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">¿Ofrecen algún tipo de suscripción mensual o anual?</div>
                        <div class="faq-answer">
                            <p>Sí, ofrecemos planes de suscripción mensual y anual que te permiten acceder a todos los videos disponibles en VideoTeca.</p>
                        </div>
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
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const faqItems = document.querySelectorAll('.faq-item');

                faqItems.forEach(item => {
                    const question = item.querySelector('.faq-question');
                    question.addEventListener('click', () => {
                        item.classList.toggle('active');
                    });
                });
            });
        </script>
    </body>
</html>
