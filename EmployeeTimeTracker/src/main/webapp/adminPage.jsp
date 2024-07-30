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
            background: linear-gradient(135deg, #ff4d4d, #4d79ff); /* Red to Blue Gradient */
            font-family: Arial, sans-serif;
            color: #fff;
        }
        .admin-container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
            width: 100%;
            max-width: 400px; /* Responsive width */
        }
        .admin-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
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
            color: #4d79ff; /* Blue color */
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
            background: rgba(54, 162, 235, 0.2);
            border: 1px solid #4d79ff; /* Blue border */
        }
        .admin-container a:hover {
            background: #4d79ff; /* Blue color on hover */
            color: #fff;
        }
        .admin-container a i {
            margin-right: 10px;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
