<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 2.5rem;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.4);
        }
        a {
            display: inline-block;
            margin: 10px 20px;
            padding: 10px 20px;
            color: #ffffff;
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: bold;
            background-color: #1976d2; /* Blue color */
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            background-color: #1565c0; /* Darker blue */
            transform: scale(1.05);
        }
        .logout {
            background-color: #d32f2f; /* Red color */
            border: 2px solid #b71c1c; /* Darker red */
        }
        .logout:hover {
            background-color: #c62828; /* Darker red */
            border-color: #b71c1c; /* Darker red border */
        }
        @keyframes gradientAnimation {
            0% { background-position: 0% 0%; }
            50% { background-position: 100% 100%; }
            100% { background-position: 0% 0%; }
        }
    </style>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    <%
        if ("Admin".equals(role)) {
    %>
    <a href="adminPage.jsp">Admin Page</a><br>
    <%
        } else {
    %>
    <a href="taskPage.jsp">Task Management</a><br>
    <a href="associaterPage.jsp">View Associate</a>
    <%
        }
    %>
    <a class="logout" href="LogoutServlet">Logout</a>
</body>
</html>
