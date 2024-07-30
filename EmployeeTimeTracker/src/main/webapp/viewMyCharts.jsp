<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View My Charts</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #ff4d4d, #4d79ff); /* Red to Blue Gradient */
            margin: 0;
            padding: 0;
            color: #fff;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #333;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }
        li {
            margin: 10px 0;
        }
        a {
            color: #4d79ff; /* Blue color */
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #4d79ff; /* Blue color on hover */
            color: #fff;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4d79ff; /* Blue color */
            text-decoration: none;
            font-size: 16px;
            padding: 10px 20px;
            border: 2px solid #4d79ff; /* Blue border */
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        .back-link:hover {
            background-color: #4d79ff; /* Blue color */
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Charts</h2>
        <ul>
            <li><a href="dailyChart.jsp">View Daily Chart</a></li>
            <li><a href="weeklyChart.jsp">View Weekly Chart</a></li>
            <li><a href="monthlyChart.jsp">View Monthly Chart</a></li>
        </ul>
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>
</body>
</html>
