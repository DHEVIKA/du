<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/kTcsmT8CXFfT3QpSt57roJs/1P5qIDU+t0aVxn0wo6pvpE6l/56vpuvqxU6nQy7mHuwf6tL18Ssg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(120deg, #ff6f61, #64b5f6);
            background-size: 200% 200%;
            animation: gradientAnimation 8s ease infinite;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        .admin-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
            width: 100%;
            max-width: 400px;
        }
        .admin-container h2 {
            margin-bottom: 20px;
            font-size: 2.5rem;
            font-weight: 700;
            color: #333;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
        }
        .admin-container ul {
            list-style: none;
            padding: 0;
        }
        .admin-container ul li {
            margin: 10px 0;
        }
        .admin-container a {
            display: block;
            color: #4d79ff;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            background: rgba(54, 162, 235, 0.2);
            border: 1px solid #4d79ff;
            transition: background 0.3s ease-in-out, color 0.3s ease-in-out, text-shadow 0.3s ease;
        }
        .admin-container a:hover {
            background: #4d79ff;
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.4);
        }
        .admin-container a i {
            margin-right: 10px;
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
    <div class="admin-container">
        <h2>Admin Page</h2>
        <ul>
            <li><a href="viewAllTasks.jsp"><i class="fas fa-tasks"></i>View All Tasks</a></li>
            <li><a href="viewAllCharts.jsp"><i class="fas fa-chart-bar"></i>View All Charts</a></li>
        </ul>
        <a href="dashboard.jsp"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
    </div>
</body>
</html>
