<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
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
        form {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 500px;
            margin: auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 1rem;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #1976d2; /* Blue color */
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #1565c0; /* Darker blue */
        }
        a {
            display: inline-block;
            margin-top: 20px;
            color: #ffffff;
            text-decoration: none;
            font-size: 1rem;
            font-weight: bold;
            background-color: #d32f2f; /* Red color */
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            background-color: #b71c1c; /* Darker red */
            transform: scale(1.05);
        }
        @keyframes gradientAnimation {
            0% { background-position: 0% 0%; }
            50% { background-position: 100% 100%; }
            100% { background-position: 0% 0%; }
        }
    </style>
</head>
<body>
    <h2>Edit Task</h2>
    <form action="EditTaskServlet" method="post">
        <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
        <label for="project">Project:</label>
        <input type="text" id="project" name="project" value="<%= task.getString("project") %>"><br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<%= task.getDate("date") %>"><br>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>"><br>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>"><br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="<%= task.getString("category") %>"><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"><%= task.getString("description") %></textarea><br>
        <input type="submit" value="Update Task">
    </form>
    <a href="taskPage.jsp">Back to Task Management</a>
</body>
</html>
<%
    }
%>
