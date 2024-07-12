<%-- 
    Document   : grafico
    Created on : 15 jun. 2024, 18:54:02
    Author     : Brandon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gráfico de Videos por Categoría</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body{
            background: black;
        }
        #chart-container {
            width: 80%; /* Ajusta el ancho como desees */
            margin: auto;
        }
        canvas {
            width: 100% !important;
            height: auto !important; /* Ajusta la altura según tus necesidades */
        }
        .content {
            display: flex;
            flex-direction: column;
        }
        .botones {
            margin-top: -15vh;
            justify-content: space-around;
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="content" >
        
        <h1 style="text-align: center;">Cantidad de Videos por Categoría</h1>
        <div id="chart-container">
            <canvas id="myChart"></canvas>
        </div>
        <div class="botones" >
            <a type="button" class="btn btn-primary" href="ServletCategoria?accion=pdf" >Categorias PDF</a>
            <a type="button" class="btn btn-primary" href="ServletCategoria?accion=exel" >Categorias exel</a>
        </div>
        
    </div>

    
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Función para obtener y actualizar los datos del gráfico
        function actualizarGrafico() {
            fetch('ServletCategoria?accion=grafico')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al realizar la solicitud');
                    }
                    return response.json();
                })
                .then(data => {
                    var nombresCategorias = data.nombreCategorias;
                    var cantidadVideos = data.cantidadVideos;

                    // Configurar el gráfico con Chart.js
                    var ctx = document.getElementById('myChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: nombresCategorias,
                            datasets: [{
                                label: 'Cantidad de Videos',
                                data: cantidadVideos,
                                backgroundColor: 'rgba(255, 99, 132, 0.2)', // Color de fondo ajustado
                                borderColor: 'rgba(255, 99, 132, 1)', // Color del borde ajustado
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    ticks: {
                                        color: 'white' // Color de los ticks del eje y
                                    },
                                    grid: {
                                        color: 'rgba(255, 255, 255, 0.1)' // Color de las líneas de la grilla del eje y
                                    }
                                },
                                x: {
                                    ticks: {
                                        color: 'white' // Color de los ticks del eje x
                                    },
                                    grid: {
                                        color: 'rgba(255, 255, 255, 0.1)' // Color de las líneas de la grilla del eje x
                                    }
                                }
                            },
                            plugins: {
                                legend: {
                                    labels: {
                                        color: 'white' // Color de las etiquetas de la leyenda
                                    }
                                }
                            }
                        }
                    });
                })
                .catch(error => {
                    console.error('Error al intentar obtener los datos:', error);
                });
        }

        // Llamar a la función al cargar la página
        actualizarGrafico();
    });
</script>
</body>
</html>

