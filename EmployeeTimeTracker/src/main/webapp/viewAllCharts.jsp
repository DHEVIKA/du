<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
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
    <title>View All Charts</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #ff4d4d, #4d79ff); /* Red to Blue Gradient */
            font-family: Arial, sans-serif;
            color: #fff;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 80%;
            text-align: center;
        }
        li {
            margin-bottom: 10px;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            color: #333;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #fff; /* Solid white on hover */
            color: #ff4d4d; /* Red text on hover */
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4d79ff; /* Blue color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            text-decoration: none; /* Remove underline */
        }
        .btn:hover {
            background-color: #3c5db7; /* Darker blue */
        }
    </style>
</head>
<body>
    <h2>Charts Overview</h2>
    <ul>
        <li><a href="AllDailyChart.jsp">View Daily Chart</a></li>
        <li><a href="AllWeeklyChart.jsp">View Weekly Chart</a></li>
        <li><a href="AllMonthlyChart.jsp">View Monthly Chart</a></li>
    </ul>
    <a href="dashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>
