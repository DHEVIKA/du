<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        .login-container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
            width: 100%;
            max-width: 400px; /* Responsive width */
        }
        .login-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .login-container label {
            display: block;
            font-size: 14px;
            margin-bottom: 8px;
            color: #555;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 22px); /* Adjust width to account for padding and border */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: all 0.3s ease-in-out;
        }
        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            border-color: #4d79ff; /* Blue color */
            box-shadow: 0 0 5px rgba(77, 121, 255, 0.5);
            outline: none; /* Remove default outline */
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #ff4d4d; /* Red color */
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
        }
        .login-container input[type="submit"]:hover {
            background: #e04343; /* Darker red */
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
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
    </div>
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            if(username === '' || password === '') {
                alert('Please fill in all fields');
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
