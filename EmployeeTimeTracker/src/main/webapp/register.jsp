<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff4d4d, #4d79ff); /* Red to Blue Gradient */
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }
        .input-container {
            position: relative;
            margin-bottom: 20px;
        }
        .input-container i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #999;
        }
        input[type="text"], input[type="password"], select {
            width: calc(100% - 30px);
            padding: 10px;
            padding-left: 30px;
            border: none;
            border-radius: 4px;
            outline: none;
            background: #f0f0f0;
        }
        input[type="submit"] {
            background-color: #ff4d4d; /* Red color */
            border: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #e60000; /* Darker red */
        }
        select {
            padding-left: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <div class="input-container">
                <i class="fas fa-user"></i>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-container">
                <i class="fas fa-lock"></i>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-container">
                <i class="fas fa-user-tag"></i>
                <label for="role">Role:</label>
                <select id="role" name="role" required>
                    <option value="Admin">Admin</option>
                    <option value="Associate">Associate</option>
                </select>
            </div>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>