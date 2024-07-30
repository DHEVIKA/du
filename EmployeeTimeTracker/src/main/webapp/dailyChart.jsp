<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Daily Tasks/Hours Pie Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #ff4d4d, #4d79ff);
            background-size: 200% 200%;
            animation: gradientAnimation 10s ease infinite;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 2.5rem;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.4);
        }
        canvas {
            width: 90% !important;
            max-width: 600px;
            height: 500px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1.5s ease-in-out;
        }
        a {
            margin-top: 30px;
            color: #ffffff;
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: bold;
            transition: color 0.3s ease, text-shadow 0.3s ease;
        }
        a:hover {
            color: #ffeb3b;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.6);
        }
        @keyframes gradientAnimation {
            0% { background-position: 0% 0%; }
            50% { background-position: 100% 100%; }
            100% { background-position: 0% 0%; }
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
    <h2>Daily Tasks/Hours Pie Chart for <%= username %></h2>
    <canvas id="dailyChart"></canvas>
    <a href="dashboard.jsp">Back to Dashboard</a>
    <script>
        fetch('DailyChartServlet')
        .then(response => response.json())
        .then(data => {
            console.log('Data received:', data);
            const labels = Object.keys(data);
            const values = Object.values(data);
            if (labels.length === 0 || values.length === 0) {
                console.warn('No data available for the chart.');
                return;
            }
            const ctx = document.getElementById('dailyChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.6)', // Bright red
                            'rgba(54, 162, 235, 0.6)', // Bright blue
                            'rgba(255, 206, 86, 0.6)', // Bright yellow
                            'rgba(75, 192, 192, 0.6)', // Bright teal
                            'rgba(153, 102, 255, 0.6)', // Bright purple
                            'rgba(255, 159, 64, 0.6)'  // Bright orange
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)', // Darker red
                            'rgba(54, 162, 235, 1)', // Darker blue
                            'rgba(255, 206, 86, 1)', // Darker yellow
                            'rgba(75, 192, 192, 1)', // Darker teal
                            'rgba(153, 102, 255, 1)', // Darker purple
                            'rgba(255, 159, 64, 1)'  // Darker orange
                        ],
                        borderWidth: 2,
                        hoverBorderColor: 'rgba(0, 0, 0, 0.8)' // Darker border on hover
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                            labels: {
                                font: {
                                    size: 14
                                }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.label + ': ' + tooltipItem.raw + ' hours';
                                }
                            },
                            backgroundColor: 'rgba(0, 0, 0, 0.7)',
                            titleFont: {
                                size: 16,
                                weight: 'bold'
                            },
                            bodyFont: {
                                size: 14
                            }
                        },
                        datalabels: {
                            display: true,
                            color: '#fff',
                            formatter: (value, context) => {
                                let sum = 0;
                                let dataArr = context.chart.data.datasets[0].data;
                                dataArr.map(data => {
                                    sum += data;
                                });
                                let percentage = (value / sum * 100).toFixed(2) + '%';
                                return `${context.chart.data.labels[context.dataIndex]}: ${percentage}`;
                            },
                            font: {
                                weight: 'bold',
                                size: 14
                            }
                        },
                        title: {
                            display: true,
                            text: "Daily Tasks/Hours",
                            font: {
                                size: 18,
                                weight: 'bold'
                            }
                        }
                    },
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
</body>
</html>
