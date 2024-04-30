<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

       #login-box {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.3); /* Increased shadow */
    padding: 40px;
    width: 300px;
}


        #login-box h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
        }
        .logo-container {
        margin-left:-40px;
      margin-bottom: 2px;
    }

    .logo-image {
      max-width: 380px;
    }
    </style>
</head>
<body>
    <div id="login-box">
        <form action="login" method="post">
        <div class="logo-container">
        
        </div>
            <h2>Login Page</h2>

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" class="btn-custom">Login</button>

            <div class="error-message">
                ${error}
            </div>
        </form>
    </div>
</body>
</html>
