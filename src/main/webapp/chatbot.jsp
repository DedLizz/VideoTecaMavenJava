<%-- 
    Document   : chatbot
    Created on : 27 jun. 2024, 23:06:45
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Página Web</title>
    <style>
        .chatbot-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            cursor: pointer;
            z-index: 1000;
        }
        
        .chatbot-icon img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .chatbot-popup {
            display: none;
            position: fixed;
            bottom: 90px;
            right: 20px;
            width: 400px;
            height: 600px;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }
        
        .chatbot-popup iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 50%;
            padding: 5px;
            width: 25px;
            height: 25px;
            text-align: center;
            line-height: 15px;
            font-weight: bold;
            z-index: 1001;
        }
    </style>
</head>
<body>
    <!-- Contenido de tu página web -->

    <div class="chatbot-icon" onclick="toggleChatbot()">
        <img src="URL_DEL_ICONO" alt="Chatbot Icon">
    </div>

    <div class="chatbot-popup" id="chatbotPopup">
        <div class="close-btn" onclick="toggleChatbot()">×</div>
        <iframe src="https://landbot.online/v3/H-2533554-AL69X0GS74IFEB7E/index.html"></iframe>
    </div>

    <script>
        function toggleChatbot() {
            var popup = document.getElementById('chatbotPopup');
            if (popup.style.display === 'none' || popup.style.display === '') {
                popup.style.display = 'block';
            } else {
                popup.style.display = 'none';
            }
        }
    </script>
</body>
</html>
