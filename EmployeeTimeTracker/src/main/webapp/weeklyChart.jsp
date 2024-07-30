<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Tasks/Hours Bar Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff4d4d, #4d79ff); /* Red to Blue Gradient */
            color: #fff;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        canvas {
            max-width: 100%;
            height: auto;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            color: #4d79ff; /* Blue color */
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #4d79ff; /* Blue border */
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #4d79ff; /* Blue color */
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Weekly Tasks/Hours Bar Chart for <%= username %></h2>
        <canvas id="weeklyChart" width="400" height="400"></canvas>
        <script>
            fetch('WeeklyChartServlet')
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('weeklyChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data.labels,
                        datasets: [{
                            label: 'Tasks/Hours',
                            data: data.data,
                            backgroundColor: 'rgba(77, 121, 255, 0.2)', // Blue color with transparency
                            borderColor: 'rgba(77, 121, 255, 1)', // Blue color
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        </script>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
<%
    }
%>
