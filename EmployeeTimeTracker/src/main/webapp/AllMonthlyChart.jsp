<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Tasks/Hours Bar Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(120deg, #ff6f61, #64b5f6);
            background-size: 200% 200%;
            animation: gradientAnimation 10s ease infinite;
            font-family: 'Roboto', sans-serif;
            color: #333;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: 700;
            color: #d32f2f; /* Red color */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
        .chart-container {
            width: 90%;
            max-width: 800px;
            margin: 20px;
            padding: 20px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 1s ease-in-out;
        }
        canvas {
            width: 100% !important;
            height: 400px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        a {
            margin-top: 20px;
            color: #1976d2; /* Blue color */
            text-decoration: none;
            font-size: 1rem;
            font-weight: bold;
            transition: color 0.3s ease, text-shadow 0.3s ease;
        }
        a:hover {
            color: #1565c0; /* Darker blue */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
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
    <div class="chart-container">
        <h2>Monthly Tasks/Hours Bar Chart</h2>
        <canvas id="ALLMonthlyChart"></canvas>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
    <script>
        fetch('AllMonthlyChartServlet')
        .then(response => response.json())
        .then(data => {
            console.log("Data received from servlet:", data); // Debugging log

            const ctx = document.getElementById('ALLMonthlyChart').getContext('2d');

            const labels = new Set();
            const datasetMap = {};

            // Process userTasks to get labels and datasetMap
            for (const [username, userData] of Object.entries(data.userTasks)) {
                datasetMap[username] = [];
                userData.labels.forEach((day, index) => {
                    labels.add(day);
                    datasetMap[username].push({
                        x: day,
                        y: userData.data[index]
                    });
                });
            }

            // Convert labels Set to an array and sort it
            const sortedLabels = Array.from(labels).sort();

            // Prepare datasets
            const datasets = Object.keys(datasetMap).map(username => ({
                label: username,
                data: datasetMap[username].map(point => ({ x: point.x, y: point.y })),
                backgroundColor: 'rgba(255, 99, 132, 0.6)', // Light red color
                borderColor: 'rgba(255, 99, 132, 1)',       // Darker red for borders
                borderWidth: 1,
                hoverBackgroundColor: 'rgba(255, 99, 132, 0.8)', // Darker red on hover
                hoverBorderColor: 'rgba(255, 99, 132, 1)'        // Consistent hover border color
            }));

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: sortedLabels,
                    datasets: datasets
                },
                options: {
                    responsive: true,
                    animation: {
                        duration: 1000, // Animation duration
                        easing: 'easeInOutBounce' // Animation easing
                    },
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
                            }
                        },
                        title: {
                            display: true,
                            text: "Monthly Tasks/Hours",
                            font: {
                                size: 18,
                                weight: 'bold'
                            }
                        }
                    },
                    scales: {
                        x: {
                            type: 'category',
                            ticks: {
                                autoSkip: true,
                                maxTicksLimit: 10
                            }
                        },
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error("Error fetching data:", error); // Debugging log
        });
    </script>
</body>
</html>
<%
    }
%>
